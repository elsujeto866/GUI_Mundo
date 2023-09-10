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


namespace GUI_Mundo
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        BLL_Pais paisNegocio = new BLL_Pais();

        private Button[] botones;
        private int currentButtonIndex = 1;

        public MainWindow()
        {
            InitializeComponent();
        }
        private void FmrPrincipal_Loaded(object sender, RoutedEventArgs e)
        {
            CargarDatos();
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

        private void CargarDatos()
        {
            dgPaises.Items.Clear();
            foreach (var p in paisNegocio.CargarPaises())
            {
                dgPaises.Items.Add(p);
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
        private void btnSalir_Click(object sender, RoutedEventArgs e)
        {
            /*MessageBoxResult result = MessageBox.Show("Está seguro que desea salir", "SALIR",MessageBoxButton.YesNo);

            if(result == MessageBoxResult.Yes)
            {
                Application.Current.Shutdown();
            }*/

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
            CambioVisualBotones(1);
        }

        private void btnContinente_Click(object sender, RoutedEventArgs e)
        {
            CambioVisualBotones(2);
            

        }

        private void btnIdioma_Click(object sender, RoutedEventArgs e)
        {
            CambioVisualBotones(3);

        }

        private void btnGobierno_Click(object sender, RoutedEventArgs e)
        {
            CambioVisualBotones(4);

        }

        private void btnIdiomasPais_Click(object sender, RoutedEventArgs e)
        {
            CambioVisualBotones(5);

        }

        private void btnVecinosPais_Click(object sender, RoutedEventArgs e)
        {
            CambioVisualBotones(6);

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
                currentButtonIndex++;

                // Si llegamos al último botón, volvemos al primero
                if (currentButtonIndex >= botones.Length)
                {
                    currentButtonIndex = 0;
                }

                // Evita que la tecla "Tab" se propague
                e.Handled = true;

            }
        }


        #endregion

        private void dgPaises_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

      

       
    }
}
