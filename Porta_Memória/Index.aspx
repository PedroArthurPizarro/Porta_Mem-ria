&nbsp;<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Porta_Memória.WebForm1" %><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head runat="server"><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/><title>Página Inicial</title>
    <script type="text/javascript">
    function refreshPage() {
        window.location.reload();
    }
</script>

    <style>
        /* Cores */
        :root {
            --main-blue: #0066CC;
            --light-blue: #E6F0FF;
            --text-color: #333;
            --border-color: #0066CC; /* Adicionando uma variável para a cor da borda */
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--light-blue);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        @media (max-width: 600px) {
   .container {
       width: 100%;
       padding: 10px;
   }
   .header img {
       height: 50px;
   }
   .image-bar img {
       height: 30px;
   }
}


        .container {
            width: 90%;
            margin: 0 auto;
            max-width: 1000px; /* Define uma largura máxima para telas grandes */
        }

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between; /* Garante que os itens sejam distribuídos com espaço entre eles */
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: 60px;
        }

        .header .logo-container {
            margin-right: auto; /* Empurra o logotipo para a extrema esquerda */
        }

        .header .account-settings {
            margin-left: auto; /* Empurra o botão de configurações para a direita */
        }

        .header img {
            height: 75px; /* Ajustado para manter uma proporção mais harmônica */
            width: auto;
        }

        .header .login-status {
            margin-left: 20px;
            color: #fff; /* Alterado para garantir contraste com o fundo */
        }

        .image-bar {
            display: flex;
            justify-content: center;
            gap: 50px; /* Espaço entre as imagens */
            padding: 10px 0;
            background-color: var(--main-blue);
            border-bottom: 2px solid var(--border-color); /* Borda inferior para separar da área do cabeçalho */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra leve para destacar */
            height: 40px;
        }

        .image-bar img { /* Seleciona todas as imagens dentro da barra de imagem */
            height: 46px; /* Altura ajustada para manter proporções consistentes */
            width: auto; /* Mantém a proporção da imagem */
        }

        .hover-effect {
    transition: background-color 0.3s ease, border-radius 0.3s ease; /* Transição suave para o efeito de hover */
}

.hover-effect:hover {
    background-color: rgba(255, 255, 255, 0.7); /* Fundo branco semi-transparente */
    border-radius: 8px; /* Bordas arredondadas */
    padding: 2px; /* Adiciona espaçamento interno para a imagem */
    transform: scale(1.1); /* Aumenta o tamanho em 10% durante o hover */
}

        .documents {
            margin-top: 20px;
        }

        .documents .document-item {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid var(--border-color);
            background-color: #fff;
            border-radius: 8px; /* Bordas arredondadas para um visual mais moderno */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra para profundidade */
        }

        .documents .document-item a {
            font-size: 18px;
            color: var(--main-blue);
            text-decoration: none;
        }

        .documents .document-item a:hover {
            text-decoration: underline;
        }

        .panel-content {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid var(--border-color);
            background-color: #fff;
            color: var(--text-color);
            border-radius: 4px; /* Bordas arredondadas para uniformidade */
        }

        .panel-content label {
            color: var(--main-blue);
        }

        .panel-content img {
            max-width: 100%;
        }

        .btnTrashDoc {
    background-color: red;
    color: white;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    text-decoration: none;
}

        .footer {
            text-align: center;
            background-color: var(--main-blue);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: 60px;
            margin-top: 20px;
        }

        
        .auto-style6 {
            font-family: Impact;
            font-size: small;
            background-color: #0066CC;
            text-align: center;
            height: 60px;
        }

         /* Estilo para a área do dropdown */
        .account-settings {
            position: relative;
            display: inline-block;
        }

        /* Oculta o conteúdo do dropdown inicialmente */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            top: 18%;  /* Alinha diretamente abaixo do botão */
            right: 0%;
        }

        /* Estilo dos botões dentro do dropdown */
        .dropdown-content button {
            background-color: white;
            color: black;
            padding: 12px 16px;
            text-align: left;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        /* Estilo do botão quando o mouse passa por cima */
        .dropdown-content button:hover {
            background-color: #f1f1f1;
        }
    </style>

    <script>
        // Função para mostrar/ocultar o dropdown
        function toggleDropdown() {
            var dropdown = document.getElementById("dropdown-content");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }

        // Fecha o dropdown se clicar em qualquer lugar fora dele
        window.onclick = function (event) {
            if (!event.target.matches('#<%= UserButton.ClientID %>')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.style.display === "block") {
                        openDropdown.style.display = "none";
                    }
                }
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblMessage" runat="server" CssClass="statusMessage" />
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="container">
            <div class="header">
                <div class="logo-container">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/Porta_Memória_1.png" />
                </div>
                <div class="account-settings">
                    <asp:ImageButton ID="UserButton" runat="server" Height="42px" Width="42px"
            ImageUrl="https://cdn-icons-png.flaticon.com/512/149/149071.png"
            OnClientClick="toggleDropdown(); return false;" />
                </div>
                <div id="dropdown-content" class="dropdown-content">
        <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </div>
            </div>
                  


            <div class="image-bar">
                <!-- ImageButton 2: Imagem de chave -->
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="https://cdn-icons-png.flaticon.com/512/3064/3064155.png" CssClass="hover-effect" OnClientClick="window.location.href='/Index.aspx'; return false;" />

                <!-- ImageButton 3: Imagem de caderno de anotações -->
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl= "~/Imagens/wirte.png" CssClass="hover-effect" />


                <!-- ImageButton 4: Imagem de senha -->
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Imagens/senha.png" CssClass="hover-effect" OnClientClick="window.location.href='/GeradorSenha.aspx'; return false;" />

                <!-- ImageButton 5: Imagem de lixeira -->
<asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="https://cdn-icons-png.flaticon.com/512/1214/1214428.png" CssClass="hover-effect" OnClientClick="window.location.href='/Lixeira.aspx'; return false;" />
            </div>

            
            <div class="documents">
                <asp:Label ID="Label7" runat="server" Text="Documentos" CssClass="document-title" ForeColor="#000099" />
               <div class="document-item">
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Meu RG</asp:LinkButton>
    <asp:Panel ID="PanelRG" runat="server" Visible="False" CssClass="panel-content rg-panel">
        <asp:Label ID="Label2" runat="server" Text="RG:"></asp:Label>
        <asp:TextBox ID="TextBoxRG" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonSaveRG" runat="server" Text="Salvar" OnClick="ButtonSaveRG_Click" />
        <asp:Button ID="ButtonDeleteRG" runat="server" Text="Excluir" OnClick="ButtonDeleteRG_Click" CssClass="btnDeleteDoc" />
        <!-- Botão de lixeira -->
        <!--<asp:LinkButton ID="ButtonTrashRG" runat="server" Text="Lixeira" CommandArgument="RG" OnClick="ButtonTrash_Click" CssClass="btnTrashDoc" />-->
    </asp:Panel>
</div>

<div class="document-item">
    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Meu CPF</asp:LinkButton>
    <asp:Panel ID="PanelCPF" runat="server" Visible="False" CssClass="panel-content">
        <asp:Label ID="Label3" runat="server" Text="CPF"></asp:Label>
        <asp:TextBox ID="TextBoxCPF" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonSaveCPF" runat="server" Text="Salvar" OnClick="ButtonSaveCPF_Click" />
        <asp:Button ID="ButtonDeleteCPF" runat="server" Text="Excluir" OnClick="ButtonDeleteCPF_Click" CssClass="btnDeleteDoc" />
        <!-- Botão de lixeira -->
        <!--<asp:LinkButton ID="ButtonTrashCPF" runat="server" Text="Lixeira" CommandArgument="CPF" OnClick="ButtonTrash_Click" CssClass="btnTrashDoc" />-->
    </asp:Panel>
</div>

<div class="document-item">
    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Telefone</asp:LinkButton>
    <asp:Panel ID="PanelTEL" runat="server" Visible="False" CssClass="panel-content">
        <asp:Label ID="Label5" runat="server" Text="Telefone"></asp:Label>
        <asp:TextBox ID="TextBoxTEL" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonSaveTEL" runat="server" Text="Salvar" OnClick="ButtonSaveTEL_Click" />
        <asp:Button ID="ButtonDeleteTEL" runat="server" Text="Excluir" OnClick="ButtonDeleteTEL_Click" CssClass="btnDeleteDoc" />
        <!--<asp:LinkButton ID="ButtonTrashTEL" runat="server" Text="Lixeira" CommandArgument="Telefone" OnClick="ButtonTrash_Click" CssClass="btnTrashDoc" />-->
    </asp:Panel>
</div>

<div class="document-item">
    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">Senha Gmail</asp:LinkButton>
    <asp:Panel ID="PanelGm" runat="server" Visible="False" CssClass="panel-content">
        <asp:Label ID="Label6" runat="server" Text="Senha Gmail"></asp:Label>
        <asp:TextBox ID="TextBoxGM" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonSaveGM" runat="server" Text="Salvar" OnClick="ButtonSaveGM_Click" />
        <asp:Button ID="ButtonDeleteGM" runat="server" Text="Excluir" OnClick="ButtonDeleteGM_Click" CssClass="btnDeleteDoc" />
        <!--<asp:LinkButton ID="ButtonTrashGM" runat="server" Text="Lixeira" CommandArgument="Gmail" OnClick="ButtonTrash_Click" CssClass="btnTrashDoc" />-->
    </asp:Panel>
</div>

                <div class="document-item">
    <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">Senha Hotmail</asp:LinkButton>
    <asp:Panel ID="Panelhot" runat="server" Visible="False" CssClass="panel-content">
        <asp:Label ID="Label4" runat="server" Text="Senha Hotmail"></asp:Label>
        <asp:TextBox ID="TextBoxHOT" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonSaveHOT" runat="server" Text="Salvar" OnClick="ButtonSaveHOT_Click" />
        <asp:Button ID="ButtonDeleteHOT" runat="server" Text="Excluir" OnClick="ButtonDeleteHOT_Click" CssClass="btnDeleteDoc" />
        <!-- <asp:LinkButton ID="ButtonTrashHOT" runat="server" Text="Lixeira" CommandArgument="Hotmail" OnClick="ButtonTrash_Click" CssClass="btnTrashDoc" /> -->
    </asp:Panel>
</div>
             <asp:Panel ID="PanelDocuments" runat="server">
    <asp:Repeater ID="rptDocuments" runat="server">
        <ItemTemplate>
            <div class="document-item">
                <asp:LinkButton ID="lnkDocName" runat="server" Text='<%# Eval("TipoDocumento") %>' CommandArgument='<%# Eval("DocumentoID") %>' OnClick="lnkDocName_Click"></asp:LinkButton>
                <asp:Panel ID="panelDocument" runat="server" CssClass="panel-content" Visible="false">
                    <asp:TextBox ID="txtDynamicContent" runat="server" Text='<%# Eval("Conteudo") %>' CssClass="inputTextBox" />
                    <asp:Button ID="btnSaveDynamic" runat="server" Text="Salvar" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnSaveDynamic_Click" CssClass="btnSaveDoc" />
                    <asp:Button ID="btnDeleteDynamic" runat="server" Text="Excluir" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnDeleteDynamic_Click" CssClass="btnDeleteDoc" />
                    <!-- Botão de lixeira -->
                    <asp:LinkButton ID="btnTrashDynamic" runat="server" Text="Lixeira" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnTrashDynamic_Click" CssClass="btnTrashDoc" />
                </asp:Panel>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Panel>

                <!-- Formulário para adicionar novo documento -->
                <div class="document-item">
                    <asp:LinkButton ID="LinkButtonAddDocument" runat="server" OnClick="LinkButtonAddDocument_Click">Adicionar Documento</asp:LinkButton>
                    <asp:Panel ID="PanelAddDocument" runat="server" Visible="false">
                        <h2>Adicionar Documento</h2>
                        <asp:TextBox ID="TextBoxNomeDoc" runat="server" CssClass="inputTextBox" Placeholder="Nome do Documento"></asp:TextBox>
                        <asp:TextBox ID="TextBoxConteudoDoc" runat="server" TextMode="MultiLine" CssClass="inputTextBox" Placeholder="Conteúdo do Documento"></asp:TextBox>
                        <asp:Button ID="ButtonAddDoc" runat="server" Text="Adicionar Documento" OnClick="ButtonAddDoc_Click" CssClass="btnAddDoc" />
                    </asp:Panel>
                    <br />
                    <br />
                </div>
            </div>
            <div class="footer">
                        <br />
                        <span class="auto-style6" style="font-family: Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                        ©Porta Memória, all rights reserved.</span>
                    </div>
                <br />
        </div>
        </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ButtonSaveRG" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="ButtonDeleteRG" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="ButtonSaveCPF" EventName="Click" />
        <asp:AsyncPostBackTrigger ControlID="ButtonDeleteCPF" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
        
    </form>
</body>
</html>