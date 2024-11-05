<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajuda.aspx.cs" Inherits="Porta_Memória.Ajuda" %>

<!DOCTYPE html>

<style>
        /* Estilos gerais */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

h2 {
    color: #0056b3;
    margin-top: 20px;
    border-bottom: 2px solid #0056b3;
    padding-bottom: 5px;
}

.faq-item {
    margin-bottom: 15px;
}

.faq-item h3 {
    color: #333;
    font-size: 1.1em;
    margin-bottom: 5px;
}

.faq-item p {
    margin: 0;
    color: #666;
}

#instrucoes ol {
    padding-left: 20px;
    color: #555;
}

#instrucoes ol li {
    margin-bottom: 10px;
}

#suporte ul {
    list-style-type: none;
    padding-left: 0;
}

#suporte ul li {
    color: #333;
    margin: 5px 0;
}

.voltar {
    text-align: center;
    margin-top: 20px;
}

.voltar a {
    color: #0056b3;
    text-decoration: none;
    font-weight: bold;
}

.voltar a:hover {
    color: #003d7a;
    text-decoration: underline;
}

    </style>
</head>
    
<body>
    <form id="formAjuda" runat="server">
        <div class="container">
            <h1>Ajuda e Suporte</h1>
            <p>Bem-vindo à seção de Ajuda! Aqui você encontra respostas para perguntas frequentes e orientações sobre como usar o site.</p>

            <!-- Seção de Perguntas Frequentes -->
            <section id="faq">
                <h2>Perguntas Frequentes</h2>
                <div class="faq-item">
                    <h3>1. Como posso adicionar um novo documento?</h3>
                    <p>Para adicionar um novo documento, clique no botão "Adicionar Documento" na página principal e preencha as informações solicitadas.</p>
                </div>
                <div class="faq-item">
                    <h3>2. Como posso editar ou atualizar um documento?</h3>
                    <p>Para editar um documento, clique no título do documento. O conteúdo será exibido em um bloco de notas para que você possa realizar as edições.</p>
                </div>
                <div class="faq-item">
                    <h3>3. Onde posso visualizar todos os documentos?</h3>
                    <p>Todos os seus documentos ficam disponíveis na página inicial após o login. Eles estão organizados para fácil acesso e consulta.</p>
                </div>
                <div class="faq-item">
                    <h3>4. Como posso apagar um documento?</h3>
                    <p>Para apagar um documento, clique no botão de lixeira associado ao documento. Ele será movido para a área de exclusão, onde pode ser recuperado ou removido definitivamente.</p>
                </div>
            </section>

            <!-- Seção de Instruções de Uso -->
            <section id="instrucoes">
                <h2>Instruções de Uso</h2>
                <ol>
                    <li><strong>Login e Cadastro:</strong> Acesse o sistema com seu login. Caso ainda não tenha cadastro, registre-se com suas informações básicas.</li>
                    <li><strong>Adição de Documentos:</strong> Após o login, use o botão "Adicionar" para criar novos documentos e salvá-los em sua carteira virtual.</li>
                    <li><strong>Visualização:</strong> Seus documentos serão exibidos na página principal. Clique em um documento para visualizar e editar.</li>
                    <li><strong>Segurança:</strong> Suas informações são criptografadas e protegidas. Lembre-se de manter sua senha segura e confidencial.</li>
                </ol>
            </section>

            <!-- Seção de Suporte -->
            <section id="suporte">
                <h2>Suporte</h2>
                <p>Se você tiver dúvidas adicionais ou enfrentar problemas técnicos, entre em contato com nosso suporte:</p>
                <ul>
                    <li>Email: <a href="mailto:suporte@carteiravirtual.com">suporte@carteiravirtual.com</a></li>
                    <li>Telefone: (11) 1234-5678</li>
                    <li>Horário de Atendimento: Segunda a Sexta, das 8h às 18h</li>
                </ul>
            </section>

            <!-- Link para voltar à página principal -->
            <div class="voltar">
                <a href="Index.aspx">Voltar à Página Inicial</a>
            </div>
        </div>
    </form>
</body>
</html>
