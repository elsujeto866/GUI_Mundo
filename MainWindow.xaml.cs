﻿using BLL_Mundo;
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
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Cargar(object sender, RoutedEventArgs e)
        {
            membersDataGrid.ItemsSource = paisNegocio.CargarPaises();
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
    }
}
