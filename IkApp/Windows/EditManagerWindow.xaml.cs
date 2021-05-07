using IkApp.Model;
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

namespace IkApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditManagerWindow.xaml
    /// </summary>
    public partial class EditManagerWindow : Window
    {
        BibEntities bibEntities = new BibEntities();
        Users _users = new Users();

        public EditManagerWindow()
        {
            InitializeComponent();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (ModelCheck())
            {
                try
                {
                    if (_users.Id == 0)
                    {
                        _users.Login = Login.Text;
                        _users.Password = Password.Text;
                        _users.Role = "менеджер";
                        _users.IsBlocked = false;
                        bibEntities.Users.Add(_users);
                        MessageBox.Show("менеджер добавлен");
                    }
                    else
                    {
                        Users tempUsers = bibEntities.Users.FirstOrDefault(u => u.Id == _users.Id);
                        tempUsers.Login = Login.Text;
                        tempUsers.Password = Password.Text;
                        MessageBox.Show("менеджер изменен");
                    }
                    bibEntities.SaveChanges();
                }
                catch (Exception err)
                {
                    MessageBox.Show(err.ToString());
                }
            }
        }

        public EditManagerWindow(Users users)
        {
            InitializeComponent();
            Login.Text = users.Login;
            Password.Text = users.Password;
            _users.Id = users.Id;
        }

        private bool ModelCheck()
        {
            StringBuilder error = new StringBuilder();
            if (Login.Text == "")
                error.AppendLine("Укажите логин");
            if (Password.Text == "")
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
