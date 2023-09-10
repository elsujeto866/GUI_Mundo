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

        public List<ObtenerIdPaisResult> ObtenerIdPais(string vPais)
        {
            return db.ObtenerIdPais(vPais).ToList(); 
        }
        // Metodo para agregar los paises al datagrid view
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

        public ObservableCollection<CargarPaisesIdiomasResult> CargarIdiomasPais()
        {
            var idiomasPaises = new ObservableCollection<CargarPaisesIdiomasResult>();
            using (var dbMundo = new DBMundoContextDataContext())
            {
                foreach (CargarPaisesIdiomasResult ip in dbMundo.CargarPaisesIdiomas())
                {
                    idiomasPaises.Add(ip);
                }
            }
            return idiomasPaises;
        }

        public ObservableCollection<CargarPaisesVecinosResult> CargarPaisesVecinos()
        {
            var paisesVecinos = new ObservableCollection<CargarPaisesVecinosResult>();
            using (var dbMundo = new DBMundoContextDataContext())
            {
                foreach (CargarPaisesVecinosResult pv in dbMundo.CargarPaisesVecinos())
                {
                    paisesVecinos.Add(pv);
                }
            }
            return paisesVecinos;
        }


        public void eliminarPais(int vId)
        {
            //Paises eliminaPais = db.Paises.Single(p => p.id == vId); //Se obtiene el ID del pais
            db.EliminarPais(vId); //Se elimina el pais seleccionado
            //db.SubmitChanges(); //Se guarda las modificaciones
        }

        public void eliminarPaisIdioma(int vIdPais, int vIdVecino)
        {
            db.EliminarPaisesIdiomas(vIdPais,vIdVecino); 
            
        }

        public void eliminarPaisVecino(int vIdPais, int vIdVecino)
        {
            db.EliminarPaisesVecinos(vIdPais, vIdVecino);

        }

        public void modificarPais(Paises paisObjeto)
        {
            Paises editaPais = db.Paises.Single(p => p.id == paisObjeto.id);
            editaPais.pais = paisObjeto.pais; 
            editaPais.capital = paisObjeto.capital; 
            editaPais.moneda = paisObjeto.moneda;
            editaPais.continente_id = paisObjeto.continente_id;
            editaPais.gobierno_id = paisObjeto.gobierno_id;
            editaPais.poblacion = paisObjeto.poblacion;
            editaPais.extension = paisObjeto.extension;
            editaPais.posicion = paisObjeto.posicion;
            editaPais.existe = paisObjeto.existe;
            editaPais.costa = paisObjeto.costa;
            editaPais.country = paisObjeto.country; 
            editaPais.code = paisObjeto.code;
            db.SubmitChanges();
        }

        public void creaPais(Paises paisnew)
        {
            Paises paisguardar = paisnew;
            db.Paises.InsertOnSubmit(paisguardar);
            db.SubmitChanges();
        }


        

        public void editaContinente(Continentes objContinente)
        {
            Continentes continentemodif = db.Continentes.Single(c => c.id == objContinente.id);
            continentemodif.continente = objContinente.continente;
            db.SubmitChanges();
        }
        public void creaContinente(Continentes objContinente)
        {
            Continentes continentenew = objContinente;
            db.Continentes.InsertOnSubmit(continentenew);
            db.SubmitChanges();
        }



       
        public void editaIdioma(Idiomas objIdioma)
        {
            Idiomas idiomamodif = db.Idiomas.Single(i => i.id == objIdioma.id);
            idiomamodif.idioma=objIdioma.idioma;
            db.SubmitChanges();
        }

        public void crearIdioma(Idiomas objIdioma)
        {
            Idiomas idiomanew = objIdioma;
            db.Idiomas.InsertOnSubmit(objIdioma); db.SubmitChanges();
        }


      

        public void editaGobiernos(Gobiernos gobiernosobj)
        {
            Gobiernos gobiernoedit = db.Gobiernos.Single(g => g.id == gobiernosobj.id);
            gobiernoedit.gobierno = gobiernoedit.gobierno;
            db.SubmitChanges();
        }

        public void creaGobiernos(Gobiernos gobiernos)
        {
            Gobiernos gobiernonew = gobiernos;
            db.Gobiernos.InsertOnSubmit(gobiernonew);
            db.SubmitChanges();
        }

    }
}
