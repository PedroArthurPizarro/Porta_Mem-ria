<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADMIN.aspx.cs" Inherits="Porta_Memória.ADMIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Painel de Administração</title>
    <style>
        /* Resetando alguns estilos para garantir consistência */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            background-color: #0e87b7;
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 1.8em;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .consulta-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .consulta-section h3 {
            margin-bottom: 20px;
            font-size: 1.4em;
            color: #0e87b7;
        }

        .consulta-section input[type="text"] {
            width: calc(100% - 120px);
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1em;
        }

        .consulta-section button {
            padding: 10px 20px;
            background-color: #0e87b7;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1em;
        }

        .consulta-section button:hover {
            background-color: #0c74a0;
        }

        .data-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .data-section table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .data-section table th,
        .data-section table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .data-section table th {
            background-color: #0e87b7;
            color: white;
            font-weight: bold;
        }

        .data-section table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .data-section table tr:hover {
            background-color: #f1f1f1;
        }

        .data-section table td {
            color: #555;
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #aaa;
        }

        /* Estilo responsivo */
        @media (max-width: 768px) {
            .consulta-section input[type="text"] {
                width: calc(100% - 110px);
            }

            .consulta-section button {
                width: 100%;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Cabeçalho -->
            <div class="header">
                Tela de Administração - Banco de Dados
            </div>

            <!-- Sessão de consulta -->
            <div class="consulta-section">
                <h3>Consulta no Banco de Dados</h3>
                <asp:TextBox ID="TextBox1" runat="server" Placeholder="Digite o que deseja consultar"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Consultar" />
            </div>

            <!-- Tabelas de dados exibidos após consulta -->
            <div class="data-section">
                <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#0e87b7" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#0e87b7" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>

                <!-- Exemplo de tabela estática -->
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Usuários</th>
                    </tr>
                    <tr>
                        <td>Dado 1</td>
                        <td>Dado 2</td>
                    </tr>
                    <tr>
                        <td>Dado 3</td>
                        <td>Dado 4</td>
                    </tr>
                </table>
            </div>

            <div class="footer">
                &copy; 2024 Administração - Todos os direitos reservados.
            </div>
        </div>
    </form>
</body>
</html>

