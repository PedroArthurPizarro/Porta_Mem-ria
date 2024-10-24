<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notas.aspx.cs" Inherits="Porta_Memória.Notas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bloco de Notas</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Bloco de Notas</h2>
            <asp:TextBox ID="TextBoxConteudoDoc" runat="server" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox>
            <br />
            <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" OnClick="ButtonSalvar_Click" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>