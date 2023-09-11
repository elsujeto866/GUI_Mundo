using ML_Mundo;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Mundo
{
    public class DAL_Gobierno
    {
        DBMundoContextDataContext db = new DBMundoContextDataContext();

        public List<ObtenerIdGobiernoResult> ObtenerIdGobierno(string vGobierno)
        {
            return db.ObtenerIdGobierno(vGobierno).ToList();
        }

        public List<ObtenerGobiernosResult> ObtenerGobiernos()
        {
            return db.ObtenerGobiernos().ToList();
        }
        public ObservableCollection<CargarGobiernosResult> CargarGobiernos()
        {
            var gobiernos = new ObservableCollection<CargarGobiernosResult>();
            using (var dbMundo = new DBMundoContextDataContext())
            {
                foreach (CargarGobiernosResult i in dbMundo.CargarGobiernos())
                {
                    gobiernos.Add(i);
                }
            }
            return gobiernos;
        }

        public void eliminarGobierno(int vId)
        {
            db.EliminarGobierno(vId);

        }

        public void crearGobierno(Gobiernos vGobierno)
        {
            db.Gobiernos.InsertOnSubmit(vGobierno);
            db.SubmitChanges();

        }

    }
}
