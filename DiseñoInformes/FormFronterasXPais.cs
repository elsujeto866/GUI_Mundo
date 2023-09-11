using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_Mundo.DiseñoInformes
{
    public partial class FormFronterasXPais : Form
    {
        public FormFronterasXPais()
        {
            InitializeComponent();
        }

        private void FormFronterasXPais_Load(object sender, EventArgs e)
        {
            //Aqui debe enviarse el nombre del pais que se requiera buscar
            ReporteFronterasXPais rep = new ReporteFronterasXPais();
            rep.SetParameterValue("@nombrePais", "Ecuador");
            crystalReportViewer1.ReportSource = rep;
        }
    }
}
