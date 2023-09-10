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
    public class BLL_Idioma
    {
        private DAL_Idioma idiomaDatos = new DAL_Idioma();

        public List<ObtenerIdIdiomaResult> ObtenerIdIdioma(string vPais)
        {
            return idiomaDatos.ObtenerIdIdioma(vPais);
        }

        public ObservableCollection<CargarIdiomasResult> CargarIdiomas()
        {
            return idiomaDatos.CargarIdiomas();
        }

        public void eliminarIdioma(int vId)
        {
            idiomaDatos.eliminarIdioma(vId);
        }
    }
}
