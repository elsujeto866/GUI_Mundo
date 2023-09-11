using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_Mundo.FormReportes
{
    public partial class FormReporte2 : Form
    {
        public FormReporte2()
        {
            InitializeComponent();
        }



        private void FormReporte2_Load(object sender, EventArgs e)
        {

            this.reportViewer1.RefreshReport();
        }
    }
}
