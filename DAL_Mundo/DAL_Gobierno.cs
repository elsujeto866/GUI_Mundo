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
    }
}
