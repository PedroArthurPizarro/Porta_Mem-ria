<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeradorSenha.aspx.cs" Inherits="Porta_Memória.GeradorSenha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Gerador de Senhas</title>
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

        #senhaGeneratorForm {
            background-color: #3F6071;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1), 0 6px 20px rgba(0, 0, 0, 0.1);
            width: 550px;
            box-sizing: border-box;
            text-align: center;
            position: relative; /* Para posicionar o botão de seta */
        }

        h2 {
            color: #00AAFF;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #FFFFFF;
            text-align: center;
        }

        select, input[type="number"], button {
            width: calc(100% - 95px);
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: #FFF;
            color: #000;
        }

        button {
            background-color: #00AAFF;
            color: #FFFFFF;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #008FCC;
        }

        #generatedPassword {
            background-color: #BAE3F8;
            padding: 10px;
            border-radius: 5px;
            margin-top: 15px;
            font-weight: bold;
            word-break: break-word;
        }

        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 16px;
            color: #00AAFF;
        }

        .back-button:hover {
            color: #008FCC;
        }

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
    <form id="form1" runat="server">
        <div id="senhaGeneratorForm">
            <!-- Botão de Seta para Voltar -->
           <a href="Index.aspx" title="costas ícones" class="icon-back">
    <img src="https://cdn-icons-png.flaticon.com/512/109/109618.png" alt="Ícone de voltar" />
</a>
            <h2>Gerador de Senhas</h2>
           
            <label for="length">Número de Caracteres:</label>
            <asp:TextBox ID="txtLength" runat="server" Text="12" Height="29px" Width="190px" />

            <label for="charType">
            <br />
            Tipo de Caracteres:</label>
            <asp:DropDownList ID="ddlCharType" runat="server">
                <asp:ListItem Text="Apenas Números" Value="Numbers" />
                <asp:ListItem Text="Apenas Letras e Símbolos" Value="LettersSymbols" />
                <asp:ListItem Text="Números, Letras e Símbolos" Value="All" />
            </asp:DropDownList>

            <asp:Button ID="btnGenerate" runat="server" Text="Gerar Senha" OnClick="btnGenerate_Click" />

            <div id="generatedPassword">
                <asp:Label ID="lblGeneratedPassword" runat="server" Text="Sua senha será exibida aqui." BackColor="#BAE3F8" BorderColor="#BAE3F8" ForeColor="#2D3235" />
            </div>
        </div>
    </form>
</body>
</html>
