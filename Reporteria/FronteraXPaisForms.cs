using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_Mundo.Reporteria
{
    public partial class FronteraXPaisForms : Form
    {
        //Por defecto mostrará el país de Ecuador en el reporte
        string paisamostrar = "Ecuador";
        public FronteraXPaisForms()
        {
            InitializeComponent();
        }

        //Se carga el forms con el pais que se desee buscar los vecinos
        public FronteraXPaisForms(String pais)
        {
            paisamostrar = pais;
            InitializeComponent();
        }

        private void FronteraXPaisForms_Load(object sender, EventArgs e)
        {
            btnBorrar.Enabled = false;
            ;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void txtPais_TextChanged(object sender, EventArgs e)
        {
            btnGenerar.Enabled = true;
            btnBorrar.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if(txtPais.Text != null)
            {
                btnGenerar.Enabled = true;
                paisamostrar = txtPais.Text;

                FronterasXPaisReport repfrontera = new FronterasXPaisReport();
                repfrontera.SetParameterValue("@nombrePais", paisamostrar);
                crystalReportViewer1.ReportSource = repfrontera;
                btnBorrar.Enabled = true;
            }
            else
            {
                btnGenerar.Enabled = false;
            }
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            txtPais.Text = null;
            btnGenerar.Enabled = false;
        }

        private void txtPais_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                // Si no es una letra ni Backspace, suprimir la tecla presionada
                e.Handled = true;
            }
            else if (txtPais.Text.Length == 0)
            {
                // Si el TextBox está vacío, convertir la primera letra en mayúscula
                e.KeyChar = char.ToUpper(e.KeyChar);
            }
        }
    }
}
