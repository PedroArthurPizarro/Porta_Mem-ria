&nbsp;<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Porta_Memória.WebForm1" %><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head runat="server"><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>Página Inicial</title>
    
    <script type="text/javascript">
        function refreshPage() {
            window.location.reload();
        }
    </script>

    <style>
        /* Cores */
        :root {
            --main-blue: #00AAFF;
            --primary-blue: #0066CC;
            --baby-blue: #BAE3F8;
            --light-blue: #E6F0FF;
            --text-color: #333;
            --white-color: #FFFFFF;
            --red-color: #FF0400;
            --border-color: #0066CC; 
            
            /* Modo Escuro */

            --main-blue-dark: #004465;
            --primary-blue-dark: #002952;
            --baby-blue-dark: #BAE3F8;
            --light-blue-dark: #3C4552;
            --text-color-dark: #D0D0D0;
            --white-color-dark: #000000;
            --red-color-dark: #C00F0C;
            --border-color-dark: #002952;
        }

        body, html {
    margin: 0;
    padding: 0;
    height: 100%; /* Garante que a página ocupe toda a altura */
    overflow-x: hidden; /* Evita rolagem horizontal */
}

        body {
            font-family: Arial, sans-serif;
            background-color: var(--light-blue);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        body.dark-mode {
            background-color: var(--light-blue-dark);
            color: var(--text-color-dark);
            
        }

        .container{
            object-position: initial;
            margin-top: -20px;
            background-color:var(--white-color);
        }

        .container.dark-mode{
            background-color:var(--white-color-dark);
        }
        

        .header {
            display: flex;
            align-items: center;
            justify-content: space-between; /* Garante que os itens sejam distribuídos com espaço entre eles */
            padding: 20px;
            object-position: initial;
            background-color: var(--white-color);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: 60px;
        }

        .header.dark-mode {         
            background-color: lightgray;
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
            margin-bottom: 10px;
            padding: 10px 0;
            background: linear-gradient(45deg, var(--main-blue), var(--primary-blue));
            border-bottom: 2px solid var(--border-color); /* Borda inferior para separar da área do cabeçalho */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra leve para destacar */
            height: 40px;
        }

        .image-bar.dark-mode{
            background: linear-gradient(45deg, var(--main-blue-dark), var(--baby-blue-dark));
            border-bottom: 2px solid var(--border-color-dark); /* Borda inferior para separar da área do cabeçalho */
        }

        .image-bar img { /* Seleciona todas as imagens dentro da barra de imagem */
            height: 46px; /* Altura ajustada para manter proporções consistentes */
            width: auto; /* Mantém a proporção da imagem */
        }

        .hover-effect {
    transition: background-color 0.3s ease, border-radius 0.3s ease; /* Transição suave para o efeito de hover */
}

.hover-effect:hover {
    background-color: rgba(255, 255, 255, 0.7);
    border-radius: 8px; /* Bordas arredondadas */
    padding: 2px; /* Adiciona espaçamento interno para a imagem */
    transform: scale(1.1); /* Aumenta o tamanho em 10% durante o hover */
}

.document-title{
    margin-left: 10px;
}


        .documents {
    margin-top: 10px;
    margin-left: 15px;
    margin-right: 15px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding: 10px;
    background-color: var(--light-blue);
    border-radius: 8px;
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.3);
}

        .documents.dark-mode {
    background-color: var(--light-blue-dark);
}


        .document-item {
    width: 450px; /* Reduzido para 45% para caber melhor em duas colunas */
    margin: 10px;
    margin-left: 15px;
    margin-right: 15px;
    padding: 20px;
    border: 1px solid var(--border-color);
    background-color: var(--white-color);
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

        .document-item.dark-mode {
    border: 1px solid var(--border-color-dark);
    background-color: var(--white-color-dark);
}

        .document-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* Sombra mais intensa ao passar o mouse */
}

        .document-item a {
    font-size: 20px;
    color: var(--main-blue);
    text-decoration: none;
    font-weight: bold;
    text-align: center;
    flex-grow: 1;
}

        .document-item a.dark-mode {
    color: var(--main-blue-dark);
}

.document-item a:hover {
    text-decoration: underline;
}

.btnTopDoc{
        display: flex;
        align-items: center;
        gap: 10px;
        justify-content: flex-end;
        margin-top: -25px;
        margin-bottom: 10px;
}

#ButtonAddDoc {
    position: relative;
    display: inline-block;
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

#ButtonAddDoc.dark-mode {
    background-color: #3D793F;
    color: black;
}

.AddDoc {
    justify-content: flex-start; /* Garantir que os documentos comecem à esquerda */
}

.document-box {
    border: 1px solid #ccc;
    margin-bottom: 10px;
    padding: 10px;
    background-color: #f9f9f9;
}

.document-box.dark-mode {
    background-color: #3C4552;
}

        .inputTextBox {
    margin-bottom: 10px;
    width: 100%;
    padding: 8px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    resize: none;
}

        .inputTextBoxConteudoDoc{
            height: 40vh;
        }

        .btnToggleVisibility{
    background-color: transparent;
    border: none;
    cursor: pointer;
    width: 24px;
    height: 24px;
}
       
        

        .document-item {
    flex: 1 1 300px; /* Itens flexíveis com largura mínima de 300px */
    max-width: 300px; /* Impede que os itens cresçam acima de 300px */
    height: auto; /* Permite que o tamanho seja ajustado conforme o conteúdo */
    box-sizing: border-box;
}

        .DocumentTextBox{

            margin-top: 10px;
            height: 40vh;
        }
/* Estilo para os botões */
.btnSaveDoc {
    padding: 5px 10px;
    margin-right: 5px;
    background-color: var(--primary-blue);
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 3px;
}

.btnSaveDoc.dark-mode {
    padding: 5px 10px;
    margin-right: 5px;
    background-color: var(--primary-blue-dark);
    color: black;
    border: none;
    cursor: pointer;
    border-radius: 3px;
}


.btnTrashDoc {
    object-position: center;
    height: 6vh;
    margin-bottom: -1.5vh;
}




        .footer {
            margin-top: 10px;
            margin-bottom: -5%;
            background: linear-gradient(45deg, var(--baby-blue), var(--main-blue));
    padding: 20px;
    background-color: var(--baby-blue);
    color: var(--text-color);
    text-align: center;
    border-top: 1px solid var(--border-color);
}

         .footer.dark-mode {
            
    background: linear-gradient(45deg, var(--baby-blue-dark), var(--main-blue-dark));
    background-color: var(--baby-blue-dark);
    color: var(--text-color-dark);
}
        
        .auto-style6 {
            font-family: Impact;
            font-size: small;
            font-style: italic, oblique;
            background-color: none;
            text-align: center;
            height: 60px;
        }

         /* Estilo para a área do dropdown */
        .account-settings {
            position: relative;
            display: inline-block;
        }

        /* Oculta o conteúdo do dropdown inicialmente */
.dropdown {
  position: relative;
  top: 30%;
  display: inline-block;
  cursor: pointer;

}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: var(--white-color);
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  right: 0;

}

.dropdown-content.dark-mode {
  background-color: var(--white-color-dark);

}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown-content a {
  color: var(--text-color);
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a.dark-mode {
  color: var(--text-color-dark);
}

.dropdown-content a:hover {background-color: var(--light-blue)}

.dropdown-content a:hover.dark-mode {background-color: var(--light-blue-dark)}


#btnLogout:hover{
    background: var(--red-color);
}

#btnLogout:hover.dark-mode{
    background: var(--red-color-dark);
}

.document-title{
    font-size: x-large;
}

.password-mode {
    color: transparent; /* Torna o texto invisível */
    text-shadow: 0 0 0 black; /* Cria a ilusão de bolinhas */
}

.switch {
    position: relative;
    display: inline-block;
    width: 50px;
    height: 24px;
}

.switch input {
    opacity: 0;
    width: 0;
    height: 0;
}

.slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #ccc;
    transition: .4s;
    border-radius: 24px;
}

.slider.dark-mode {
    background-color: #545454;
}

.slider:before {
    position: absolute;
    content: "";
    height: 18px;
    width: 18px;
    left: 3px;
    bottom: 3px;
    background-color: white;
    transition: .4s;
    border-radius: 50%;
}

.slider:before.dark-mode {
    background-color: black;
}

input:checked + .slider {
    background-color: var(--main-blue);
}

input:checked + .slider.dark-mode {
    background-color: var(--main-blue-dark);
}

input:checked + .slider:before {
    transform: translateX(26px);
}

.toggle-dark-mode {
    display: flex;
    align-items: center;
    margin-top: 10px;
}

.toggle-dark-mode span {
    margin-left: 10px;
    font-size: 14px;
    color: #333;
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

        // Função para alternar visibilidade da senha
        function toggleVisibility(button) {
            var textBox = button.previousElementSibling; // Seleciona a TextBox que está antes do botão
            var isPasswordMode = textBox.getAttribute("type") === "password"; // Verifica se o tipo atual é 'password'

            if (isPasswordMode) {
                textBox.setAttribute("type", "text"); // Altera para texto normal
                button.src = "~/Imagens/olho-vermelho.png"; // Ícone do olho aberto
            } else {
                textBox.setAttribute("type", "password"); // Altera para modo senha
                button.src = "~/Imagens/olho-aberto.png"; // Ícone do olho fechado
            }
        }

        // Função para alternar entre dark mode e light mode
        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode'); // Alterna o dark-mode no body

            // Seleciona todos os elementos que têm a classe modificada no dark mode
            const elementsToToggle = document.querySelectorAll('.header, .image-bar, .documents, .document-item, .footer, .btnSaveDoc, .panel-content label, .dropdown-content a, .slider');
            elementsToToggle.forEach((element) => {
                element.classList.toggle('dark-mode'); // Alterna a classe dark-mode em todos os elementos
            });

            // Armazenar a preferência no localStorage
            const isDarkMode = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isDarkMode ? 'enabled' : 'disabled');
        }

        // Verificar o estado do dark mode ao carregar a página
        window.onload = function () {
            const darkMode = localStorage.getItem('darkMode');
            if (darkMode === 'enabled') {
                document.body.classList.add('dark-mode');  // Habilitar dark mode se já estiver ativado

                // Selecionar todos os elementos e adicionar a classe dark-mode
                const elementsToToggle = document.querySelectorAll('.header, .image-bar, .documents, .document-item, .footer, .btnSaveDoc, .panel-content label, .dropdown-content a, .slider');
                elementsToToggle.forEach((element) => {
                    element.classList.add('dark-mode');
                });

                // Atualizar o estado do switch (se estiver usando algum)
                if (document.getElementById("darkModeSwitch")) {
                    document.getElementById("darkModeSwitch").checked = true;
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

        <div class="dropdown">
                <div id="dropdown-content" class="dropdown-content" onclick="event.stopPropagation();">

                    <a> sla1 </a>

                    <div class="toggle-dark-mode">
    <label class="switch">
        <input type="checkbox" id="darkModeSwitch" onclick="toggleDarkMode()">
        <span class="slider"></span>
    </label>
    <span>Modo Escuro</span>
</div>

                    <asp:LinkButton ID="btnTrocarConta" runat="server" OnClick="btnLogout_Click" CssClass="a">
                            Trocar de Conta
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="logout-button">
                            Logout
                    </asp:LinkButton>

                </div>            
        </div>
  </div>
                  
            <div class="image-bar">
                <!-- ImageButton 2: Imagem de chave -->
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="https://cdn-icons-png.flaticon.com/512/3064/3064155.png" CssClass="hover-effect" OnClientClick="window.location.href='/Index.aspx'; return false;" />

                <!-- ImageButton 3: Imagem de caderno de anotações -->
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl= "~/Imagens/wirte.png" CssClass="hover-effect" OnClientClick="window.location.href='/BlocoDeNotas.aspx'; return false;" />


                <!-- ImageButton 4: Imagem de senha -->
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Imagens/senha.png" CssClass="hover-effect" OnClientClick="window.location.href='/GeradorSenha.aspx'; return false;" />

                <!-- ImageButton 5: Imagem de lixeira -->
<asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="https://cdn-icons-png.flaticon.com/512/1214/1214428.png" CssClass="hover-effect" OnClientClick="window.location.href='/Lixeira.aspx'; return false;" />
            </div>

            <asp:Label ID="Label7" runat="server" Text="Documentos" CssClass="document-title" ForeColor="#000099" />

            <div class="documents">

                <div class="document-item AddDoc">
        <asp:TextBox ID="TextBoxNomeDoc" runat="server" CssClass="inputTextBox" Placeholder="Nome do Documento"></asp:TextBox>
        <asp:TextBox ID="TextBoxConteudoDoc" runat="server" TextMode="MultiLine" CssClass="inputTextBox inputTextBoxConteudoDoc" Placeholder="Conteúdo do Documento"></asp:TextBox>
        <asp:Button ID="ButtonAddDoc" runat="server" Text="Adicionar Documento" OnClick="ButtonAddDoc_Click" CssClass="btnAddDoc" />
    </div>

            <asp:Repeater ID="rptDocuments" runat="server">
                <ItemTemplate>
                    <div class="document-item">
            <asp:LinkButton ID="lnkDocName" runat="server"  Text='<%# Eval("TipoDocumento") %>' CommandArgument='<%# Eval("DocumentoID") %>'></asp:LinkButton>
                        
                        <div class="btnTopDoc">
            <asp:ImageButton ID="btnToggleVisibility" runat="server" ImageUrl="~/Imagens/olho-aberto.png" CssClass="btnToggleVisibility" OnClientClick="toggleVisibility(this); return false;" />
                        <asp:ImageButton ID="btnEditar" ImageUrl="~/Imagens/editar.png" runat="server" CssClass="btnToggleVisibility" OnClick="btnEditar_Click">
            </asp:ImageButton>
                            </div>
            <asp:TextBox ID="txtDynamicContent" runat="server" TextMode="MultiLine" ReadOnly="True" CssClass="inputTextBox DocumentTextBox" Text='<%# Eval("Conteudo") %>' />
            
        <div class="btnsDocs">
            <asp:Button ID="btnSaveDynamic" runat="server" Text="Salvar" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnSaveDynamic_Click" CssClass="btnSaveDoc" />
            <asp:ImageButton ID="btnTrashDynamic" runat="server" ImageUrl="~/Imagens/delete.png" CommandArgument='<%# Eval("DocumentoID") %>' OnClick="btnTrashDynamic_Click" CssClass="btnTrashDoc" />
        </div>
        </div>
                </ItemTemplate>
            </asp:Repeater>
        

    <!-- Formulário de adição de novo documento -->
    
</div>


            <div class="footer">
                        <br />
                        <span class="auto-style6" style="font-family: Arial, sans-serif; font-style: italic; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
                        ©Porta Memória, all rights reserved.</span>
                    </div>
                <br />
        </div>
        </ContentTemplate>
</asp:UpdatePanel>
        
    </form>
</body>
</html>
