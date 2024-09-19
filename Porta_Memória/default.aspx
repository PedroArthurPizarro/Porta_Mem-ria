<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Porta_Memória._default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Documentos e Usuários</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- GridView para Usuários -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USER" DataSourceID="SqlDataSource1" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="USER" HeaderText="USER" InsertVisible="False" ReadOnly="True" SortExpression="USER" />
                    <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
                    <asp:BoundField DataField="SOBRENOME" HeaderText="SOBRENOME" SortExpression="SOBRENOME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="SENHA" HeaderText="SENHA" SortExpression="SENHA" />
                    <asp:BoundField DataField="TELEFONE" HeaderText="TELEFONE" SortExpression="TELEFONE" />
                    <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                    <asp:BoundField DataField="ATIVO" HeaderText="ATIVO" SortExpression="ATIVO" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Porta_MemóriaDBConnectionString %>" 
    SelectCommand="SELECT * FROM [PortaMemoria]"></asp:SqlDataSource>
            <!-- GridView para Documentos -->
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="DocumentoID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="DocumentoID" HeaderText="DocumentoID" InsertVisible="False" ReadOnly="True" SortExpression="DocumentoID"></asp:BoundField>
                    <asp:BoundField DataField="UsuarioID" HeaderText="UsuarioID" SortExpression="UsuarioID"></asp:BoundField>
                    <asp:BoundField DataField="TipoDocumento" HeaderText="TipoDocumento" SortExpression="TipoDocumento"></asp:BoundField>
                    <asp:BoundField DataField="Conteudo" HeaderText="Conteudo" SortExpression="Conteudo"></asp:BoundField>
                    <asp:BoundField DataField="DataInsercao" HeaderText="DataInsercao" SortExpression="DataInsercao"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Porta_MemóriaDBConnectionString %>" 
    SelectCommand="SELECT * FROM [Documentos]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
