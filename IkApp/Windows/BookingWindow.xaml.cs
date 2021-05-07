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

namespace IkApp
{
    /// <summary>
    /// Логика взаимодействия для BookingWindow.xaml
    /// </summary>
    public partial class BookingWindow : Window
    {
        BibEntities bibEntities = new BibEntities();
        Journal _journal = new Journal();
        int idBook;

        public BookingWindow(Kniga kniga)
        {
            InitializeComponent();
            idBook = kniga.Id;

        }

        private void Booking_Click(object sender, RoutedEventArgs e)
        {
            if (ModelCheck())
            {
                try
                {
                    _journal.BookingStatus = 1;
                    _journal.BookingStartData = DateTime.Now;
                    _journal.IdBook = idBook;
                    _journal.F = Famili.Text;
                    _journal.I = Imi.Text;
                    _journal.O = Otcestvo.Text;
                    bibEntities.Journal.Add(_journal);
                    bibEntities.SaveChanges();
                    MessageBox.Show("Книга забронирована");
                    this.Close();
                }
                catch (Exception err)
                {
                    MessageBox.Show(err.ToString());
                }
            }
        }
        private bool ModelCheck()
        {
            StringBuilder error = new StringBuilder();
            if (Famili.Text == "")
                error.AppendLine("Укажите фамилию");
            if (Imi.Text == "")
                error.AppendLine("Укажите имя");
            if (Otcestvo.Text == "")
                error.AppendLine("Укажите отчество");

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
