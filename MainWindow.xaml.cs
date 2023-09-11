using BLL_Mundo;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using ML_Mundo;
using GUI_Mundo.Reporteria;

namespace GUI_Mundo
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        BLL_Pais paisNegocio = new BLL_Pais();
        BLL_Continente continenteNegocio = new BLL_Continente();
        BLL_Idioma idiomaNegocio = new BLL_Idioma();
        BLL_Gobierno gobiernoNegocio = new BLL_Gobierno();


        private Button[] botones;
        private int currentButtonIndex = 1;

        public MainWindow()
        {
            InitializeComponent();
        }
        private void FmrPrincipal_Loaded(object sender, RoutedEventArgs e)
        {
            CargarDatos(1);
            botones = new Button[]
            {
                btnPais,
                btnContinente,
                btnIdioma,
                btnGobierno,
                btnIdiomasPais,
                btnVecinosPais
            };
        }

        private void CargarDatos(int vIndice)
        {
            dgPaises.Items.Clear();
            
            if(vIndice == 1)
            {
                
                foreach (var p in paisNegocio.CargarPaises())
                {
                    dgPaises.Items.Add(p);
                }
                clmPrimera.Binding = new Binding("id");
                clmPrimera.Width = DataGridLength.SizeToCells;
                clmPrimera.Visibility = Visibility.Visible;
                clmPrimera.Header = "#";
                clmSegunda.Visibility = Visibility.Visible;
                clmTercera.Binding = new Binding("capital");
                clmTercera.Width = DataGridLength.SizeToCells;
                clmTercera.Visibility = Visibility.Visible;
                clmTercera.Header = "Capital";
                clmCuarta.Binding = new Binding("moneda");
                clmCuarta.Width = DataGridLength.SizeToCells;
                clmCuarta.Visibility = Visibility.Visible;
                clmCuarta.Header = "Moneda";
                clmQuinta.Binding = new Binding("continente");
                clmQuinta.Width = 100;
                clmQuinta.Visibility = Visibility.Visible;
                clmQuinta.Header = "Continente";
                clmSexta.Binding = new Binding("gobierno");
                clmSexta.Width = DataGridLength.SizeToCells;
                clmSexta.Visibility = Visibility.Visible;
                clmSexta.Header = "Gobierno";               
                clmSeptima.Binding = new Binding("extension");
                clmSeptima.Width = DataGridLength.SizeToCells;
                clmSeptima.Visibility = Visibility.Visible;
                clmSeptima.Header = "Extensión";
                clmOctava.Binding = new Binding("poblacion");
                clmOctava.Width = DataGridLength.SizeToCells;
                clmOctava.Visibility = Visibility.Visible;
                clmOctava.Header = "Población";
                clmNovena.Binding = new Binding("posicion");
                clmNovena.Width = DataGridLength.SizeToCells;
                clmNovena.Visibility = Visibility.Visible;
                clmNovena.Header = "Posicion";
                

            }
            else if(vIndice == 2)
            {
                foreach (var c in continenteNegocio.CargarContinentes())
                {
                    dgPaises.Items.Add(c);
                }
                clmPrimera.Binding = new Binding("id");
                clmPrimera.Width = DataGridLength.SizeToCells;
                clmPrimera.Visibility = Visibility.Visible;
                clmPrimera.Header = "#";
                clmSegunda.Visibility = Visibility.Collapsed;
                clmTercera.Binding = new Binding("continente");
                clmTercera.Width = 100;
                clmTercera.Header = "Continente";
                clmCuarta.Visibility = Visibility.Collapsed;
                clmQuinta.Visibility = Visibility.Collapsed;
                clmSexta.Visibility = Visibility.Collapsed;
                clmSeptima.Visibility = Visibility.Collapsed; 
                clmOctava.Visibility = Visibility.Collapsed;
                clmNovena.Visibility = Visibility.Collapsed;
            }

            else if (vIndice == 3)  
            {
                foreach (var i in idiomaNegocio.CargarIdiomas())
                {
                    dgPaises.Items.Add(i);
                }
                clmPrimera.Binding = new Binding("id");
                clmPrimera.Width = DataGridLength.SizeToCells;
                clmPrimera.Visibility = Visibility.Visible;
                clmPrimera.Header = "#";
                clmSegunda.Visibility = Visibility.Collapsed;
                clmTercera.Binding = new Binding("idioma");
                clmTercera.Width = DataGridLength.SizeToCells;
                clmTercera.Header = "Idioma";
                clmCuarta.Visibility = Visibility.Collapsed;
                clmQuinta.Visibility = Visibility.Collapsed;
                clmSexta.Visibility = Visibility.Collapsed;
                clmSeptima.Visibility = Visibility.Collapsed;
                clmOctava.Visibility = Visibility.Collapsed;
                clmNovena.Visibility = Visibility.Collapsed;
            }

            else if (vIndice == 4)
            {
                foreach (var i in gobiernoNegocio.CargarGobiernos())
                {
                    dgPaises.Items.Add(i);
                }
                clmPrimera.Binding = new Binding("id");
                clmPrimera.Width = DataGridLength.SizeToCells;
                clmPrimera.Visibility = Visibility.Visible;
                clmPrimera.Header = "#";
                clmSegunda.Visibility = Visibility.Collapsed;
                clmTercera.Binding = new Binding("gobierno");
                clmTercera.Width = DataGridLength.SizeToCells;
                clmTercera.Header = "Gobierno";
                clmCuarta.Visibility = Visibility.Collapsed;
                clmQuinta.Visibility = Visibility.Collapsed;
                clmSexta.Visibility = Visibility.Collapsed;
                clmSeptima.Visibility = Visibility.Collapsed;
                clmOctava.Visibility = Visibility.Collapsed;
                clmNovena.Visibility = Visibility.Collapsed;
            }
            else if (vIndice == 5)
            {
                foreach (var ip in paisNegocio.CargarIdiomasPais())
                {
                    dgPaises.Items.Add(ip);
                }
                clmPrimera.Binding = new Binding("pais");
                clmPrimera.Width = DataGridLength.SizeToCells;
                clmPrimera.Visibility = Visibility.Visible;
                clmPrimera.Header = "País";
                clmSegunda.Visibility = Visibility.Collapsed;
                clmTercera.Binding = new Binding("idioma");
                clmTercera.Width = DataGridLength.SizeToCells;
                clmTercera.Visibility = Visibility.Visible;
                clmTercera.Header = "Idioma";
                clmCuarta.Binding = new Binding("hablantes");
                clmCuarta.Width = DataGridLength.SizeToCells;
                clmCuarta.Visibility = Visibility.Visible;
                clmCuarta.Header = "Hablantes";
                clmQuinta.Binding = new Binding("porcentaje");
                clmQuinta.Width =100;
                clmQuinta.Visibility = Visibility.Visible;
                clmQuinta.Header = "Porcentaje";
                clmSexta.Visibility = Visibility.Collapsed;
                clmSeptima.Visibility = Visibility.Collapsed;
                clmOctava.Visibility = Visibility.Collapsed;
                clmNovena.Visibility = Visibility.Collapsed;
            }

            else if (vIndice == 6)
            {
                foreach (var pv in paisNegocio.CargarPaisesVecinos())
                {
                    dgPaises.Items.Add(pv);
                }
                clmPrimera.Binding = new Binding("pais");
                clmPrimera.Width = DataGridLength.SizeToCells;
                clmPrimera.Visibility = Visibility.Visible;
                clmPrimera.Header = "País";
                clmSegunda.Visibility = Visibility.Collapsed;
                clmTercera.Binding = new Binding("vecino");
                clmTercera.Width = DataGridLength.SizeToCells;
                clmTercera.Visibility = Visibility.Visible;
                clmTercera.Header = "Vecino";
                clmCuarta.Binding = new Binding("kms_frontera");
                clmCuarta.Width = 100;
                clmCuarta.Visibility = Visibility.Visible;
                clmCuarta.Header = "Frontera Km";
                clmQuinta.Visibility = Visibility.Collapsed;
                clmSexta.Visibility = Visibility.Collapsed;
                clmSeptima.Visibility = Visibility.Collapsed;
                clmOctava.Visibility = Visibility.Collapsed;
                clmNovena.Visibility = Visibility.Collapsed;
            }

        }

        #region Movimiento
        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }

        private bool IsMaximized = false;
        private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ClickCount == 2)
            {
                if (IsMaximized)
                {
                    this.WindowState = WindowState.Normal;
                    this.Width = 1080;
                    this.Height = 720;
                    IsMaximized = false;
                }
                else
                {
                    this.WindowState = WindowState.Maximized;
                    IsMaximized = true;
                }
            }
        }

        #endregion


        #region Botones Panel Izquierdo

        private void btnPaisesReport_Click(object sender, RoutedEventArgs e)
        {
            FormMostrarPaises report = new FormMostrarPaises();
            report.ShowDialog();
        }

        private void btnPaisesenContinenteReport_Click(object sender, RoutedEventArgs e)
        {
            PaisesEnContinentesForms report = new PaisesEnContinentesForms();
            report.ShowDialog();
        }

        private void btnGeografiaRep_Click(object sender, RoutedEventArgs e)
        {
            TipoPaisGeografiaForm report = new TipoPaisGeografiaForm();
            report.ShowDialog();
        }

        private void btnIdiomas_Click(object sender, RoutedEventArgs e)
        {
            IdiomaPaisesForm report = new IdiomaPaisesForm();
            report.ShowDialog();
        }
        private void btnCostFront_Click(object sender, RoutedEventArgs e)
        {
            ConstaYFronteraForm report = new ConstaYFronteraForm();
            report.ShowDialog();
        }

        private void btnFronterasdePais_Click(object sender, RoutedEventArgs e)
        {
            FronteraXPaisForms report = new FronteraXPaisForms();
            report.ShowDialog();
        }
        

        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            dialogHostSalir.IsOpen = true;
        }

        private void btnAceptarCerrar_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
        



        #endregion

        #region Botones Panel Central
        private void btnPais_Click(object sender, RoutedEventArgs e)
        {
            currentButtonIndex = 1;
            CambioVisualBotones(1);
            CargarDatos(1);
        }

        private void btnContinente_Click(object sender, RoutedEventArgs e)
        {

            currentButtonIndex = 2;
            CambioVisualBotones(2);
            CargarDatos(2);



        }

        private void btnIdioma_Click(object sender, RoutedEventArgs e)
        {
            currentButtonIndex = 3;
            CambioVisualBotones(3);
            CargarDatos(3);
        }

        private void btnGobierno_Click(object sender, RoutedEventArgs e)
        {
            currentButtonIndex = 4;
            CambioVisualBotones(4);
            CargarDatos(4);

        }

        private void btnIdiomasPais_Click(object sender, RoutedEventArgs e)
        {
            currentButtonIndex = 5;
            CambioVisualBotones(5);
            CargarDatos(5);

        }

        private void btnVecinosPais_Click(object sender, RoutedEventArgs e)
        {
            currentButtonIndex = 6;
            CambioVisualBotones(6);
            CargarDatos(6);
        }

        private void CambioVisualBotones(int ide)
        {
            if(ide == 1)
            {
                btnPais.BorderBrush = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#784ff2"));
                btnContinente.BorderBrush = Brushes.Transparent;
                btnIdioma.BorderBrush = Brushes.Transparent;
                btnGobierno.BorderBrush = Brushes.Transparent;
                btnIdiomasPais.BorderBrush = Brushes.Transparent;
                btnVecinosPais.BorderBrush = Brushes.Transparent;
            }
            else if(ide == 2)
            {
                btnPais.BorderBrush = Brushes.Transparent;
                btnContinente.BorderBrush = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#784ff2"));
                btnIdioma.BorderBrush = Brushes.Transparent;
                btnGobierno.BorderBrush = Brushes.Transparent;
                btnIdiomasPais.BorderBrush = Brushes.Transparent;
            }
            else if (ide == 3)
            {
                btnPais.BorderBrush = Brushes.Transparent;
                btnContinente.BorderBrush = Brushes.Transparent;
                btnIdioma.BorderBrush = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#784ff2"));
                btnGobierno.BorderBrush = Brushes.Transparent;
                btnIdiomasPais.BorderBrush = Brushes.Transparent;
                btnVecinosPais.BorderBrush = Brushes.Transparent;
            }
            else if (ide == 4)
            {
                btnPais.BorderBrush = Brushes.Transparent;
                btnContinente.BorderBrush = Brushes.Transparent;
                btnIdioma.BorderBrush = Brushes.Transparent;
                btnGobierno.BorderBrush = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#784ff2"));
                btnIdiomasPais.BorderBrush = Brushes.Transparent;
                btnVecinosPais.BorderBrush = Brushes.Transparent;
            }
            else if (ide == 5)
            {
                btnPais.BorderBrush = Brushes.Transparent;
                btnContinente.BorderBrush = Brushes.Transparent;
                btnIdioma.BorderBrush = Brushes.Transparent;
                btnGobierno.BorderBrush = Brushes.Transparent;
                btnIdiomasPais.BorderBrush = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#784ff2"));
                btnVecinosPais.BorderBrush = Brushes.Transparent;
            }
            else if (ide == 6)
            {
                btnPais.BorderBrush = Brushes.Transparent;
                btnContinente.BorderBrush = Brushes.Transparent;
                btnIdioma.BorderBrush = Brushes.Transparent;
                btnGobierno.BorderBrush = Brushes.Transparent;
                btnIdiomasPais.BorderBrush = Brushes.Transparent;
                btnVecinosPais.BorderBrush = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#784ff2"));
            }
        }

        private void FmrPrincipal_PreviewKeyUp(object sender, KeyEventArgs e)
        {
            if(e.Key == Key.Tab) 
            {
                // Activa el evento Click del botón actual
                botones[currentButtonIndex].RaiseEvent(new RoutedEventArgs(Button.ClickEvent));

                // Incrementa el índice para pasar al siguiente botón
                //currentButtonIndex++;

                // Si llegamos al último botón, volvemos al primero
                if (currentButtonIndex >= botones.Length)
                {
                    currentButtonIndex = 0;
                }

                // Evita que la tecla "Tab" se propague
                e.Handled = true;

            }
        }
        private void FmrPrincipal_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Tab)
            {
                e.Handled = true;
            }
        }

        #endregion

        private void dgPaises_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        #region Botones del CRUD
        private void btnEliminar_Click(object sender, RoutedEventArgs e)
        {
            //Seleciono la casilla
            var filaSelecionada = dgPaises.SelectedItem;
            var casillaVerificacion = dgPaises.Columns[0].GetCellContent(filaSelecionada) as CheckBox;
            casillaVerificacion.IsChecked = true;

            //Muestro el mensaje
            dialogHostEliminar.IsOpen = true;

            //Obtengo el id
            //int idVerificacion = Convert.ToInt32(dgPaises.Columns[1].GetCellContent(filaSelecionada));
        }
        private void btnAceptarEliminar_Click(object sender, RoutedEventArgs e)
        {
            if (currentButtonIndex == 1)
            {
                try
                {
                    var filaSelecionada = (CargarPaisesResult)dgPaises.SelectedItem;
                    int idSelecionado = Convert.ToInt32(filaSelecionada.id);

                    paisNegocio.eliminarPais(idSelecionado);
                    CargarDatos(1);
                }
                catch (Exception ex)
                {

                }
            }else if (currentButtonIndex == 2)
            {
                try
                {
                    var filaSelecionada = (CargarContinentesResult)dgPaises.SelectedItem;
                    int idSelecionado = Convert.ToInt32(filaSelecionada.id);
                    continenteNegocio.eliminarContinente(idSelecionado);
                    CargarDatos(2);
                }
                catch (Exception ex)
                {

                }
            }
            else if (currentButtonIndex == 3)
            {
                try
                {
                    var filaSelecionada = (CargarIdiomasResult)dgPaises.SelectedItem;
                    int idSelecionado = Convert.ToInt32(filaSelecionada.id);
                    idiomaNegocio.eliminarIdioma(idSelecionado);
                    CargarDatos(3);
                }
                catch (Exception ex)
                {

                }
            }

            else if (currentButtonIndex == 4)
            {
                try
                {
                    var filaSelecionada = (CargarGobiernosResult)dgPaises.SelectedItem;
                    int idSelecionado = Convert.ToInt32(filaSelecionada.id);
                    gobiernoNegocio.eliminarGobierno(idSelecionado);
                    CargarDatos(4);
                }
                catch (Exception ex)
                {

                }
            }
            else if (currentButtonIndex == 5)
            {
                try
                {
                    var filaSelecionada = (CargarPaisesIdiomasResult)dgPaises.SelectedItem;
                    string pais = filaSelecionada.pais;
                    string idioma = filaSelecionada.idioma;
                    int idPais = paisNegocio.ObtenerIdPais(pais).FirstOrDefault().id;
                    int idIdioma = idiomaNegocio.ObtenerIdIdioma(idioma).FirstOrDefault().id;

                    paisNegocio.eliminarPaisIdioma(idPais,idIdioma);
                    CargarDatos(5);
                }
                catch (Exception ex)
                {

                }
            }
            else if (currentButtonIndex == 6)
            {
                try
                {
                    var filaSelecionada = (CargarPaisesVecinosResult)dgPaises.SelectedItem;
                    string pais = filaSelecionada.pais;
                    string vecino = filaSelecionada.vecino;
                    int idPais = paisNegocio.ObtenerIdPais(pais).FirstOrDefault().id;
                    int idVecino = paisNegocio.ObtenerIdPais(vecino).FirstOrDefault().id;

                    paisNegocio.eliminarPaisVecino(idPais, idVecino);
                    CargarDatos(6);
                }
                catch (Exception ex)
                {

                }
            }


        }

        #endregion


    }
}
