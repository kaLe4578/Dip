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
            KodComboBox.ItemsSource = bibEntities.InventarnoyKnigi.Select(s => s.Kod).ToList();
            KodComboBox.SelectedIndex = 0;
            Status.ItemsSource = bibEntities.Publication.Select(s => s.StatusKniga).ToList();
            Status.SelectedIndex = 0;
            Keyword.ItemsSource = bibEntities.Type.Select(s => s.Type1).ToList();
            Keyword.SelectedIndex = 0;

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
                        _kniga.GodIzdaniya = int.Parse(God.Text);
                        _kniga.RazdelSistematicheskogoKataloga = Razdel.Text;
                        _kniga.Keyword = Keyword.SelectedIndex + 1;
                        _kniga.NoteToEmployees = NoteToEmployees.Text;
                        _kniga.KodInventarnoyKnigi = KodComboBox.SelectedIndex + 1;
                        _kniga.Availability = (bool)Availability.IsChecked;
                        _kniga.Status = Status.SelectedIndex + 1;
                        bibEntities.Kniga.Add(_kniga);
                        MessageBox.Show("книга добавлена");

                    }
                    else
                    {
                        Kniga tempKniga = bibEntities.Kniga.FirstOrDefault(u => u.Id == _kniga.Id);
                        tempKniga.Author = Author.Text;
                        tempKniga.Name = Name.Text;
                        tempKniga.MestoIzdaniya = Mesto.Text;
                        tempKniga.RazdelSistematicheskogoKataloga = Razdel.Text;
                        tempKniga.Keyword = Keyword.SelectedIndex + 1;
                        tempKniga.Status = Status.SelectedIndex + 1;
                        tempKniga.NoteToEmployees = NoteToEmployees.Text;
                        tempKniga.GodIzdaniya = int.Parse(God.Text);
                        tempKniga.KodInventarnoyKnigi = KodComboBox.SelectedIndex + 1;
                        tempKniga.Availability = (bool)Availability.IsChecked;
                        MessageBox.Show("книга изменена");
                        
                    }
                    bibEntities.SaveChanges();
                }
                catch (Exception err)
                {
                    MessageBox.Show(err.ToString());
                }

            } 
        }
        public EditKnigaWindow(Kniga kniga)
        {
            InitializeComponent();
            _kniga.Id = kniga.Id;
            Author.Text = kniga.Author;
            Name.Text = kniga.Name;
            Mesto.Text = kniga.MestoIzdaniya;
            God.Text = kniga.GodIzdaniya.ToString();
            Razdel.Text = kniga.RazdelSistematicheskogoKataloga;
            NoteToEmployees.Text = kniga.NoteToEmployees;
            Availability.IsChecked = kniga.Availability;
            KodComboBox.ItemsSource = bibEntities.InventarnoyKnigi.Select(s => s.Kod).ToList();
            KodComboBox.SelectedIndex = (int)kniga.KodInventarnoyKnigi - 1;
            Keyword.ItemsSource = bibEntities.Type.Select(s => s.Type1).ToList();
            Keyword.SelectedIndex = (int)kniga.Keyword - 1;
            Status.ItemsSource = bibEntities.Publication.Select(s => s.StatusKniga).ToList();
            Status.SelectedIndex = (int)kniga.Status - 1;




        }
        private bool ModelCheck()
        {
            StringBuilder error = new StringBuilder();
            if (Name.Text == "")
                error.AppendLine("Укажите название");
            if (Razdel.Text == "")
                error.AppendLine("Укажите раздел систематического каталога");
            if (God.Text == "")
                error.AppendLine("Укажите год");


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

    