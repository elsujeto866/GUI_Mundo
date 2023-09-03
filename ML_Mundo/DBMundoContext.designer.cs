﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ML_Mundo
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="BD_Mundo")]
	public partial class DBMundoContextDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Definiciones de métodos de extensibilidad
    partial void OnCreated();
    partial void InsertContinentes(Continentes instance);
    partial void UpdateContinentes(Continentes instance);
    partial void DeleteContinentes(Continentes instance);
    partial void InsertGobiernos(Gobiernos instance);
    partial void UpdateGobiernos(Gobiernos instance);
    partial void DeleteGobiernos(Gobiernos instance);
    partial void InsertIdiomas(Idiomas instance);
    partial void UpdateIdiomas(Idiomas instance);
    partial void DeleteIdiomas(Idiomas instance);
    partial void InsertPaises(Paises instance);
    partial void UpdatePaises(Paises instance);
    partial void DeletePaises(Paises instance);
    partial void InsertPaises_Idiomas(Paises_Idiomas instance);
    partial void UpdatePaises_Idiomas(Paises_Idiomas instance);
    partial void DeletePaises_Idiomas(Paises_Idiomas instance);
    partial void InsertPaises_Vecinos(Paises_Vecinos instance);
    partial void UpdatePaises_Vecinos(Paises_Vecinos instance);
    partial void DeletePaises_Vecinos(Paises_Vecinos instance);
    #endregion
		
		public DBMundoContextDataContext() : 
				base(global::ML_Mundo.Properties.Settings.Default.BD_MundoConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public DBMundoContextDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBMundoContextDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBMundoContextDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public DBMundoContextDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<Continentes> Continentes
		{
			get
			{
				return this.GetTable<Continentes>();
			}
		}
		
		public System.Data.Linq.Table<Gobiernos> Gobiernos
		{
			get
			{
				return this.GetTable<Gobiernos>();
			}
		}
		
		public System.Data.Linq.Table<Idiomas> Idiomas
		{
			get
			{
				return this.GetTable<Idiomas>();
			}
		}
		
		public System.Data.Linq.Table<Paises> Paises
		{
			get
			{
				return this.GetTable<Paises>();
			}
		}
		
		public System.Data.Linq.Table<Paises_Idiomas> Paises_Idiomas
		{
			get
			{
				return this.GetTable<Paises_Idiomas>();
			}
		}
		
		public System.Data.Linq.Table<Paises_Vecinos> Paises_Vecinos
		{
			get
			{
				return this.GetTable<Paises_Vecinos>();
			}
		}
		
		[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.MostrarPaises")]
		public ISingleResult<MostrarPaisesResult> MostrarPaises()
		{
			IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())));
			return ((ISingleResult<MostrarPaisesResult>)(result.ReturnValue));
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Continentes")]
	public partial class Continentes : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _continente;
		
		private EntitySet<Paises> _Paises;
		
    #region Definiciones de métodos de extensibilidad
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OncontinenteChanging(string value);
    partial void OncontinenteChanged();
    #endregion
		
		public Continentes()
		{
			this._Paises = new EntitySet<Paises>(new Action<Paises>(this.attach_Paises), new Action<Paises>(this.detach_Paises));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_continente", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string continente
		{
			get
			{
				return this._continente;
			}
			set
			{
				if ((this._continente != value))
				{
					this.OncontinenteChanging(value);
					this.SendPropertyChanging();
					this._continente = value;
					this.SendPropertyChanged("continente");
					this.OncontinenteChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Continentes_Paises", Storage="_Paises", ThisKey="id", OtherKey="continente_id")]
		public EntitySet<Paises> Paises
		{
			get
			{
				return this._Paises;
			}
			set
			{
				this._Paises.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Paises(Paises entity)
		{
			this.SendPropertyChanging();
			entity.Continentes = this;
		}
		
		private void detach_Paises(Paises entity)
		{
			this.SendPropertyChanging();
			entity.Continentes = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Gobiernos")]
	public partial class Gobiernos : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _gobierno;
		
		private EntitySet<Paises> _Paises;
		
    #region Definiciones de métodos de extensibilidad
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OngobiernoChanging(string value);
    partial void OngobiernoChanged();
    #endregion
		
		public Gobiernos()
		{
			this._Paises = new EntitySet<Paises>(new Action<Paises>(this.attach_Paises), new Action<Paises>(this.detach_Paises));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_gobierno", DbType="VarChar(40) NOT NULL", CanBeNull=false)]
		public string gobierno
		{
			get
			{
				return this._gobierno;
			}
			set
			{
				if ((this._gobierno != value))
				{
					this.OngobiernoChanging(value);
					this.SendPropertyChanging();
					this._gobierno = value;
					this.SendPropertyChanged("gobierno");
					this.OngobiernoChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Gobiernos_Paises", Storage="_Paises", ThisKey="id", OtherKey="gobierno_id")]
		public EntitySet<Paises> Paises
		{
			get
			{
				return this._Paises;
			}
			set
			{
				this._Paises.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Paises(Paises entity)
		{
			this.SendPropertyChanging();
			entity.Gobiernos = this;
		}
		
		private void detach_Paises(Paises entity)
		{
			this.SendPropertyChanging();
			entity.Gobiernos = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Idiomas")]
	public partial class Idiomas : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _idioma;
		
		private EntitySet<Paises_Idiomas> _Paises_Idiomas;
		
    #region Definiciones de métodos de extensibilidad
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnidiomaChanging(string value);
    partial void OnidiomaChanged();
    #endregion
		
		public Idiomas()
		{
			this._Paises_Idiomas = new EntitySet<Paises_Idiomas>(new Action<Paises_Idiomas>(this.attach_Paises_Idiomas), new Action<Paises_Idiomas>(this.detach_Paises_Idiomas));
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_idioma", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string idioma
		{
			get
			{
				return this._idioma;
			}
			set
			{
				if ((this._idioma != value))
				{
					this.OnidiomaChanging(value);
					this.SendPropertyChanging();
					this._idioma = value;
					this.SendPropertyChanged("idioma");
					this.OnidiomaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Idiomas_Paises_Idiomas", Storage="_Paises_Idiomas", ThisKey="id", OtherKey="idioma_id")]
		public EntitySet<Paises_Idiomas> Paises_Idiomas
		{
			get
			{
				return this._Paises_Idiomas;
			}
			set
			{
				this._Paises_Idiomas.Assign(value);
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Paises_Idiomas(Paises_Idiomas entity)
		{
			this.SendPropertyChanging();
			entity.Idiomas = this;
		}
		
		private void detach_Paises_Idiomas(Paises_Idiomas entity)
		{
			this.SendPropertyChanging();
			entity.Idiomas = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Paises")]
	public partial class Paises : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _id;
		
		private string _pais;
		
		private string _capital;
		
		private string _moneda;
		
		private System.Nullable<int> _continente_id;
		
		private System.Nullable<int> _gobierno_id;
		
		private System.Nullable<int> _poblacion;
		
		private System.Nullable<decimal> _extension;
		
		private string _posicion;
		
		private bool _existe;
		
		private System.Nullable<int> _costa;
		
		private string _country;
		
		private string _code;
		
		private EntitySet<Paises_Idiomas> _Paises_Idiomas;
		
		private EntitySet<Paises_Vecinos> _Paises_Vecinos;
		
		private EntitySet<Paises_Vecinos> _Paises_Vecinos1;
		
		private EntityRef<Continentes> _Continentes;
		
		private EntityRef<Gobiernos> _Gobiernos;
		
    #region Definiciones de métodos de extensibilidad
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnidChanging(int value);
    partial void OnidChanged();
    partial void OnpaisChanging(string value);
    partial void OnpaisChanged();
    partial void OncapitalChanging(string value);
    partial void OncapitalChanged();
    partial void OnmonedaChanging(string value);
    partial void OnmonedaChanged();
    partial void Oncontinente_idChanging(System.Nullable<int> value);
    partial void Oncontinente_idChanged();
    partial void Ongobierno_idChanging(System.Nullable<int> value);
    partial void Ongobierno_idChanged();
    partial void OnpoblacionChanging(System.Nullable<int> value);
    partial void OnpoblacionChanged();
    partial void OnextensionChanging(System.Nullable<decimal> value);
    partial void OnextensionChanged();
    partial void OnposicionChanging(string value);
    partial void OnposicionChanged();
    partial void OnexisteChanging(bool value);
    partial void OnexisteChanged();
    partial void OncostaChanging(System.Nullable<int> value);
    partial void OncostaChanged();
    partial void OncountryChanging(string value);
    partial void OncountryChanged();
    partial void OncodeChanging(string value);
    partial void OncodeChanged();
    #endregion
		
		public Paises()
		{
			this._Paises_Idiomas = new EntitySet<Paises_Idiomas>(new Action<Paises_Idiomas>(this.attach_Paises_Idiomas), new Action<Paises_Idiomas>(this.detach_Paises_Idiomas));
			this._Paises_Vecinos = new EntitySet<Paises_Vecinos>(new Action<Paises_Vecinos>(this.attach_Paises_Vecinos), new Action<Paises_Vecinos>(this.detach_Paises_Vecinos));
			this._Paises_Vecinos1 = new EntitySet<Paises_Vecinos>(new Action<Paises_Vecinos>(this.attach_Paises_Vecinos1), new Action<Paises_Vecinos>(this.detach_Paises_Vecinos1));
			this._Continentes = default(EntityRef<Continentes>);
			this._Gobiernos = default(EntityRef<Gobiernos>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this.OnidChanging(value);
					this.SendPropertyChanging();
					this._id = value;
					this.SendPropertyChanged("id");
					this.OnidChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pais", DbType="VarChar(35) NOT NULL", CanBeNull=false)]
		public string pais
		{
			get
			{
				return this._pais;
			}
			set
			{
				if ((this._pais != value))
				{
					this.OnpaisChanging(value);
					this.SendPropertyChanging();
					this._pais = value;
					this.SendPropertyChanged("pais");
					this.OnpaisChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_capital", DbType="VarChar(20)")]
		public string capital
		{
			get
			{
				return this._capital;
			}
			set
			{
				if ((this._capital != value))
				{
					this.OncapitalChanging(value);
					this.SendPropertyChanging();
					this._capital = value;
					this.SendPropertyChanged("capital");
					this.OncapitalChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_moneda", DbType="VarChar(30)")]
		public string moneda
		{
			get
			{
				return this._moneda;
			}
			set
			{
				if ((this._moneda != value))
				{
					this.OnmonedaChanging(value);
					this.SendPropertyChanging();
					this._moneda = value;
					this.SendPropertyChanged("moneda");
					this.OnmonedaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_continente_id", DbType="Int")]
		public System.Nullable<int> continente_id
		{
			get
			{
				return this._continente_id;
			}
			set
			{
				if ((this._continente_id != value))
				{
					if (this._Continentes.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Oncontinente_idChanging(value);
					this.SendPropertyChanging();
					this._continente_id = value;
					this.SendPropertyChanged("continente_id");
					this.Oncontinente_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_gobierno_id", DbType="Int")]
		public System.Nullable<int> gobierno_id
		{
			get
			{
				return this._gobierno_id;
			}
			set
			{
				if ((this._gobierno_id != value))
				{
					if (this._Gobiernos.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Ongobierno_idChanging(value);
					this.SendPropertyChanging();
					this._gobierno_id = value;
					this.SendPropertyChanged("gobierno_id");
					this.Ongobierno_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_poblacion", DbType="Int")]
		public System.Nullable<int> poblacion
		{
			get
			{
				return this._poblacion;
			}
			set
			{
				if ((this._poblacion != value))
				{
					this.OnpoblacionChanging(value);
					this.SendPropertyChanging();
					this._poblacion = value;
					this.SendPropertyChanged("poblacion");
					this.OnpoblacionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_extension", DbType="Decimal(15,5)")]
		public System.Nullable<decimal> extension
		{
			get
			{
				return this._extension;
			}
			set
			{
				if ((this._extension != value))
				{
					this.OnextensionChanging(value);
					this.SendPropertyChanging();
					this._extension = value;
					this.SendPropertyChanged("extension");
					this.OnextensionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_posicion", DbType="VarChar(50)")]
		public string posicion
		{
			get
			{
				return this._posicion;
			}
			set
			{
				if ((this._posicion != value))
				{
					this.OnposicionChanging(value);
					this.SendPropertyChanging();
					this._posicion = value;
					this.SendPropertyChanged("posicion");
					this.OnposicionChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_existe", DbType="Bit NOT NULL")]
		public bool existe
		{
			get
			{
				return this._existe;
			}
			set
			{
				if ((this._existe != value))
				{
					this.OnexisteChanging(value);
					this.SendPropertyChanging();
					this._existe = value;
					this.SendPropertyChanged("existe");
					this.OnexisteChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_costa", DbType="Int")]
		public System.Nullable<int> costa
		{
			get
			{
				return this._costa;
			}
			set
			{
				if ((this._costa != value))
				{
					this.OncostaChanging(value);
					this.SendPropertyChanging();
					this._costa = value;
					this.SendPropertyChanged("costa");
					this.OncostaChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_country", DbType="VarChar(35)")]
		public string country
		{
			get
			{
				return this._country;
			}
			set
			{
				if ((this._country != value))
				{
					this.OncountryChanging(value);
					this.SendPropertyChanging();
					this._country = value;
					this.SendPropertyChanged("country");
					this.OncountryChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_code", DbType="VarChar(2)")]
		public string code
		{
			get
			{
				return this._code;
			}
			set
			{
				if ((this._code != value))
				{
					this.OncodeChanging(value);
					this.SendPropertyChanging();
					this._code = value;
					this.SendPropertyChanged("code");
					this.OncodeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Paises_Paises_Idiomas", Storage="_Paises_Idiomas", ThisKey="id", OtherKey="pais_id")]
		public EntitySet<Paises_Idiomas> Paises_Idiomas
		{
			get
			{
				return this._Paises_Idiomas;
			}
			set
			{
				this._Paises_Idiomas.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Paises_Paises_Vecinos", Storage="_Paises_Vecinos", ThisKey="id", OtherKey="pais_id")]
		public EntitySet<Paises_Vecinos> Paises_Vecinos
		{
			get
			{
				return this._Paises_Vecinos;
			}
			set
			{
				this._Paises_Vecinos.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Paises_Paises_Vecinos1", Storage="_Paises_Vecinos1", ThisKey="id", OtherKey="vecino_id")]
		public EntitySet<Paises_Vecinos> Paises_Vecinos1
		{
			get
			{
				return this._Paises_Vecinos1;
			}
			set
			{
				this._Paises_Vecinos1.Assign(value);
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Continentes_Paises", Storage="_Continentes", ThisKey="continente_id", OtherKey="id", IsForeignKey=true)]
		public Continentes Continentes
		{
			get
			{
				return this._Continentes.Entity;
			}
			set
			{
				Continentes previousValue = this._Continentes.Entity;
				if (((previousValue != value) 
							|| (this._Continentes.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Continentes.Entity = null;
						previousValue.Paises.Remove(this);
					}
					this._Continentes.Entity = value;
					if ((value != null))
					{
						value.Paises.Add(this);
						this._continente_id = value.id;
					}
					else
					{
						this._continente_id = default(Nullable<int>);
					}
					this.SendPropertyChanged("Continentes");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Gobiernos_Paises", Storage="_Gobiernos", ThisKey="gobierno_id", OtherKey="id", IsForeignKey=true)]
		public Gobiernos Gobiernos
		{
			get
			{
				return this._Gobiernos.Entity;
			}
			set
			{
				Gobiernos previousValue = this._Gobiernos.Entity;
				if (((previousValue != value) 
							|| (this._Gobiernos.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Gobiernos.Entity = null;
						previousValue.Paises.Remove(this);
					}
					this._Gobiernos.Entity = value;
					if ((value != null))
					{
						value.Paises.Add(this);
						this._gobierno_id = value.id;
					}
					else
					{
						this._gobierno_id = default(Nullable<int>);
					}
					this.SendPropertyChanged("Gobiernos");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
		
		private void attach_Paises_Idiomas(Paises_Idiomas entity)
		{
			this.SendPropertyChanging();
			entity.Paises = this;
		}
		
		private void detach_Paises_Idiomas(Paises_Idiomas entity)
		{
			this.SendPropertyChanging();
			entity.Paises = null;
		}
		
		private void attach_Paises_Vecinos(Paises_Vecinos entity)
		{
			this.SendPropertyChanging();
			entity.Paises = this;
		}
		
		private void detach_Paises_Vecinos(Paises_Vecinos entity)
		{
			this.SendPropertyChanging();
			entity.Paises = null;
		}
		
		private void attach_Paises_Vecinos1(Paises_Vecinos entity)
		{
			this.SendPropertyChanging();
			entity.Paises1 = this;
		}
		
		private void detach_Paises_Vecinos1(Paises_Vecinos entity)
		{
			this.SendPropertyChanging();
			entity.Paises1 = null;
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Paises_Idiomas")]
	public partial class Paises_Idiomas : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _pais_id;
		
		private int _idioma_id;
		
		private System.Nullable<int> _hablantes;
		
		private System.Nullable<decimal> _porcentaje;
		
		private EntityRef<Idiomas> _Idiomas;
		
		private EntityRef<Paises> _Paises;
		
    #region Definiciones de métodos de extensibilidad
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void Onpais_idChanging(int value);
    partial void Onpais_idChanged();
    partial void Onidioma_idChanging(int value);
    partial void Onidioma_idChanged();
    partial void OnhablantesChanging(System.Nullable<int> value);
    partial void OnhablantesChanged();
    partial void OnporcentajeChanging(System.Nullable<decimal> value);
    partial void OnporcentajeChanged();
    #endregion
		
		public Paises_Idiomas()
		{
			this._Idiomas = default(EntityRef<Idiomas>);
			this._Paises = default(EntityRef<Paises>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pais_id", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int pais_id
		{
			get
			{
				return this._pais_id;
			}
			set
			{
				if ((this._pais_id != value))
				{
					if (this._Paises.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Onpais_idChanging(value);
					this.SendPropertyChanging();
					this._pais_id = value;
					this.SendPropertyChanged("pais_id");
					this.Onpais_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_idioma_id", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int idioma_id
		{
			get
			{
				return this._idioma_id;
			}
			set
			{
				if ((this._idioma_id != value))
				{
					if (this._Idiomas.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Onidioma_idChanging(value);
					this.SendPropertyChanging();
					this._idioma_id = value;
					this.SendPropertyChanged("idioma_id");
					this.Onidioma_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_hablantes", DbType="Int")]
		public System.Nullable<int> hablantes
		{
			get
			{
				return this._hablantes;
			}
			set
			{
				if ((this._hablantes != value))
				{
					this.OnhablantesChanging(value);
					this.SendPropertyChanging();
					this._hablantes = value;
					this.SendPropertyChanged("hablantes");
					this.OnhablantesChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_porcentaje", DbType="Decimal(15,5)")]
		public System.Nullable<decimal> porcentaje
		{
			get
			{
				return this._porcentaje;
			}
			set
			{
				if ((this._porcentaje != value))
				{
					this.OnporcentajeChanging(value);
					this.SendPropertyChanging();
					this._porcentaje = value;
					this.SendPropertyChanged("porcentaje");
					this.OnporcentajeChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Idiomas_Paises_Idiomas", Storage="_Idiomas", ThisKey="idioma_id", OtherKey="id", IsForeignKey=true)]
		public Idiomas Idiomas
		{
			get
			{
				return this._Idiomas.Entity;
			}
			set
			{
				Idiomas previousValue = this._Idiomas.Entity;
				if (((previousValue != value) 
							|| (this._Idiomas.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Idiomas.Entity = null;
						previousValue.Paises_Idiomas.Remove(this);
					}
					this._Idiomas.Entity = value;
					if ((value != null))
					{
						value.Paises_Idiomas.Add(this);
						this._idioma_id = value.id;
					}
					else
					{
						this._idioma_id = default(int);
					}
					this.SendPropertyChanged("Idiomas");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Paises_Paises_Idiomas", Storage="_Paises", ThisKey="pais_id", OtherKey="id", IsForeignKey=true)]
		public Paises Paises
		{
			get
			{
				return this._Paises.Entity;
			}
			set
			{
				Paises previousValue = this._Paises.Entity;
				if (((previousValue != value) 
							|| (this._Paises.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Paises.Entity = null;
						previousValue.Paises_Idiomas.Remove(this);
					}
					this._Paises.Entity = value;
					if ((value != null))
					{
						value.Paises_Idiomas.Add(this);
						this._pais_id = value.id;
					}
					else
					{
						this._pais_id = default(int);
					}
					this.SendPropertyChanged("Paises");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Paises_Vecinos")]
	public partial class Paises_Vecinos : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _pais_id;
		
		private int _vecino_id;
		
		private System.Nullable<int> _kms_frontera;
		
		private EntityRef<Paises> _Paises;
		
		private EntityRef<Paises> _Paises1;
		
    #region Definiciones de métodos de extensibilidad
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void Onpais_idChanging(int value);
    partial void Onpais_idChanged();
    partial void Onvecino_idChanging(int value);
    partial void Onvecino_idChanged();
    partial void Onkms_fronteraChanging(System.Nullable<int> value);
    partial void Onkms_fronteraChanged();
    #endregion
		
		public Paises_Vecinos()
		{
			this._Paises = default(EntityRef<Paises>);
			this._Paises1 = default(EntityRef<Paises>);
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pais_id", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int pais_id
		{
			get
			{
				return this._pais_id;
			}
			set
			{
				if ((this._pais_id != value))
				{
					if (this._Paises.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Onpais_idChanging(value);
					this.SendPropertyChanging();
					this._pais_id = value;
					this.SendPropertyChanged("pais_id");
					this.Onpais_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_vecino_id", DbType="Int NOT NULL", IsPrimaryKey=true)]
		public int vecino_id
		{
			get
			{
				return this._vecino_id;
			}
			set
			{
				if ((this._vecino_id != value))
				{
					if (this._Paises1.HasLoadedOrAssignedValue)
					{
						throw new System.Data.Linq.ForeignKeyReferenceAlreadyHasValueException();
					}
					this.Onvecino_idChanging(value);
					this.SendPropertyChanging();
					this._vecino_id = value;
					this.SendPropertyChanged("vecino_id");
					this.Onvecino_idChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_kms_frontera", DbType="Int")]
		public System.Nullable<int> kms_frontera
		{
			get
			{
				return this._kms_frontera;
			}
			set
			{
				if ((this._kms_frontera != value))
				{
					this.Onkms_fronteraChanging(value);
					this.SendPropertyChanging();
					this._kms_frontera = value;
					this.SendPropertyChanged("kms_frontera");
					this.Onkms_fronteraChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Paises_Paises_Vecinos", Storage="_Paises", ThisKey="pais_id", OtherKey="id", IsForeignKey=true)]
		public Paises Paises
		{
			get
			{
				return this._Paises.Entity;
			}
			set
			{
				Paises previousValue = this._Paises.Entity;
				if (((previousValue != value) 
							|| (this._Paises.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Paises.Entity = null;
						previousValue.Paises_Vecinos.Remove(this);
					}
					this._Paises.Entity = value;
					if ((value != null))
					{
						value.Paises_Vecinos.Add(this);
						this._pais_id = value.id;
					}
					else
					{
						this._pais_id = default(int);
					}
					this.SendPropertyChanged("Paises");
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.AssociationAttribute(Name="Paises_Paises_Vecinos1", Storage="_Paises1", ThisKey="vecino_id", OtherKey="id", IsForeignKey=true)]
		public Paises Paises1
		{
			get
			{
				return this._Paises1.Entity;
			}
			set
			{
				Paises previousValue = this._Paises1.Entity;
				if (((previousValue != value) 
							|| (this._Paises1.HasLoadedOrAssignedValue == false)))
				{
					this.SendPropertyChanging();
					if ((previousValue != null))
					{
						this._Paises1.Entity = null;
						previousValue.Paises_Vecinos1.Remove(this);
					}
					this._Paises1.Entity = value;
					if ((value != null))
					{
						value.Paises_Vecinos1.Add(this);
						this._vecino_id = value.id;
					}
					else
					{
						this._vecino_id = default(int);
					}
					this.SendPropertyChanged("Paises1");
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
	
	public partial class MostrarPaisesResult
	{
		
		private int _id;
		
		private string _pais;
		
		private string _capital;
		
		private string _moneda;
		
		private string _continente;
		
		private string _gobierno;
		
		public MostrarPaisesResult()
		{
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_id", DbType="Int NOT NULL")]
		public int id
		{
			get
			{
				return this._id;
			}
			set
			{
				if ((this._id != value))
				{
					this._id = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_pais", DbType="VarChar(35) NOT NULL", CanBeNull=false)]
		public string pais
		{
			get
			{
				return this._pais;
			}
			set
			{
				if ((this._pais != value))
				{
					this._pais = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_capital", DbType="VarChar(20)")]
		public string capital
		{
			get
			{
				return this._capital;
			}
			set
			{
				if ((this._capital != value))
				{
					this._capital = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_moneda", DbType="VarChar(30)")]
		public string moneda
		{
			get
			{
				return this._moneda;
			}
			set
			{
				if ((this._moneda != value))
				{
					this._moneda = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_continente", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
		public string continente
		{
			get
			{
				return this._continente;
			}
			set
			{
				if ((this._continente != value))
				{
					this._continente = value;
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_gobierno", DbType="VarChar(40) NOT NULL", CanBeNull=false)]
		public string gobierno
		{
			get
			{
				return this._gobierno;
			}
			set
			{
				if ((this._gobierno != value))
				{
					this._gobierno = value;
				}
			}
		}
	}
}
#pragma warning restore 1591