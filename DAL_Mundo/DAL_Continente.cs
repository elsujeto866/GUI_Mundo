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
        public List<ObtenerIdContinenteResult> ObtenerIdContinente(string vContinente)
        {
            return db.ObtenerIdContinente(vContinente).ToList();
        }
        public List<ObtenerContinentesResult> ObtenerContinentes()
        {
            return db.ObtenerContinentes().ToList();
        }
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

        public void eliminarContinente(int vId)
        {
            db.EliminarContinente(vId);            
        }

        public void crearContinente(Continentes vContinente)
        {
            db.Continentes.InsertOnSubmit(vContinente);
            db.SubmitChanges();
        }
    }
}
