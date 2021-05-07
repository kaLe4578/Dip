using IkApp.Model;
using IkApp.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace IkApp
{
    /// <summary>
    /// Логика взаимодействия для AuthorisationWindow.xaml
    /// </summary>
    public partial class AuthorisationWindow : Window
    {
        BibEntities bibEntities = new BibEntities();

        public AuthorisationWindow()
        {
            InitializeComponent();
        }

        private void Button_ClickEntr(object sender, RoutedEventArgs e)
        {
            if (ModelCheck())
            {
                try
                {
                    Users users = bibEntities.Users.FirstOrDefault(p => p.Login == Login.Text && p.Password == Password.Password);
                    if (users.IsBlocked == true)
                    {
                        MessageBox.Show("заблокирован");
                        return;
                    }
                    switch (users.Role.ToLower())
                    {
                        case "менеджер":
                            MenagerWindow menager = new MenagerWindow();
                            menager.Show();
                            this.Close();
                            break;
                        case "администратор":
                            AdminWindow admin = new AdminWindow();
                            admin.Show();
                            this.Close();
                            break;
                    }
                }
                catch
                {
                    MessageBox.Show("неверный логин и пароль");
                }
            }
        }
        private bool ModelCheck()
        {
            StringBuilder error = new StringBuilder();
            if (Login.Text == "")
                error.AppendLine("Укажите логин");
            if (Password.Password == "")
                error.AppendLine("Укажите пароль");

            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return false;
            }
            else

                return true;
        }

    }
}
