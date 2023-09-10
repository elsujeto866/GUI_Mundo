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

        public List<ObtenerIdPaisResult> ObtenerIdPais(string vPais)
        {
            return paisDatos.ObtenerIdPais(vPais);
        }

        public ObservableCollection<CargarPaisesResult> CargarPaises()
        {            
            return paisDatos.CargarPaises();
        }

        public ObservableCollection<CargarPaisesIdiomasResult> CargarIdiomasPais()
        {
            return paisDatos.CargarIdiomasPais();
        }

        public ObservableCollection<CargarPaisesVecinosResult> CargarPaisesVecinos()
        {
            return paisDatos.CargarPaisesVecinos();
        }

        public void eliminarPais(int vId)
        {
            paisDatos.eliminarPais(vId);
        }

        public void eliminarPaisIdioma(int vIdPais,int vIdVecino)
        {
            paisDatos.eliminarPaisIdioma(vIdPais,vIdVecino);
        }

        public void eliminarPaisVecino(int vIdPais, int vIdVecino)
        {
            paisDatos.eliminarPaisVecino(vIdPais, vIdVecino);
        }
        public void editaPaises(Paises objPais) {
            paisDatos.modificarPais(objPais);
        }

        public void agregaPais(Paises objPais)
        {
            paisDatos.creaPais(objPais);
        }

      

        public void editaContinente(Continentes objcont)
        {
            paisDatos.editaContinente(objcont);
        }
        public void agregaContinente(Continentes objcont)
        {
            paisDatos.creaContinente(objcont);
        }

        
        public void modificaGobiernos(Gobiernos objGobiernos)
        {
            paisDatos.editaGobiernos(objGobiernos);
        }
        public void agregaGobiernos(Gobiernos objgob)
        {
            paisDatos.creaGobiernos(objgob);
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
