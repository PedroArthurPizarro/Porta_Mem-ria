using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace Porta_Memória
{
    public partial class Cadastro : System.Web.UI.Page
    {
        // Função para gerar o hash SHA-256 da senha
        public static string GetSha256Hash(string valor)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Converte a senha em bytes e gera o hash
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(valor));

                // Converte o hash em uma string hexadecimal
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            string nomeUsuario = txtNome.Text.Trim();
            string sobrenomeUsuario = txtSobrenome.Text.Trim();
            string email = txtEmail.Text.Trim();
            string telefone = txtTelefone.Text.Trim();
            string cpf = txtCpf.Text.Trim();
            string senha = txtSenha.Text.Trim();
            string confirmarSenha = txtConfirmarSenha.Text.Trim();

            // Verifica se os campos obrigatórios estão preenchidos
            if (string.IsNullOrWhiteSpace(nomeUsuario) ||
                string.IsNullOrWhiteSpace(sobrenomeUsuario) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(telefone) ||
                string.IsNullOrWhiteSpace(cpf) ||
                string.IsNullOrWhiteSpace(senha) ||
                string.IsNullOrWhiteSpace(confirmarSenha))
            {
                lblMensagem.Text = "Todos os campos são obrigatórios!";
                lblMensagem.ForeColor = System.Drawing.Color.Red;
                return; // Interrompe o processamento se algum campo estiver vazio
            }

            // Verifica se as senhas coincidem
            if (senha != confirmarSenha)
            {
                lblMensagem.Text = "As senhas não coincidem!";
                lblMensagem.ForeColor = System.Drawing.Color.Red;
                return; // Interrompe o processamento se as senhas não coincidirem
            }

            // Aplica o hash SHA-256 à senha
            string senhaHash = GetSha256Hash(senha);

            // String de conexão ao banco de dados
            string conexao = WebConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(conexao))
            {
                try
                {
                    conn.Open();

                    // Verifica se o email já existe no banco
                    string checkEmailQuery = "SELECT COUNT(*) FROM dbo.PortaMemoria WHERE EMAIL = @Email";
                    using (SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, conn))
                    {
                        checkEmailCmd.Parameters.AddWithValue("@Email", email);
                        int emailCount = (int)checkEmailCmd.ExecuteScalar();

                        if (emailCount > 0)
                        {
                            lblMensagem.Text = "Este email já está cadastrado.";
                            lblMensagem.ForeColor = System.Drawing.Color.Red;
                            return; // Interrompe o processamento se o email já estiver cadastrado
                        }
                    }

                    // Insere o novo usuário com a senha em hash SHA-256
                    string SQL = "INSERT INTO dbo.PortaMemoria (NOME, SOBRENOME, EMAIL, TELEFONE, CPF, SENHA, TIPO) VALUES (@Nome, @Sobrenome, @Email, @Telefone, @Cpf, @Senha, 'USER')";
                    using (SqlCommand cmd = new SqlCommand(SQL, conn))
                    {
                        cmd.Parameters.AddWithValue("@Nome", nomeUsuario);
                        cmd.Parameters.AddWithValue("@Sobrenome", sobrenomeUsuario);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Telefone", telefone);
                        cmd.Parameters.AddWithValue("@Cpf", cpf);
                        cmd.Parameters.AddWithValue("@Senha", senhaHash); // Agora com senha em hash SHA-256

                        int rows = cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            lblMensagem.Text = "Cadastro realizado com sucesso!";
                            lblMensagem.ForeColor = System.Drawing.Color.Green;
                            Response.Redirect("~/Login.aspx");
                        }
                        else
                        {
                            lblMensagem.Text = "Erro ao cadastrar usuário. Tente novamente.";
                            lblMensagem.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMensagem.Text = "Erro ao cadastrar usuário: " + ex.Message;
                    lblMensagem.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}