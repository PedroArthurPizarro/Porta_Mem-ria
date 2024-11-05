<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notas.aspx.cs" Inherits="Porta_Memória.Notas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bloco de Notas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #BAE3F8;
            margin: 0;
            padding: 0px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h2 {
            text-align: center;
            color: #002952;
            font-weight: normal;
            font-size: 25px;
            margin-bottom: 10px;
        }

        form {
            width: 100%;
            max-width: 600px;
            background-color: #ffffff;
            padding: 60px;
            border-radius: 35px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
        }

        .back-arrow {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 24px;
            cursor: pointer;
            color: #004465;
            text-decoration: none;
        }

        .back-arrow:hover {
            color: #002952;
        }

        #TextBoxConteudoDoc {
            width: 93%;
            padding: 25px;
            border: 2px solid #00AAFF;
            border-radius: 12px;
            font-size: 21px;
            font-family: 'Courier New', Courier, monospace;
            background-color: #E5F3FB;
            color: #004465;
            resize: none;
            margin-bottom: 20px;
            height: 250px;
            background-image: linear-gradient(blue 1px, transparent 1px);
            background-size: 100% 25px;
            line-height: 25px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .btn {
            background-color: #0066CC;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            width: 100%;
            max-width: 120px;
        }

        .btn:hover {
            background-color: #004465;
        }

        #lblMessage {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
            color: #FF4E4E;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButtonVoltar" runat="server" CssClass="back-arrow" OnClick="LinkButtonVoltar_Click">&#8592;</asp:LinkButton>
        <div>
            <h2>Minhas Anotações</h2>
            <asp:TextBox ID="TextBoxConteudoDoc" runat="server" TextMode="MultiLine" Rows="10" Columns="40"></asp:TextBox>
            <div class="button-container">
                <asp:Button ID="ButtonSalvar" runat="server" Text="Salvar" CssClass="btn" OnClick="ButtonSalvar_Click" />
                <asp:Button ID="ButtonLimpar" runat="server" Text="Limpar" CssClass="btn" OnClick="ButtonLimpar_Click" />
            </div>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>

