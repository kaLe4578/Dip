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
using Word = Microsoft.Office.Interop.Word;

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
                Kniga kniga = (Kniga)datagrid.SelectedItems[0];
                BookingWindow bookingWindow = new BookingWindow(kniga);
                bookingWindow.Show();
            }
        }



        private void Search(object sender, TextChangedEventArgs e)
        {
            Updata();
        }

        private void Updata()
        {
            var kniga = bibEntities.Kniga.Where(c1 => c1.Name.ToLower().Contains(SearchBox.Text.ToLower())).ToList();
            datagrid.ItemsSource = kniga.ToList();
        }

        private void Print_Click(object sender, RoutedEventArgs e)
        {

            var kniga = bibEntities.Kniga.ToList();
            var application = new Word.Application();
            Word.Document document = application.Documents.Add();



            Word.Paragraph paragraphTable = document.Paragraphs.Add();
            Word.Range rangeTable = paragraphTable.Range;
            Word.Table table = document.Tables.Add(rangeTable, kniga.Count(), 6);
            table.Borders.InsideLineStyle = table.Borders.OutsideLineStyle = Word.WdLineStyle.wdLineStyleSingle;
            table.Range.Cells.VerticalAlignment = Word.WdCellVerticalAlignment.wdCellAlignVerticalCenter;

            Word.Range cellRange;

            cellRange = table.Cell(1, 1).Range;
            cellRange.Text = "№";

            cellRange = table.Cell(1, 2).Range;
            cellRange.Text = "Автор";

            cellRange = table.Cell(1, 3).Range;
            cellRange.Text = "Название";

            cellRange = table.Cell(1, 4).Range;
            cellRange.Text = "Место издания";

            cellRange = table.Cell(1, 5).Range;
            cellRange.Text = "Год издания";

            cellRange = table.Cell(1, 6).Range;
            cellRange.Text = "Раздел систематического каталлога";

            table.Rows[1].Range.Bold = 1;
            table.Rows[1].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphCenter;

            for (int i = 0; i < kniga.Count(); i++)
            {
                var currentKniga = kniga[i];

                cellRange = table.Cell(i + 2, 1).Range;
                cellRange.Text = currentKniga.KodInventarnoyKnigi.ToString();
                cellRange = table.Cell(i + 2, 2).Range;
                cellRange.Text = currentKniga.Author;
                cellRange = table.Cell(i + 2, 3).Range;
                cellRange.Text = currentKniga.Name;
                cellRange = table.Cell(i + 2, 4).Range;
                cellRange.Text = currentKniga.MestoIzdaniya.ToString();
                cellRange = table.Cell(i + 2, 5).Range;
                cellRange.Text = currentKniga.GodIzdaniya.ToString();
                cellRange = table.Cell(i + 2, 6).Range;
                cellRange.Text = currentKniga.RazdelSistematicheskogoKataloga;
            }

            application.Visible = true;
            document.SaveAs2(@"D:\test.docx");
            document.SaveAs2(@"D:\test.pdf", Word.WdExportFormat.wdExportFormatPDF);
        }

        
    }
}
 