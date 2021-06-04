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
    /// Логика взаимодействия для EditJournalWindow.xaml
    /// </summary>
    public partial class EditJournalWindow : Window
    {
        BibEntities bibEntities = new BibEntities();
        Journal _journal = new Journal();

       

        public EditJournalWindow(Journal journal)
        {
            InitializeComponent();
            BookingStatus.ItemsSource = bibEntities.Status.Select(s => s.Status1).ToList();
            BookingStatus.SelectedIndex = (int)journal.BookingStatus - 1;
            _journal.Id = journal.Id;
            I.Text = journal.I;
            F.Text = journal.F;
            O.Text = journal.O;
            BookingStartData.SelectedDate = journal.BookingStartData;
            BookingEndData.SelectedDate = journal.BookingEndData;


        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (ModelCheck())
            {
                try
                {

                    Journal tempJournal = bibEntities.Journal.FirstOrDefault(u => u.Id == _journal.Id);
                    tempJournal.I = I.Text;
                    tempJournal.F = F.Text;
                    tempJournal.O = O.Text;
                    tempJournal.BookingStartData = (DateTime)BookingStartData.SelectedDate;
                    tempJournal.BookingEndData = (DateTime)BookingEndData.SelectedDate;
                    tempJournal.BookingStatus = BookingStatus.SelectedIndex + 1;
                    MessageBox.Show("бронирование изменнено");
                    bibEntities.SaveChanges();


                } catch(Exception err)
                {
                    MessageBox.Show(err.ToString());
                }
            }


        }

        private bool ModelCheck()
        {
            StringBuilder error = new StringBuilder();
            
            if (F.Text == "")
                error.AppendLine("Укажите фамилию");
            if (I.Text == "")
                error.AppendLine("Укажите имя");
            if (BookingEndData.SelectedDate == null)
                error.AppendLine("Укажите дату окончания бронирования");



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
