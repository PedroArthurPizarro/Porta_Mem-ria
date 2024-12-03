using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace Porta_Memória
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Código a ser executado ao carregar a página
        }

        // Função para gerar o hash SHA-256 da senha
        public static string GetSha256Hash(string valor)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(valor));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsername.Text.Trim();
            string senha = txtPassword.Text.Trim();

            // Gera o hash SHA-256 da senha inserida
            string senhaHash = GetSha256Hash(senha);

            string conexao = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
            // Ajustado para refletir a estrutura da tabela
            string SQL = "SELECT * FROM PortaMemoria WHERE EMAIL = @Email AND SENHA = @Senha";

            SqlDataReader dr = null;
            SqlConnection conn = null;

            try
            {
                conn = new SqlConnection(conexao);
                conn.Open();

                SqlCommand cmd = new SqlCommand(SQL, conn);
                cmd.Parameters.AddWithValue("@Email", usuario);
                cmd.Parameters.AddWithValue("@Senha", senhaHash); // Usa o hash da senha para comparação
                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        // Definindo o ID do usuário na sessão após o login bem-sucedido
                        Session["UsuarioId"] = dr["USER"];
                        FormsAuthentication.SetAuthCookie(usuario, false);

                        // Obtendo o tipo do usuário
                        string tipo = dr["TIPO"].ToString().Trim().ToLower(); // Remove espaços e converte para minúsculo

                        // Verificação do valor de TIPO para debug
                        lblMessage.Text = $"Tipo de usuário: {tipo}"; // Apenas para verificação
                        lblMessage.Visible = true;

                        if (tipo == "admin")
                        {
                            Response.Redirect("~/ADMIN.aspx"); // Redireciona para a página ADMIN.aspx se for administrador
                        }
                        else
                        {
                            Response.Redirect("~/Index.aspx"); // Redireciona para a página Index.aspx para outros usuários
                        }
                    }
                }
                else
                {
                    // Falha na autenticação
                    lblMessage.Text = "Usuário ou senha inválidos. Por favor, tente novamente.";
                    lblMessage.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Tratar exceções
                lblMessage.Text = "Falha ao consultar os dados no banco de dados. Erro: " + ex.Message;
                lblMessage.Visible = true;
            }
            finally
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Cadastro.aspx");
        }
    }
}