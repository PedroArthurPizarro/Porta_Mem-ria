using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Porta_Memória
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Código a ser executado ao carregar a página
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUsername.Text.Trim();
            string senha = txtPassword.Text.Trim();

            string conexao = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
            // Ajustado para refletir a estrutura da tabela
            string SQL = "SELECT * FROM PortaMemoria WHERE EMAIL = @Var1 AND SENHA = @Var2";

            SqlDataReader dr = null;
            SqlConnection conn = null;

            try
            {
                conn = new SqlConnection(conexao);
                conn.Open();

                SqlCommand cmd = new SqlCommand(SQL, conn);
                cmd.Parameters.AddWithValue("@Var1", usuario);
                cmd.Parameters.AddWithValue("@Var2", senha);
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

                        if (tipo == "adm")
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
