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

        public ObservableCollection<IdiomasPaisesResult> CargarIdiomasPais()
        {
            return paisDatos.CargarIdiomasPais();
        }

        public ObservableCollection<FronterasTodosPaisesResult> CargarPaisesVecinos()
        {
            return paisDatos.CargarPaisesVecinos();
        }

        public void eliminarPaises(Paises objPais)
        {
            paisDatos.eliminarPais(objPais);
        }
        public void editaPaises(Paises objPais) {
            paisDatos.modificarPais(objPais);
        }

        public void agregaPais(Paises objPais)
        {
            paisDatos.creaPais(objPais);
        }

        public void eliminarContinente(Continentes objcont)
        {
            paisDatos.eliminaContinente(objcont);
        }

        public void editaContinente(Continentes objcont)
        {
            paisDatos.editaContinente(objcont);
        }
        public void agregaContinente(Continentes objcont)
        {
            paisDatos.creaContinente(objcont);
        }

        public void eliminaGobiernos(Gobiernos objgob)
        {
            paisDatos.eliminaGobiernos(objgob);
        }
        public void modificaGobiernos(Gobiernos objGobiernos)
        {
            paisDatos.editaGobiernos(objGobiernos);
        }
        public void agregaGobiernos(Gobiernos objgob)
        {
            paisDatos.creaGobiernos(objgob);
        }

        public void eliminaIdiomas( Idiomas objdiomas )
        {
            paisDatos.eliminaIdioma(objdiomas);
        }
        public void modificaIdiomas(Idiomas objdiomas)
        {
            paisDatos.editaIdioma(objdiomas);
        }
        public void agregaIdioma(Idiomas objdiomas)
        {
            paisDatos.crearIdioma(objdiomas);
        }

    }
}
