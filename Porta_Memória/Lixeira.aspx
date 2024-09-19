<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lixeira.aspx.cs" Inherits="Porta_Memória.Lixeira" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lixeira</title>
    <style>
        /* Estilos gerais */
body {
    font-family: Arial, sans-serif;
    background-color: #f0faff;
    margin: 0;
    padding: 0;
}

form {
    margin: 0;
    padding: 20px;
}

div.document-item {
    border: 1px solid #00aaff;
    background-color: #e0f7ff;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
}

/* Títulos dos documentos */
.document-item .document-title {
    font-size: 18px;
    color: #0077cc;
    font-weight: bold;
    margin-right: 20px;
}

/* Botões de ação */
.btnDeleteDoc, .btnRestoreDoc {
    padding: 5px 10px;
    font-size: 14px;
    color: #fff;
    border: none;
    cursor: pointer;
    margin-right: 10px;
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
        <div>
            <asp:Repeater ID="rptLixeira" runat="server">
                <ItemTemplate>
                    <div class="document-item">
                        <asp:Label ID="lblDocumentTitle" runat="server" Text='<%# Eval("TipoDocumento") %>'></asp:Label>
                        <asp:LinkButton ID="lnkDeletePermanently" runat="server" CommandArgument='<%# Eval("DocumentoID") %>' CssClass="btnDeleteDoc">
                            Excluir Permanentemente
                        </asp:LinkButton>
                        <asp:LinkButton ID="lnkRestore" runat="server" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnRestore_Click" CssClass="btnRestoreDoc">
                            Restaurar
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>