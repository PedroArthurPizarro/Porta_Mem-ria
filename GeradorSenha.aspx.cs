using System;
using System.Text;
using System.Web.UI;

namespace Porta_Memória
{
    public partial class GeradorSenha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Código a ser executado ao carregar a página, se necessário
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Redirecionar para a página inicial (Index.aspx, por exemplo)
            Response.Redirect("Index.aspx");
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            int length;
            if (int.TryParse(txtLength.Text, out length) && length > 0)
            {
                string charType = ddlCharType.SelectedValue;
                string generatedPassword = GeneratePassword(length, charType);
                lblGeneratedPassword.Text = generatedPassword;
            }
            else
            {
                lblGeneratedPassword.Text = "Por favor, insira um número válido de caracteres.";
            }
        }

        private string GeneratePassword(int length, string charType)
        {
            const string numbers = "0123456789";
            const string letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            const string symbols = "!@#$%^&*()-_=+[]{}|;:,.<>?";

            string allowedChars = string.Empty;
            switch (charType)
            {
                case "Numbers":
                    allowedChars = numbers;
                    break;
                case "LettersSymbols":
                    allowedChars = letters + symbols;
                    break;
                case "All":
                    allowedChars = numbers + letters + symbols;
                    break;
            }

            StringBuilder password = new StringBuilder();
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                int index = random.Next(allowedChars.Length);
                password.Append(allowedChars[index]);
            }

            return password.ToString();
        }
    }
}
