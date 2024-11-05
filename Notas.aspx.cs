using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Porta_Memória
{
    public partial class Notas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UsuarioId"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    CarregarConteudoBlocoNotas();
                }
            }
        }

        private void CarregarConteudoBlocoNotas()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
            int usuarioId = (int)Session["UsuarioId"];

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT Conteudo FROM Documentos WHERE UsuarioID = @UsuarioID AND TipoDocumento = 'BlocoDeNotas' AND Lixeira = 0";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UsuarioID", usuarioId);
                    connection.Open();

                    var conteudo = command.ExecuteScalar();
                    if (conteudo != null)
                    {
                        TextBoxConteudoDoc.Text = conteudo.ToString();
                    }
                    else
                    {
                        TextBoxConteudoDoc.Text = ""; // Exibir campo vazio se não houver conteúdo salvo
                    }
                }
            }
        }

        protected void ButtonSalvar_Click(object sender, EventArgs e)
        {
            string conteudoDocumento = TextBoxConteudoDoc.Text.Trim();
            int usuarioId = (int)Session["UsuarioId"];

            if (!string.IsNullOrEmpty(conteudoDocumento))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    // Usar MERGE para inserir ou atualizar o conteúdo do bloco de notas
                    string query = "MERGE INTO Documentos AS target " +
                                   "USING (SELECT @UsuarioID AS UsuarioID) AS source " +
                                   "ON (target.UsuarioID = source.UsuarioID AND target.TipoDocumento = 'BlocoDeNotas' AND target.Lixeira = 0) " +
                                   "WHEN MATCHED THEN " +
                                   "   UPDATE SET Conteudo = @Conteudo, DataInsercao = GETDATE() " +
                                   "WHEN NOT MATCHED THEN " +
                                   "   INSERT (UsuarioID, TipoDocumento, Conteudo, DataInsercao, Lixeira) " +
                                   "   VALUES (@UsuarioID, 'BlocoDeNotas', @Conteudo, GETDATE(), 0);";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UsuarioID", usuarioId);
                        cmd.Parameters.AddWithValue("@Conteudo", conteudoDocumento);

                        conn.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Conteúdo salvo com sucesso!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "Erro ao salvar conteúdo.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                }

                CarregarConteudoBlocoNotas();
            }
            else
            {
                lblMessage.Text = "Por favor, insira conteúdo no bloco de notas.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ButtonLimpar_Click(object sender, EventArgs e)
        {
            TextBoxConteudoDoc.Text = "";
            lblMessage.Text = "Conteúdo limpo!";
            lblMessage.ForeColor = System.Drawing.Color.Blue;
        }

        protected void LinkButtonVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}
