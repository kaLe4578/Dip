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
    /// Логика взаимодействия для EditKnigaWindow.xaml
    /// </summary>
    public partial class EditKnigaWindow : Window
    {
        BibEntities bibEntities = new BibEntities();
        Kniga _kniga = new Kniga();

        public EditKnigaWindow()
        {
            InitializeComponent();
            KodComboBox.ItemsSource = bibEntities.Status.Select(s => s.Status1).ToList();
            KodComboBox.SelectedIndex = 0;

        }
        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (ModelCheck())
            {
                try
                {
                    if (_kniga.Id == 0)
                    {
                        
                        _kniga.Author = Author.Text;
                        _kniga.Name = Name.Text;
                        _kniga.MestoIzdaniya = Mesto.Text;
                        _kniga.GodIzdaniya = (DateTime)God.SelectedDate; ;
                        _kniga.RazdelSistematicheskogoKataloga = Razdel.Text;
                        _kniga.Keyword = Keyword.Text;
                        _kniga.NoteToEmployees = NoteToEmployees.Text;
                        KodComboBox.ItemsSource = bibEntities.InventarnoyKnigi.Select(s => s.Kod).ToList();
                        KodComboBox.SelectedIndex = 0;

                    }

                }
                catch
                {

                }

             } 
        }
        private bool ModelCheck()
        {
            StringBuilder error = new StringBuilder();
            if (Name.Text == "")
                error.AppendLine("Укажите название");
            if (Razdel.Text == "")
                error.AppendLine("Укажите раздел систематического каталога");


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

    