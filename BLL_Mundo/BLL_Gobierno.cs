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

        public List<ObtenerIdGobiernoResult> ObtenerIdGobierno(string vGobierno)
        {
            return gobiernoDatos.ObtenerIdGobierno(vGobierno);
        }

        public List<ObtenerGobiernosResult> ObtenerGobiernos()
        {
            return gobiernoDatos.ObtenerGobiernos();
        }

        public ObservableCollection<CargarGobiernosResult> CargarGobiernos()
        {
            return gobiernoDatos.CargarGobiernos();
        }

        public void eliminarGobierno(int vId)
        {
            gobiernoDatos.eliminarGobierno(vId);
        }

        public void agregarGobierno(Gobiernos vGobierno)
        {
            gobiernoDatos.crearGobierno(vGobierno);
        }
    }
}
