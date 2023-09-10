using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ML_Mundo;

namespace DAL_Mundo
{
    public class DAL_Continente
    {
        DBMundoContextDataContext db = new DBMundoContextDataContext();
        public ObservableCollection<CargarContinentesResult> CargarContinentes()
        {    
            var continentes = new ObservableCollection<CargarContinentesResult>();
            using (var dbMundo = new DBMundoContextDataContext())
            {
                foreach (CargarContinentesResult p in dbMundo.CargarContinentes())
                { 
                    continentes.Add(p);
                }
            }
            return continentes;
        }

        public void eliminarPais(int vId)
        {
            db.EliminarContinente(vId); 
            
        }
    }
}
