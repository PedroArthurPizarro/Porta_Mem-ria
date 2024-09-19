<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Porta_Memória.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <style>
        body {
            background-color: #FFF;
            font-family: Arial, sans-serif;
            color: #FFFFFF;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #loginForm {
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
            margin-bottom: 5px;
            font-weight: bold;
            color: #FFFFFF;
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

        .failure-text {
            color: #FF0000;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="loginForm">
            <h2>Login</h2>
            
            <asp:Label ID="lblUsername" runat="server" Text="Email:" AssociatedControlID="txtUsername"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" Width="100%" />
            
            <asp:Label ID="lblPassword" runat="server" Text="Senha:" AssociatedControlID="txtPassword"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="100%" />

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="btnLogin_Click" />

            <h3>
<asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" OnClick="LinkButton1_Click" PostBackUrl="~/Cadastro.aspx">Cadastre-se</asp:LinkButton>
            </h3>

            <asp:Label ID="lblMessage" runat="server" CssClass="failure-text"></asp:Label>
        </div>
    </form>
</body>
</html>