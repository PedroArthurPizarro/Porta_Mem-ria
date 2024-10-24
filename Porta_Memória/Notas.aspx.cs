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
                    CarregarConteudoBlocoNotas(); // Carrega o conteúdo do bloco de notas ao recarregar a página
                }
            }
        }

        // Método para carregar o conteúdo do bloco de notas do banco de dados
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
                }
            }
        }

        // Evento para salvar o conteúdo do bloco de notas
        protected void ButtonSalvar_Click(object sender, EventArgs e)
        {
            string conteudoDocumento = TextBoxConteudoDoc.Text.Trim();
            int usuarioId = (int)Session["UsuarioId"];

            if (!string.IsNullOrEmpty(conteudoDocumento))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "MERGE INTO Documentos AS target " +
                                   "USING (SELECT @UsuarioID AS UsuarioID) AS source " +
                                   "ON (target.UsuarioID = source.UsuarioID AND target.TipoDocumento = 'BlocoDeNotas') " +
                                   "WHEN MATCHED THEN " +
                                   "   UPDATE SET Conteudo = @Conteudo, DataInsercao = GETDATE() " +
                                   "WHEN NOT MATCHED THEN " +
                                   "   INSERT (UsuarioID, TipoDocumento, Conteudo, DataInsercao) " +
                                   "   VALUES (@UsuarioID, 'BlocoDeNotas', @Conteudo, GETDATE());";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UsuarioID", usuarioId);
                        cmd.Parameters.AddWithValue("@Conteudo", conteudoDocumento);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.Text = "Conteúdo salvo com sucesso!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Recarregar o conteúdo após salvar
                CarregarConteudoBlocoNotas();
            }
            else
            {
                lblMessage.Text = "Por favor, insira conteúdo no bloco de notas.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
