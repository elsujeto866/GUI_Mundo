using System;
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
        DBMundoContextDataContext db = new DBMundoContextDataContext();
        public ObservableCollection<CargarPaisesResult> CargarPaises()
        {
            //Creamos la lista donde guardar los paises
            var paises = new ObservableCollection<CargarPaisesResult>();
            
            //Generamos en una variable la base de datos
            using(var dbMundo = new DBMundoContextDataContext())
            {
                //Obtenemos los objetos del procedimiento almacenado y le cargamos a la tabla
                foreach (CargarPaisesResult p in dbMundo.CargarPaises())
                {
                    
                    paises.Add(p);
                }
            }
            return paises;
        }

        public void eliminarPais(Paises paisObjeto)
        {
            Paises eliminaPais = db.Paises.Single(p => p.id == paisObjeto.id); //Se obtiene el ID del pais
            db.Paises.DeleteOnSubmit(eliminaPais); //Se elimina el pais seleccionado
            db.SubmitChanges(); //Se guarda las modificaciones
        }

        public void modificarPais(Paises paisObjeto)
        {
            Paises editaPais = db.Paises.Single(p => p.id == paisObjeto.id);
            editaPais.posicion = paisObjeto.posicion;
            editaPais.costa = paisObjeto.costa;
            editaPais.capital = paisObjeto.capital; 

        }

        public void eliminaContinente(Continentes objcontinente)
        {
            Continentes continentedeleted = db.Continentes.Single(c => c.id == objcontinente.id);
            db.Continentes.DeleteOnSubmit(continentedeleted);
            db.SubmitChanges();    
        }

        public void eliminaIdioma(Idiomas idiomaobject)
        {
            Idiomas idiomadeleted = db.Idiomas.Single(i => i.id == idiomaobject.id);
            db.Idiomas.DeleteOnSubmit(idiomadeleted);
            db.SubmitChanges();
        }

        public void eliminaGobiernos(Gobiernos objgobiernos)
        {
            Gobiernos gobiernodeleted = db.Gobiernos.Single(g => g.id == objgobiernos.id);
            db.Gobiernos.DeleteOnSubmit(gobiernodeleted); 
            db.SubmitChanges();
        }


    }
}
