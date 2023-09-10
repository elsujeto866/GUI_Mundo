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
        public ObservableCollection<PaisesXContinenteResult> CargarContinentes()
        {    
            var continentes = new ObservableCollection<PaisesXContinenteResult>();
            using (var dbMundo = new DBMundoContextDataContext())
            {
                foreach (PaisesXContinenteResult p in dbMundo.PaisesXContinente())
                { 
                    continentes.Add(p);
                }
            }
            return continentes;
        }
    }
}
