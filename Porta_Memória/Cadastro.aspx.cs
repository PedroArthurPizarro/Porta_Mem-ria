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

            // Verifica se as senhas coincidem
            if (senha != confirmarSenha)
            {
                lblMensagem.Text = "As senhas não coincidem!";
                lblMensagem.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string conexao = WebConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(conexao))
            {
                try
                {
                    conn.Open();

                    // Verifica se o email já existe
                    string checkEmailQuery = "SELECT COUNT(*) FROM dbo.PortaMemoria WHERE EMAIL = @Email";
                    using (SqlCommand checkEmailCmd = new SqlCommand(checkEmailQuery, conn))
                    {
                        checkEmailCmd.Parameters.AddWithValue("@Email", email);
                        int emailCount = (int)checkEmailCmd.ExecuteScalar();

                        if (emailCount > 0)
                        {
                            lblMensagem.Text = "Este email já está cadastrado.";
                            lblMensagem.ForeColor = System.Drawing.Color.Red;
                            return;
                        }
                    }

                    // Insere o novo usuário
                    string SQL = "INSERT INTO dbo.PortaMemoria (NOME, SOBRENOME, EMAIL, TELEFONE, CPF, SENHA, TIPO) VALUES (@Nome, @Sobrenome, @Email, @Telefone, @Cpf, @Senha, 'USER')";
                    using (SqlCommand cmd = new SqlCommand(SQL, conn))
                    {
                        cmd.Parameters.AddWithValue("@Nome", nomeUsuario);
                        cmd.Parameters.AddWithValue("@Sobrenome", sobrenomeUsuario);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Telefone", telefone);
                        cmd.Parameters.AddWithValue("@Cpf", cpf);
                        cmd.Parameters.AddWithValue("@Senha", senha);

                        int rows = cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            lblMensagem.Text = "Cadastro realizado com sucesso!";
                            lblMensagem.ForeColor = System.Drawing.Color.Green;
                            Response.Redirect("~/Login.aspx"); // Redireciona para a página de Login
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

        protected void txtConfirmarSenha_TextChanged(object sender, EventArgs e)
        {
            // Verifica se as senhas coincidem ao mudar o campo confirmar senha
            if (txtSenha.Text.Trim() != txtConfirmarSenha.Text.Trim())
            {
                lblMensagem.Text = "As senhas não coincidem!";
                lblMensagem.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                lblMensagem.Text = string.Empty; // Limpa a mensagem de erro se as senhas coincidirem
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}
