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
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        BibEntities bibEntities = new BibEntities();

        public AdminWindow()
        {
            InitializeComponent();
            datagrid.AutoGenerateColumns = false;
            datagrid.ItemsSource = bibEntities.Users.Where(u => u.IsBlocked == false && u.Role == "менеджер").ToList();
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void Block_Click(object sender, RoutedEventArgs e)
        {
            if (datagrid.SelectedItems.Count > 0)
            {
                Users users = (Users)datagrid.SelectedItems[0];
                try
                {
                    if (MessageBox.Show("Удалить?", "Внимание", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                    {
                        users.IsBlocked= true;
                        bibEntities.SaveChanges();
                    }
                }
                catch (Exception err)
                {
                    MessageBox.Show(err.ToString());
                }
            }
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            if (datagrid.SelectedItems.Count > 0)
            {
                Users users = (Users)datagrid.SelectedItems[0];
                EditManagerWindow editManagerWindow = new EditManagerWindow(users);
                editManagerWindow.Show();
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            EditManagerWindow editManagerWindow = new EditManagerWindow();
            editManagerWindow.Show();
        }

        private void Abdeit_Click(object sender, RoutedEventArgs e)
        {
            bibEntities.ChangeTracker.Entries().ToList().ForEach(pi => pi.Reload());
            datagrid.ItemsSource = bibEntities.Users.Where(u => u.IsBlocked == false && u.Role == "менеджер").ToList();
        }
    }
}
