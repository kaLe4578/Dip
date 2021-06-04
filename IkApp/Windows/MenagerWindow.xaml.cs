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
    /// Логика взаимодействия для MenagerWindow.xaml
    /// </summary>
    public partial class MenagerWindow : Window
    {
        BibEntities bibEntities = new BibEntities();

        public MenagerWindow()
        {
            InitializeComponent();
            datagridkniga.AutoGenerateColumns = false;
            datagridbron.AutoGenerateColumns = false;
            datagridkniga.ItemsSource = bibEntities.Kniga.ToList();
            datagridbron.ItemsSource = bibEntities.Journal.ToList();
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            EditKnigaWindow editKnigaWindow = new EditKnigaWindow();
            editKnigaWindow.Show();
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            if (datagridkniga.SelectedItems.Count > 0)
            {
                Kniga kniga = (Kniga)datagridkniga.SelectedItems[0];
                EditKnigaWindow editKnigaWindow = new EditKnigaWindow(kniga);
                editKnigaWindow.Show();
            }
        }

        private void Refresh_Click(object sender, RoutedEventArgs e)
        {
            bibEntities.ChangeTracker.Entries().ToList().ForEach(pi => pi.Reload());
            datagridkniga.ItemsSource = bibEntities.Kniga.ToList();
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

       

        private void Edit2_Click(object sender, RoutedEventArgs e)
        {
            if (datagridbron.SelectedItems.Count > 0)
            {
                Journal journal = (Journal)datagridbron.SelectedItems[0];
                EditJournalWindow editJournalWindow = new EditJournalWindow(journal);
                editJournalWindow.Show();
            }
        }

        private void Refresh2_Click(object sender, RoutedEventArgs e)
        {
            bibEntities.ChangeTracker.Entries().ToList().ForEach(pi => pi.Reload());
            datagridbron.ItemsSource = bibEntities.Journal.ToList();
        }

        private void Exit2_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Close();
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (datagridkniga.SelectedItems.Count > 0)
            {
                Kniga kniga = (Kniga)datagridkniga.SelectedItems[0];
                if (MessageBox.Show("Удалить?", "Внимание", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    try
                    {
                        bibEntities.Kniga.Remove(kniga);
                        bibEntities.SaveChanges();
                    }
                    catch (Exception err)
                    {
                        MessageBox.Show(err.ToString());
                    }
                }
            }
        }

        private void Delete2_Click(object sender, RoutedEventArgs e)
        {
            if (datagridbron.SelectedItems.Count > 0)
            {
                Journal journal = (Journal)datagridbron.SelectedItems[0];
                if (MessageBox.Show("Удалить?", "Внимание", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
                    try
                    {
                        bibEntities.Journal.Remove(journal);
                        bibEntities.SaveChanges();
                    }
                    catch (Exception err)
                    {
                        MessageBox.Show(err.ToString());
                    }
                }
            }
        }
    }
}
