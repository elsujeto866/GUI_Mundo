using ML_Mundo;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Mundo
{
    public class DAL_Idioma
    {
        DBMundoContextDataContext db = new DBMundoContextDataContext();

        public List<ObtenerIdIdiomaResult> ObtenerIdIdioma(string vIdioma)
        {
            return db.ObtenerIdIdioma(vIdioma).ToList();
        }

        public ObservableCollection<CargarIdiomasResult> CargarIdiomas()
        {
            var idiomas = new ObservableCollection<CargarIdiomasResult>();
            using (var dbMundo = new DBMundoContextDataContext())
            {
                foreach (CargarIdiomasResult i in dbMundo.CargarIdiomas())
                {
                    idiomas.Add(i);
                }
            }
            return idiomas;
        }

        public void eliminarIdioma(int vId)
        {
            db.EliminarIdioma(vId);

        }
    }
}
