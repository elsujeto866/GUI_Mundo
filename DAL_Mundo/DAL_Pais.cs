using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_Mundo
{
    public class DAL_Pais
    {
        public DataTable CargarPaises()
        {
            //Creamos la tabla donde guardar los paises
            DataTable tablaPaises = new DataTable();
            //Agregamos las columnas a la tabla
            tablaPaises.Columns.Add("País", typeof(string));
            tablaPaises.Columns.Add("Continente", typeof(string));
            //Generamos en una variable la base de datos
            using(var dbMundo = new DBMundoDataContext())
            {
                //Obtenemos los objetos del procedimiento almacenado y le cargamos a la tabla
                foreach (PaisContinenteResult p in dbMundo.PaisContinente())
                {
                    tablaPaises.Rows.Add(p.pais,p.continente);
                }
                
            }
            return tablaPaises;
        }
    }
}
