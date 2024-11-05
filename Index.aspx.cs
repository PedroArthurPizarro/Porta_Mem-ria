using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Porta_Memória
{
    public partial class WebForm1 : System.Web.UI.Page
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
                    int usuarioId;
                    if (int.TryParse(Session["UsuarioId"].ToString(), out usuarioId))
                    {
                        string nomeUsuario = ObterNomeUsuario(usuarioId);

                        // Define o texto do Label com o nome do usuário
                        Label7.Text = $"Documentos de <span style='color: #e1c818;'>{nomeUsuario}</span>";
                        Label7.Text = Label7.Text.Replace("<span style='color: #e1c818;'>", "<span style='color: #e1c818;'>");
                    }
                    else
                    {
                        Label7.Text = "Erro ao carregar nome do usuário.";
                    }
                }
            }
        }




        // Carregar documentos do banco de dados
        private void CarregarDocumentos()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
            int usuarioId = (int)Session["UsuarioId"];

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Carregar apenas documentos que não são do tipo 'BlocoDeNotas'
                string query = "SELECT DocumentoID, TipoDocumento, Conteudo FROM Documentos WHERE UsuarioID = @UsuarioID AND TipoDocumento = 'Documento' AND Lixeira = 0";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UsuarioID", usuarioId);
                    connection.Open();

                    // Usar DataTable para armazenar os dados
                    DataTable dataTable = new DataTable();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    }

                    // Associar os dados ao Repeater
                    rptDocuments.DataSource = dataTable;
                    rptDocuments.DataBind();
                }
            }
        }


        protected void ButtonAddDoc_Click(object sender, EventArgs e)
        {
            string nomeDocumento = TextBoxNomeDoc.Text.Trim();
            string conteudoDocumento = TextBoxConteudoDoc.Text.Trim();
            int usuarioId = (int)Session["UsuarioId"];

            if (!string.IsNullOrEmpty(nomeDocumento) && !string.IsNullOrEmpty(conteudoDocumento))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Documentos (UsuarioID, TipoDocumento, Conteudo, DataInsercao) VALUES (@UsuarioID, @TipoDocumento, @Conteudo, GETDATE())";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UsuarioID", usuarioId);
                        cmd.Parameters.AddWithValue("@TipoDocumento", nomeDocumento);
                        cmd.Parameters.AddWithValue("@Conteudo", conteudoDocumento);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Limpar campos após adicionar
                TextBoxNomeDoc.Text = "";
                TextBoxConteudoDoc.Text = "";

                // Recarregar documentos após a inserção
                CarregarDocumentos();
            }
            else
            {
                lblMessage.Text = "Por favor, preencha todos os campos.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            ImageButton btnEditar = (ImageButton)sender;
            var documentItem = (RepeaterItem)btnEditar.NamingContainer;

            // Encontrar a TextBox e torná-la editável
            TextBox txtDynamicContent = (TextBox)documentItem.FindControl("txtDynamicContent");
            txtDynamicContent.ReadOnly = false;

            // Forçar o foco na TextBox para iniciar a edição
            ScriptManager.RegisterStartupScript(this, this.GetType(), "enableEditScript", "enableEdit(document.getElementById('" + txtDynamicContent.ClientID + "'));", true);
        }

        protected void btnSaveDynamic_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int documentoID = Convert.ToInt32(btn.CommandArgument);

            // Encontre o item do repeater correspondente ao botão clicado
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            TextBox txtContent = (TextBox)item.FindControl("txtDynamicContent");

            if (txtContent != null)
            {
                string conteudo = txtContent.Text.Trim();
                SalvarConteudoDocumento(documentoID, conteudo);
                CarregarDocumentos();
            }
        }

        private void SalvarConteudoDocumento(int documentoID, string conteudo)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Documentos SET Conteudo = @Conteudo WHERE DocumentoID = @DocumentoID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Conteudo", conteudo);
                        cmd.Parameters.AddWithValue("@DocumentoID", documentoID);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        CarregarDocumentos();
                    }
                }

                Response.Write("Documento atualizado com sucesso!");
            }
            catch (Exception ex)
            {
                Response.Write("Erro ao atualizar documento: " + ex.Message);
            }
        }

        protected void btnDeleteDynamic_Click(object sender, EventArgs e)
        {
            // Obtém o botão que foi clicado
            ImageButton btnDelete = (ImageButton)sender;

            // Obtém o item do repeater correspondente ao botão clicado
            RepeaterItem item = (RepeaterItem)btnDelete.NamingContainer;

            // Extrai o ID do documento a partir do CommandArgument
            int documentoId = Convert.ToInt32(btnDelete.CommandArgument);

            // Chama o método para limpar o conteúdo do documento
            LimparConteudoDocumento(documentoId);

            // Limpa o conteúdo da TextBox correspondente
            TextBox txtDynamicContent = (TextBox)item.FindControl("txtDynamicContent");
            if (txtDynamicContent != null)
            {
                txtDynamicContent.Text = "";
            }

            // Recarrega a lista de documentos para refletir a limpeza
            CarregarDocumentos();
        }

        private void LimparConteudoDocumento(int documentoId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "UPDATE Documentos SET Conteudo = '' WHERE DocumentoID = @DocumentoID AND UsuarioID = @UsuarioID"; // Atualiza o conteúdo do documento
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@DocumentoID", documentoId);
                    command.Parameters.AddWithValue("@UsuarioID", Session["UsuarioId"]); // Adicione este parâmetro

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }


        protected void ButtonTrash_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string tipoDocumento = btn.CommandArgument;

            int documentoID = ObterDocumentoID(tipoDocumento);
            MoverParaLixeira(documentoID);

            // Atualiza a lista de documentos
            CarregarDocumentos();
        }

        protected void btnTrashDynamic_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int documentoID = Convert.ToInt32(btn.CommandArgument);

            MoverParaLixeira(documentoID);

            // Atualiza a lista de documentos
            CarregarDocumentos();
        }

        private void MoverParaLixeira(int documentoID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Documentos SET Lixeira = 1 WHERE DocumentoID = @DocumentoID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@DocumentoID", documentoID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void saveDocument(object sender, EventArgs e)
        {

            // Obtenha o botão que foi clicado
            Button btn = (Button)sender;
            // Obtenha o ID do documento (CommandArgument) para identificar qual documento salvar
            string documentoId = btn.CommandArgument;

            // Aqui você deve implementar a lógica para salvar o conteúdo do documento
            // Para isso, você pode acessar a TextBox correspondente ao documento a partir do Repeater
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            TextBox txtDynamicContent = (TextBox)item.FindControl("txtDynamicContent");

            // Exemplo: lógica para salvar o conteúdo no banco de dados
            string novoConteudo = txtDynamicContent.Text;

            // Adicione aqui o seu código para atualizar o banco de dados com novoConteudo usando documentoId

            // Se necessário, você pode mostrar uma mensagem de sucesso ou atualizar a interface
        }

        private int ObterDocumentoID(string tipoDocumento)
        {
            int documentoID = -1;
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
            int usuarioId = (int)Session["UsuarioId"];

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT DocumentoID FROM Documentos WHERE UsuarioID = @UsuarioID AND TipoDocumento = @TipoDocumento";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UsuarioID", usuarioId);
                    cmd.Parameters.AddWithValue("@TipoDocumento", tipoDocumento);

                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && int.TryParse(result.ToString(), out int id))
                    {
                        documentoID = id;
                    }
                }
            }
            return documentoID;
        }
        private string ObterNomeUsuario(int usuarioId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
            string nomeUsuario = string.Empty;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT NOME FROM PortaMemoria WHERE [USER] = @UsuarioID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UsuarioID", usuarioId);

                    connection.Open();

                    // Executa a consulta e converte o resultado para string
                    var result = command.ExecuteScalar();

                    if (result != null)
                    {
                        nomeUsuario = result.ToString();
                    }
                }
            }

            return nomeUsuario;
        }

protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Limpar a sessão do usuário
            Session.Clear();

            // Redirecionar para a página de login
            Response.Redirect("Login.aspx");
        }

    }
}