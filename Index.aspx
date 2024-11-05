
﻿&nbsp;<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Porta_Memória.WebForm1" %><!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head runat="server"><meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>Página Inicial</title>

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
            --yellow-color: #e1c818;
            
            /* Modo Escuro */

            --main-blue-dark: #004465;
            --primary-blue-dark: #002952;
            --baby-blue-dark: #BAE3F8;
            --light-blue-dark: #3C4552;
            --text-color-dark: #D0D0D0;
            --white-color-dark: #000000;
            --red-color-dark: #C00F0C;
            --border-color-dark: #002952;
            --yellow-color-dark: #ffe000

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
            padding: 25px;
            object-position: initial;
            background-color: var(--white-color);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            height: 40px;
        }

        .header.dark-mode {         
            background-color: var(--white-color-dark);
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
            background: linear-gradient(45deg, var(--main-blue-dark), var(--primary-blue-dark));
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
    color: var(--main-blue)
}

.document-title.nome-usuario {
    color: var(--yellow-color)/;
    font-family: 'Times New Roman', Times, serif;
    font-size: 24px; /* Ajuste conforme necessário */
}

.document-title.nome-usuario.dark-mode {
    color: var(--yellow-color)/;
    font-family: 'Times New Roman', Times, serif;
    font-size: 24px; /* Ajuste conforme necessário */
}


.document-title.dark-mode{
    color: var(--white-color)
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
    border: 1px solid var(--white-color);
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
    color: var(--white-color);
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

        .btnEditText{
    background-color: transparent;
    border: none;
    cursor: pointer;
    width: 24px;
    height: 24px;
}
       
        .inputTextBox.dark-mode{
            background-color: var(--text-color-dark)
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
    background-color: var(--main-blue-dark);
    color: var(--text-color-dark);
    border: none;
    cursor: pointer;
    border-radius: 3px;
}


.btnTrashDoc {
    object-position: center;
    height: 6vh;
    margin-bottom: -1.5vh;
}

        footer {
    background-color: var(--primary-blue); /* Cor de fundo do footer */
    color: var(--white-color); /* Cor do texto */
    padding: 30px 0; /* Espaçamento interno */
    font-family: Arial, sans-serif; /* Fonte do footer */
    display: flex; /* Flexbox para organizar as seções */
    justify-content: space-around; /* Espaço entre as seções */
    flex-wrap: wrap; /* Permite que as seções se ajustem em várias linhas */
}

footer h3 {
    color: var(--yellow-color); /* Cor dos títulos */
}

footer p {
    line-height: 1.6; /* Espaçamento entre linhas */
    color: var(--white-color); /* Cor do texto */
}

footer ul {
    list-style: none; /* Remove o estilo de lista */
    padding: 0; /* Remove o padding padrão */
}

footer ul li a {
    text-decoration: none; /* Remove sublinhado dos links */
    color: var(--white-color); /* Cor dos links */
}

footer ul li a:hover {
    text-decoration: underline; /* Adiciona sublinhado ao passar o mouse */
}

footer .social-icons {
    display: flex; /* Flexbox para organizar os ícones */
    gap: 10px; /* Espaço entre os ícones */
}

footer img {
    width: 24px; /* Tamanho dos ícones */
}

 footer.dark-mode {
    background-color: var(--primary-blue-dark); /* Cor de fundo do footer */
    color: var(--white-color-dark); /* Cor do texto */
    padding: 30px 0; /* Espaçamento interno */
    font-family: Arial, sans-serif; /* Fonte do footer */
    display: flex; /* Flexbox para organizar as seções */
    justify-content: space-around; /* Espaço entre as seções */
    flex-wrap: wrap; /* Permite que as seções se ajustem em várias linhas */
}

footer h3.dark-mode {
    color: var(--yellow-color); /* Cor dos títulos */
}

footer p.dark-mode {
    line-height: 1.6; /* Espaçamento entre linhas */
    color: var(--white-color-dark); /* Cor do texto */
}

footer ul {
    list-style: none; /* Remove o estilo de lista */
    padding: 0; /* Remove o padding padrão */
}

footer ul li a.dark-mode {
    text-decoration: none; /* Remove sublinhado dos links */
    color: var(--white-color-dark); /* Cor dos links */
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

        function toggleVisibility(button) {
            var documentItem = button.closest('.document-item');
            var textBox = documentItem.querySelector('.DocumentTextBox'); // TextBox do conteúdo

            // Verificar se o conteúdo está mascarado
            if (textBox.dataset.masked === "true") {
                // Exibir o conteúdo original
                textBox.value = textBox.dataset.originalContent;
                textBox.dataset.masked = "false";
                button.src = "/Imagens/olho.png"; // Ícone do olho aberto
            } else {
                // Mascarar o conteúdo
                textBox.dataset.originalContent = textBox.value; // Armazenar o conteúdo original
                textBox.value = textBox.value.replace(/./g, '*'); // Substituir por asteriscos
                textBox.dataset.masked = "true";
                button.src = "/Imagens/olho-vermelho.png"; // Ícone do olho fechado
            }
        }



        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode'); // Alterna o dark-mode no body

            // Seleciona todos os elementos que têm a classe modificada no dark mode
            const elementsToToggle = document.querySelectorAll('footer, .nome-usuario, .header, .inputTextBox, .body, .document-title, .container, .image-bar, .documents, .document-item, .document-item a, #ButtonAddDoc, .footer, .btnSaveDoc, .panel-content label, .dropdown-content a, .slider');
            elementsToToggle.forEach((element) => {
                element.classList.toggle('dark-mode'); // Alterna a classe dark-mode em todos os elementos
            });

            // Armazenar a preferência no localStorage
            const isDarkMode = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isDarkMode ? 'enabled' : 'disabled');

            // Mudar o logotipo dependendo do modo
            updateLogoAndIcons(isDarkMode);
        }

        // Função para atualizar as imagens e ícones conforme o modo escuro/claro
        function updateLogoAndIcons(isDarkMode) {
            const logoImage = document.getElementById('<%= Image1.ClientID %>');
            const imageButton2 = document.getElementById('<%= ImageButton2.ClientID %>');
        const imageButton3 = document.getElementById('<%= ImageButton3.ClientID %>');
        const imageButton4 = document.getElementById('<%= ImageButton4.ClientID %>');
            const imageButton5 = document.getElementById('<%= ImageButton5.ClientID %>');
            const editButtons = document.querySelectorAll('.btnEditText');
            const olhoButtons = document.querySelectorAll('.btnToggleVisibility');
            const olhoNotButtons = document.querySelectorAll('.btnToggleVisibilityNot');

            if (isDarkMode) {
                logoImage.src = '/Imagens/Porta_Memória_Dark.png';  // Caminho para o logotipo modo escuro
                imageButton2.src = '/Imagens/cadeado_dark.png';  // Caminho para a imagem do cadeado modo escuro
                imageButton3.src = '/Imagens/note_dark.png';
                imageButton4.src = '/Imagens/senha_dark.png';
                imageButton5.src = '/Imagens/lixeira_dark.png';

                // Atualizar as imagens dos botões de edição
                editButtons.forEach(button => {
                    button.src = '/Imagens/edit_dark.png';  // Caminho para a imagem do botão editar no modo escuro
                });

                // Atualizar as imagens dos botões de "olho"
                olhoButtons.forEach(button => {
                    button.src = '/Imagens/olho_dark.png';  // Caminho para a imagem do olho no modo escuro
                });

                // Atualizar as imagens dos botões de "olho vermelho"
                olhoNotButtons.forEach(button => {
                    button.src = '/Imagens/olho-vermelho_dark.png';  // Caminho para a imagem do olho vermelho no modo escuro
                });
            } else {
                logoImage.src = '/Imagens/Porta_Memória.png';  // Caminho para o logotipo modo claro
                imageButton2.src = '/Imagens/cadeado.png';  // Caminho para a imagem do cadeado modo claro
                imageButton3.src = '/Imagens/note.png';
                imageButton4.src = '/Imagens/senha.png';
                imageButton5.src = '/Imagens/lixeira.png';

                // Atualizar as imagens dos botões de edição
                editButtons.forEach(button => {
                    button.src = '/Imagens/edit.png';  // Caminho para a imagem do botão editar no modo claro
                });

                // Atualizar as imagens dos botões de "olho"
                olhoButtons.forEach(button => {
                    button.src = '/Imagens/olho.png';  // Caminho para a imagem do olho no modo claro
                });

                // Atualizar as imagens dos botões de "olho vermelho"
                olhoNotButtons.forEach(button => {
                    button.src = '/Imagens/olho-vermelho.png';  // Caminho para a imagem do olho vermelho no modo claro
                });
            }
        }

        // Função para carregar o estado do dark mode ao inicializar a página
        function loadDarkModeFromLocalStorage() {
            const darkMode = localStorage.getItem('darkMode');
            const isDarkMode = (darkMode === 'enabled');

            if (isDarkMode) {
                document.body.classList.add('dark-mode');  // Habilitar dark mode se já estiver ativado

                // Selecionar todos os elementos e adicionar a classe dark-mode
                const elementsToToggle = document.querySelectorAll('footer, .nome-usuario, .header, .inputTextBox, .body, .document-title, .container, .image-bar, .documents, .document-item, .document-item a, #ButtonAddDoc, .footer, .btnSaveDoc, .panel-content label, .dropdown-content a, .slider');
                elementsToToggle.forEach((element) => {
                    element.classList.add('dark-mode');
                });
            }

            // Atualizar logo e ícones de acordo com o modo
            updateLogoAndIcons(isDarkMode);
        }

        // Verificar o estado do dark mode ao carregar a página
        window.onload = function () {
            loadDarkModeFromLocalStorage(); // Carrega o estado do dark mode do localStorage
        };
        function enableEditMode(button) {
            const documentItem = button.closest('.document-item');
            const textBox = documentItem.querySelector('.DocumentTextBox');
            const saveButton = documentItem.querySelector('.btnSaveDoc');
            const trashButton = documentItem.querySelector('.btnTrashDoc');

            // Ativa a edição
            textBox.removeAttribute('readonly');
            textBox.focus();

            // Exibe os botões Salvar e Excluir
            saveButton.style.display = 'inline';
            trashButton.style.display = 'inline';
        }

        function toggleVisibility(button) {
            const textBox = button.closest('.document-item').querySelector('.DocumentTextBox');
            textBox.style.display = textBox.style.display === 'none' ? 'block' : 'none';
        }

        document.addEventListener('click', function (event) {
            if (!event.target.closest('.document-item')) {
                const documentItems = document.querySelectorAll('.document-item');
                documentItems.forEach(item => {
                    const textBox = item.querySelector('.DocumentTextBox');
                    const saveButton = item.querySelector('.btnSaveDoc');
                    const trashButton = item.querySelector('.btnTrashDoc');

                    // Desativa a edição e oculta os botões Salvar e Excluir
                    if (textBox) textBox.setAttribute('readonly', true);
                    if (saveButton) saveButton.style.display = 'none';
                    if (trashButton) trashButton.style.display = 'none';
                });
            }
        });
        document.addEventListener("DOMContentLoaded", function () {
            // Função para aplicar ou remover o modo escuro
            function applyDarkMode(isDark) {
                if (isDark) {
                    document.body.classList.add("dark-mode");
                } else {
                    document.body.classList.remove("dark-mode");
                }

                document.querySelectorAll('.container, .header, .image-bar, .documents, .document-title').forEach(function (el) {
                    if (isDark) {
                        el.classList.add('dark-mode');
                    } else {
                        el.classList.remove('dark-mode');
                    }
                });
            }

        });
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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/Porta_Memória.png" />
                        </div>
                        <div class="account-settings">
                            <asp:ImageButton ID="UserButton" runat="server" Height="42px" Width="42px"
                                ImageUrl="https://cdn-icons-png.flaticon.com/512/149/149071.png"
                                OnClientClick="toggleDropdown(); return false;" />
                        </div>

                        <div class="dropdown">
                            <div id="dropdown-content" class="dropdown-content" onclick="event.stopPropagation();">
                                
                                <div class="toggle-dark-mode">
                                    <label class="switch">
                                        <input type="checkbox" id="darkModeSwitch" onclick="toggleDarkMode()">
                                        <span class="slider"></span>
                                    </label>
                                    <span>Modo Escuro</span>
                                </div>

                                <a href="Ajuda.aspx"> Ajuda </a>

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
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="/Imagens/cadeado.png" CssClass="hover-effect"
                            OnClientClick="window.location.href='/Index.aspx'; return false;" />
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Imagens/note.png" CssClass="hover-effect"
                            OnClientClick="window.location.href='/Notas.aspx'; return false;" />
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Imagens/senha.png" CssClass="hover-effect"
                            OnClientClick="window.location.href='/GeradorSenha.aspx'; return false;" />
                        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="/Imagens/lixeira.png" CssClass="hover-effect"
                            OnClientClick="window.location.href='/Lixeira.aspx'; return false;" />
                    </div>

                <asp:Label ID="Label7" runat="server" CssClass="document-title" TextMode="Encode" />
                <span class="document-title">
    <asp:Literal ID="litDocumentos" runat="server" />
                </span>

                    <div class="documents">
                        <div class="document-item AddDoc">
                            <asp:TextBox ID="TextBoxNomeDoc" runat="server" CssClass="inputTextBox" Placeholder="Nome do Documento"></asp:TextBox>
                            <asp:TextBox ID="TextBoxConteudoDoc" runat="server" TextMode="MultiLine" CssClass="inputTextBox inputTextBoxConteudoDoc" Placeholder="Conteúdo do Documento"></asp:TextBox>
                            <asp:Button ID="ButtonAddDoc" runat="server" Text="Adicionar Documento" OnClick="ButtonAddDoc_Click" CssClass="btnAddDoc" />
                        </div>

                        <asp:Repeater ID="rptDocuments" runat="server">
                            <ItemTemplate>
                                <div class="document-item">
                                    <asp:LinkButton ID="lnkDocName" runat="server" Text='<%# Eval("TipoDocumento") %>' CommandArgument='<%# Eval("DocumentoID") %>'></asp:LinkButton>

                                    <div class="btnTopDoc">
                                        <asp:ImageButton ID="btnToggleVisibility" runat="server" ImageUrl="~/Imagens/olho.png" CssClass="btnToggleVisibility" OnClientClick="toggleVisibility(this); return false;" />
                                        <asp:ImageButton ID="btnEditar" ImageUrl="~/Imagens/edit.png" runat="server" CssClass="btnEditText" OnClientClick="enableEditMode(this); return false;" OnClick="btnEditar_Click" />
                                    </div>

                                    <asp:TextBox ID="txtDynamicContent" runat="server" TextMode="MultiLine" ReadOnly="True"
                                        CssClass="inputTextBox DocumentTextBox" Text='<%# Eval("Conteudo") %>'
                                        onfocus="enableEdit(this)" />

                                    <div class="btnsDocs">
                                        <asp:Button ID="btnSaveDynamic" runat="server" Text="Salvar" CommandArgument='<%# Eval("DocumentoID") %>'
                                            CssClass="btnSaveDoc" OnClick="btnSaveDynamic_Click" />
                                        <asp:ImageButton ID="btnTrashDynamic" runat="server" ImageUrl="~/Imagens/delete.png"
                                            CommandArgument='<%# Eval("DocumentoID") %>' CssClass="btnTrashDoc" OnClick="btnTrashDynamic_Click" />
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form><footer>
    <!-- Seção Sobre Nós -->
    <div style="flex: 1; min-width: 200px; margin: 10px;">
        <h3>Sobre Porta Memória</h3>
        <p>
            Porta Memória é sua carteira virtual segura e acessível para armazenar documentos importantes na nuvem. Nossa missão é proteger suas informações e oferecer uma experiência fácil e intuitiva.
        </p>
    </div>

    <!-- Seção Links Úteis -->
    <div style="flex: 1; min-width: 200px; margin: 10px;">
        <h3>Links Úteis</h3>
        <ul>
            <li><a href="Index.aspx">Página Inicial</a></li>
            <li><a href="Notas.aspx">Bloco de Notas</a></li>
            <li><a href="Perfil.aspx">Perfil</a></li>
            <li><a href="Ajuda.aspx">Ajuda</a></li>
        </ul>
    </div>

    <!-- Seção Contato -->
    <div style="flex: 1; min-width: 200px; margin: 10px;">
        <h3>Contato</h3>
        <p>
            <strong>Email:</strong> contato@portamemoria.com<br/>
            <strong>Telefone:</strong> (11) 1234-5678<br/>
            <strong>Endereço:</strong> Rua Exemplo, 123, São Paulo, SP
        </p>
    </div>

    <!-- Seção Redes Sociais -->
    <div style="flex: 1; min-width: 200px; margin: 10px;">
        <h3>Siga-nos</h3>
        <div class="social-icons">
            <a href="https://www.facebook.com/portamemoria" target="_blank">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/facebook.png" alt="Facebook"/>
            </a>
            <a href="https://www.twitter.com/portamemoria" target="_blank">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/twitter.png" alt="Twitter"/>
            </a>
            <a href="https://www.instagram.com/portamemoria" target="_blank">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/instagram-new.png" alt="Instagram"/>
            </a>
            <a href="https://www.linkedin.com/company/portamemoria" target="_blank">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/linkedin.png" alt="LinkedIn"/>
            </a>
        </div>
    </div>
</footer>
</body>
    
</html>
