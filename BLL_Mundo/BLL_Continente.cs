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
    public class BLL_Continente
    {
        private DAL_Continente continenteDatos = new DAL_Continente();

        public ObservableCollection<CargarContinentesResult> CargarContinentes()
        {
            return continenteDatos.CargarContinentes();
        }
    }
}
