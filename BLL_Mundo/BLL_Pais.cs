using DAL_Mundo;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ML_Mundo;

namespace BLL_Mundo
{
    public class BLL_Pais
    {
        private DAL_Pais paisDatos = new DAL_Pais();

        public ObservableCollection<CargarPaisesResult> CargarPaises()
        {            
            return paisDatos.CargarPaises();
        }

        public void eliminarPaises(Paises objPais)
        {
            paisDatos.eliminarPais(objPais);
        }

        public void eliminarContinente(Continentes objcont)
        {
            paisDatos.eliminaContinente(objcont);
        }

        public void eliminaGobiernos(Gobiernos objgob)
        {
            paisDatos.eliminaGobiernos(objgob);
        }

        public void eliminaIdiomas( Idiomas objdiomas )
        {
            paisDatos.eliminaIdioma(objdiomas);
        }


    }
}
