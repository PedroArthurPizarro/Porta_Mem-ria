<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Porta_Memória.Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cadastro de Usuário</title>
    <style>
        body {
            background-color: #FFF;
            font-family: Arial, sans-serif;
            color: #FFFFFF;
            margin: 0;
            margin-top: auto;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #form1 {
            background-color: #3F6071;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
            box-sizing: border-box;
            text-align: center;
        }

        h2 {
            color: #00AAFF;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 5px;
            margin-bottom: 5px;
            font-weight: bold;
            text-align: left;
        }

        input[type="text"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #FFF;
            color: #000;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            outline: none;
            border: 2px solid #00AAFF;
        }

        .button {
            width: 100%;
            padding: 10px;
            background-color: #00AAFF;
            border: none;
            border-radius: 5px;
            color: #FFFFFF;
            font-weight: bold;
            cursor: pointer;
            box-sizing: border-box;
            margin-top: 10px;
        }

        .button:hover {
            background-color: #008FCC;
        }

        #lblMensagem {
            text-align: center;
            margin-top: 10px;
            font-weight: bold;
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Cadastro de Novo Usuário</h2>
            
            <asp:Label ID="lblNome" runat="server" Text="Nome:"></asp:Label>
            <asp:TextBox ID="txtNome" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblSobrenome" runat="server" Text="Sobrenome:"></asp:Label>
            <asp:TextBox ID="txtSobrenome" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblTelefone" runat="server" Text="Telefone:"></asp:Label>
            <asp:TextBox ID="txtTelefone" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblCpf" runat="server" Text="CPF:"></asp:Label>
            <asp:TextBox ID="txtCpf" runat="server"></asp:TextBox><br />

            <asp:Label ID="lblSenha" runat="server" Text="Senha:"></asp:Label>
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox><br />

            <asp:Label ID="lblConfirmarSenha" runat="server" Text="Confirmar Senha:"></asp:Label>
            <asp:TextBox ID="txtConfirmarSenha" runat="server" TextMode="Password" OnTextChanged="txtConfirmarSenha_TextChanged" AutoPostBack="true"></asp:TextBox><br />

            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="button" OnClick="btnCadastrar_Click" /><br />

            <h3>
                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" PostBackUrl="~/Login.aspx">Fazer Login</asp:LinkButton>
            </h3>

            <asp:Label ID="lblMensagem" runat="server" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
