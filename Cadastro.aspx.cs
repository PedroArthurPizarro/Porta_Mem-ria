using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Porta_Memória
{
    public partial class Cadastro : System.Web.UI.Page
    {
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

            if (senha != confirmarSenha)
            {
                lblMensagem.Text = "As senhas não coincidem!";
                lblMensagem.ForeColor = System.Drawing.Color.Red;
                return; // Interrompe o processamento se as senhas não coincidirem
            }

            string conexao = WebConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(conexao))
            {
                try
                {
                    conn.Open();
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

                    string SQL = "INSERT INTO dbo.PortaMemoria (NOME, SOBRENOME, EMAIL, TELEFONE, CPF, SENHA, TIPO) VALUES (@Nome, @Sobrenome, @Email, @Telefone, @Cpf, @Senha, 'USER')";
                    using (SqlCommand cmd = new SqlCommand(SQL, conn))
                    {
                        cmd.Parameters.AddWithValue("@Nome", nomeUsuario);
                        cmd.Parameters.AddWithValue("@Sobrenome", sobrenomeUsuario);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Telefone", telefone);
                        cmd.Parameters.AddWithValue("@Cpf", cpf);
                        cmd.Parameters.AddWithValue("@Senha", senha); // Sem criptografia

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
