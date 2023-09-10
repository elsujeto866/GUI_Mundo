using DAL_Mundo;
using ML_Mundo;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Mundo
{
    public class BLL_Gobierno
    {
        private DAL_Gobierno gobiernoDatos = new DAL_Gobierno();

        public ObservableCollection<CargarGobiernosResult> CargarGobiernos()
        {
            return gobiernoDatos.CargarGobiernos();
        }
    }
}
