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

        public List<ObtenerIdContinenteResult> ObtenerIdContinente(string vContinente)
        {
            return continenteDatos.ObtenerIdContinente(vContinente);
        }
        

        public List<ObtenerContinentesResult> ObtenerContinentes()
        {
            return continenteDatos.ObtenerContinentes();
        }
        public ObservableCollection<CargarContinentesResult> CargarContinentes()
        {
            return continenteDatos.CargarContinentes();
        }

        public void eliminarContinente(int vId)
        {
            continenteDatos.eliminarContinente(vId);
        }

        public void agregarContinente(Continentes vContinente)
        {
            continenteDatos.crearContinente(vContinente);
        }
    }
}
