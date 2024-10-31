using System;
using System.Data.SqlClient; // Necessário para SqlConnection, SqlCommand, SqlDataReader
using System.Configuration; // Necessário para ConfigurationManager
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Porta_Memória
{
    public partial class Lixeira : System.Web.UI.Page
    {
        // Declare rptLixeira como um Repeater em vez de object
        protected Repeater rptLixeira;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarDocumentosNaLixeira();
            }
        }

        private void CarregarDocumentosNaLixeira()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT DocumentoID, TipoDocumento FROM Documentos WHERE Lixeira = 1";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptLixeira.DataSource = reader;
                    rptLixeira.DataBind();
                }
            }
        }

        protected void btnDeletePermanently_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int documentoID = Convert.ToInt32(btn.CommandArgument);

            ExcluirDocumentoPermanente(documentoID);

            CarregarDocumentosNaLixeira();
        }

        private void ExcluirDocumentoPermanente(int documentoID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Documentos WHERE DocumentoID = @DocumentoID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DocumentoID", documentoID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnRestore_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int documentoID = Convert.ToInt32(btn.CommandArgument);

            RestaurarDocumento(documentoID);

            CarregarDocumentosNaLixeira();
        }

        private void RestaurarDocumento(int documentoID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Documentos SET Lixeira = 0 WHERE DocumentoID = @DocumentoID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DocumentoID", documentoID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
