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
    /// Логика взаимодействия для UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        BibEntities bibEntities = new BibEntities();
        

        public UserWindow()
        {
            InitializeComponent();
            datagrid.AutoGenerateColumns = false;
            datagrid.ItemsSource = bibEntities.Kniga.ToList(); 
        }

        private void Button_ClickExit(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void Button_ClickBooking(object sender, RoutedEventArgs e)
        {
            if (datagrid.SelectedItems.Count > 0)
            {
                Kniga kniga = (Kniga) datagrid.SelectedItems[0];
                BookingWindow bookingWindow = new BookingWindow(kniga);
                bookingWindow.Show();
            }
        }
    }
}
