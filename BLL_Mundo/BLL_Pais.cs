using DAL_Mundo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_Mundo
{
    public class BLL_Pais
    {
        private DAL_Pais paisDatos = new DAL_Pais();

        public DataTable CargarPaises()
        {
            DataTable dt = new DataTable();
            dt = paisDatos.CargarPaises();
            return dt;
        }

    }
}
