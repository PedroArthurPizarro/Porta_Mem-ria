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
                    CarregarDocumentos(); // Carrega os documentos e preenche os campos ao recarregar a página
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
                string query = "SELECT DocumentoID, TipoDocumento, Conteudo FROM Documentos WHERE UsuarioID = @UsuarioID AND Lixeira = 0";
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

                    // Preencher os campos correspondentes
                    foreach (DataRow row in dataTable.Rows)
                    {
                        string tipoDocumento = row["TipoDocumento"].ToString();
                        string conteudo = row["Conteudo"].ToString();
                    }
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

        // Método genérico para salvar qualquer documento
        private void SalvarDocumento(string tipoDocumento, string conteudo)
        {
            try
            {
                int usuarioId = (int)Session["UsuarioId"];

                if (!string.IsNullOrEmpty(conteudo))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO Documentos (UsuarioID, TipoDocumento, Conteudo, DataInsercao) VALUES (@UsuarioID, @TipoDocumento, @Conteudo, GETDATE())";
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@UsuarioID", usuarioId);
                            cmd.Parameters.AddWithValue("@TipoDocumento", tipoDocumento);
                            cmd.Parameters.AddWithValue("@Conteudo", conteudo);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Limpar o campo de conteúdo após salvar
                    LimparCampo(tipoDocumento);
                    CarregarDocumentos();
                }
                else
                {
                    // Exibir mensagem de erro ou alerta para o usuário
                    Response.Write($"Por favor, insira um {tipoDocumento} válido.");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Erro ao salvar o {tipoDocumento}: {ex.Message}");
            }
        }


        private void LimparCampo(string tipoDocumento)
        {
            
            CarregarDocumentos();
        }

        // Eventos dos botões salvar
       

        // Função para deletar documentos
        private void DeletarDocumento(string tipoDocumento, TextBox textBox)
        {
            try
            {
                int usuarioId = (int)Session["UsuarioId"];

                string connectionString = ConfigurationManager.ConnectionStrings["Porta_MemóriaDBConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Documentos WHERE UsuarioID = @UsuarioID AND TipoDocumento = @TipoDocumento";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@UsuarioID", usuarioId);
                        cmd.Parameters.AddWithValue("@TipoDocumento", tipoDocumento);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                // Limpar a TextBox
                textBox.Text = "";

                // Atualizar a lista de documentos
                CarregarDocumentos();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT DocumentoID, TipoDocumento, Conteudo FROM Documentos";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        rptDocuments.DataSource = reader;
                        rptDocuments.DataBind();
                    }
                }
                // Exibir mensagem de sucesso
                lblMessage.Text = tipoDocumento + " deletado com sucesso!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                // Exibir mensagem de erro
                lblMessage.Text = "Erro ao deletar " + tipoDocumento + ": " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }






        // Método para carregar os documentos




        protected void btnEditar_Click(object sender, EventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;

            TextBox txtDynamicContent = (TextBox)item.FindControl("txtDynamicContent");

            // Torna a TextBox editável
            txtDynamicContent.ReadOnly = false;
            txtDynamicContent.Focus(); // Foca na TextBox para começar a edição
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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Limpar a sessão do usuário
            Session.Clear();

            // Redirecionar para a página de login
            Response.Redirect("Login.aspx");
        }

    }
}
