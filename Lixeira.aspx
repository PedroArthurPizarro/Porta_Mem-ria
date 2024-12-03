<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lixeira.aspx.cs" Inherits="Porta_Memória.Lixeira" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lixeira</title>
    <style>
        /* Estilos gerais */
body {
    background-color: #FFF;
    font-family: Calibri;
    color: #000000;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

form {
    background-color: #3F6071;
    border-radius: 15px;
    padding: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
    width: 120vh;
    height: 85vh;
    box-sizing: border-box;
    text-align: center;
}

h2 {
    color: #fff;
    margin-top: -15px;
    font-size: 32px;
}

div.document-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    border: 1px solid #00aaff;
    background-color: #e0f7ff;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
}

/* Títulos dos documentos */
.document-item .document-title .document-button{
    font-size: 18px;
    color: black;
    font-weight: bold;
    max-width: 50ch; /* Limita o título a aproximadamente 50 caracteres */
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

/* Botões de ação */
.btnDeleteDoc, .btnRestoreDoc {
    padding: 5px 10px;
    font-size: 14px;
    color: #fff;
    border: none;
    cursor: pointer;
    margin-left: 10px; /* Espaçamento entre os botões */
    border-radius: 3px;
}

.btnDeleteDoc {
    background-color: #ff0033; /* Vermelho para o botão de excluir permanentemente */
}

.btnRestoreDoc {
    background-color: #00cc44; /* Verde para o botão de restaurar */
}

.btnDeleteDoc:hover, .btnRestoreDoc:hover {
    opacity: 0.9;
}

/* Link do botão no canto superior esquerdo */
.icon-back {
    position: absolute;
    top: 10px;
    left: 10px;
    text-decoration: none;
    color: #0077cc;
    font-weight: bold;
}

.icon-back img {
    vertical-align: middle;
    width: 20px;
    height: 20px;
    margin-right: 5px;
}

.icon-back:hover {
    text-decoration: underline;
}

    </style>
</head>
<body>
    <a href="Index.aspx" title="costas ícones" class="icon-back">
    <img src="https://cdn-icons-png.flaticon.com/512/109/109618.png" alt="Ícone de voltar" /> Voltar
</a>

    <form id="form1" runat="server">
       <h2>Lixeira</h2>
        <div>
            <asp:Repeater ID="rptLixeira" runat="server">
                <ItemTemplate>
                    <div class="document-item">
                        <asp:Label ID="lblDocumentTitle" runat="server" Text='<%# Eval("TipoDocumento") %>'></asp:Label>
                       <div class="document-button">
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnDeletePermanently_Click" CssClass="btnDeleteDoc">
                            Excluir
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnRestore_Click" CssClass="btnRestoreDoc">
                            Restaurar
                        </asp:LinkButton>
                       </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>