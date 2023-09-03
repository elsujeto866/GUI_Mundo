﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ML_Mundo;

namespace DAL_Mundo
{
    public class DAL_Pais
    {
        public ObservableCollection<MostrarPaisesResult> CargarPaises()
        {
            //Creamos la lista donde guardar los paises
            var paises = new ObservableCollection<MostrarPaisesResult>();
            
            //Generamos en una variable la base de datos
            using(var dbMundo = new DBMundoContextDataContext())
            {
                //Obtenemos los objetos del procedimiento almacenado y le cargamos a la tabla
                foreach (MostrarPaisesResult p in dbMundo.MostrarPaises())
                {
                    
                    paises.Add(p);
                }
            }
            return paises;
        }
    }
}
