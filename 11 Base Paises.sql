/*Unique key (UK) acepta valor nulo la primera vez, mientras que el Primary key (PK) no puede ser nulo.
Se pueden tener varios UK, pero una sola PK. Aunque la PK pueda estar conformada por varios atributos, siempre será una sola PK.
Si bien es cierto que se pueden hacer Foreign Keys referenciando a cualquier atributo, sin importar si son PK, UK o cualquier otro, la mejor práctica es hacerlo referenciando a un PK, por concepto de normalización, donde una PK es usada para identificar a cada tupla, mientras que la UK es 
usada para impedir el duplicado de valores para un atributo.*/

USE master
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'BD_Mundo') 
BEGIN
  DROP DATABASE BD_Mundo;
END
GO
	 
CREATE DATABASE BD_Mundo;
GO

USE BD_Mundo;
GO

CREATE TABLE Continentes (
  id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  continente VARCHAR(20) NOT NULL
) ;
GO
--SELECT * FROM Gobiernos

CREATE TABLE Gobiernos (
  id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  gobierno VARCHAR(40) NOT NULL
);
GO

CREATE TABLE Idiomas (
  id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  idioma VARCHAR(20) NOT NULL,
);
GO

CREATE TABLE Paises (
  id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  pais VARCHAR(35) NOT NULL,
  capital VARCHAR(20),
  moneda VARCHAR(30),
  continente_id INT,
  gobierno_id INT,
  poblacion INT,
  extension DECIMAL(15,5),
  posicion VARCHAR(50),
  existe bit NOT NULL DEFAULT 1,
  costa INT DEFAULT 0,
  country VARCHAR(35),
  code VARCHAR(2),
  FOREIGN KEY (continente_id) REFERENCES Continentes(id),
  FOREIGN KEY (gobierno_id) REFERENCES Gobiernos(id)
) ;
GO
--SELECT * FROM Paises

CREATE TABLE Paises_Idiomas (
  pais_id INT NOT NULL,
  idioma_id INT NOT NULL,
  hablantes INT,
  porcentaje DECIMAL(15,5),
  --
  PRIMARY KEY (pais_id, idioma_id),
  FOREIGN KEY (pais_id) REFERENCES Paises(id),
  FOREIGN KEY (idioma_id) REFERENCES Idiomas(id)
) ;
GO
--SELECT * FROM Paises
SELECT * FROM Idiomas
CREATE TABLE Paises_Vecinos (
  pais_id INT NOT NULL,
  vecino_id INT NOT NULL,
  kms_frontera INT DEFAULT 0,
  --
  PRIMARY KEY (pais_id, vecino_id),
  FOREIGN KEY (pais_id) REFERENCES paises(id),
  FOREIGN KEY (vecino_id) REFERENCES paises(id)
) ;
GO
--Insercion de datos
INSERT INTO Continentes (continente)
VALUES
    ('Asia'),
    ('África'),
    ('América'),
    ('Europa'),
    ('Oceanía');
GO
--SELECT * FROM Continentes
INSERT INTO Gobiernos (gobierno)
VALUES
	('Democracia'),
	('Comunismo'),
    ('Dictadura'),
    ('Oligarquía'),
    ('Teocracia'),
    ('Anarquía'),
	('Autocracia'),
    ('Federalismo'),
    ('Confederación'),
    ('Socialdemocracia'),
    ('Parlamentarismo');
GO

INSERT INTO Idiomas (idioma)
VALUES
    ('Español'),
    ('Inglés'),
    ('Francés'),
    ('Alemán'),
    ('Italiano'),
    ('Portugués'),
    ('Chino (Mandarín)'),
    ('Japonés'),
    ('Ruso'),
    ('Árabe'),
	('Coreano'),
    ('Holandés'),
    ('Sueco'),
    ('Danés'),
    ('Noruego'),
    ('Finlandés'),
    ('Polaco'),
    ('Húngaro'),
    ('Turco'),
    ('Griego');
GO

INSERT INTO paises (pais, capital, moneda, continente_id, gobierno_id, poblacion, extension, posicion, costa, country, code)
VALUES
	('Ecuador', 'Quito', 'Dólar estadounidense', 3, 1, 17643054, 2.850000, 'América del Sur', 2, 'Ecuador', 'EC'),
    ('China', 'Pekín', 'Renminbi', 1, 2, 1444216107, 9.596961, 'Este de Asia', 1, 'China', 'CN'),
    ('Estados Unidos', 'Washington D.C.', 'Dólar estadounidense', 3, 1, 331002651, 9.525067, 'América del Norte', 1, 'Estados Unidos', 'US'),
    ('Rusia', 'Moscú', 'Rublo ruso', 1, 3, 145912025, 17.125191, 'Europa del Este y Asia del Norte', 1, 'Rusia', 'RU'),
    ('Brasil', 'Brasilia', 'Real brasileño', 3, 1, 212559417, 8.515767, 'América del Sur', 1, 'Brasil', 'BR'),
    ('India', 'Nueva Delhi', 'Rupia india', 1, 2, 1380004385, 3.287263, 'Asia del Sur', 1, 'India', 'IN'),
	('México', 'Ciudad de México', 'Peso mexicano', 3, 1, 126190788, 1.964375, 'América del Norte', 1, 'México', 'MX'),
    ('Francia', 'París', 'Euro', 4, 1, 65273511, 551.695, 'Europa Occidental', 1, 'Francia', 'FR'),
    ('Egipto', 'El Cairo', 'Libra egipcia', 2, 3, 102334404, 1.001450, 'Noreste de África', 1, 'Egipto', 'EG'),
    ('Australia', 'Canberra', 'Dólar australiano', 5, 1, 25499884, 7.692024, 'Oceanía', 1, 'Australia', 'AU'),
    ('Japón', 'Tokio', 'Yen japonés', 1, 4, 126476461, 0.377975, 'Asia del Este', 1, 'Japón', 'JP'),
	('Canadá', 'Ottawa', 'Dólar canadiense', 3, 1, 37742154, 9.984670, 'América del Norte', 3, 'Canada', 'CA'),
    ('Alemania', 'Berlín', 'Euro', 4, 1, 83783942, 3.573100, 'Europa Central', 1, 'Germany', 'DE'),
    ('Sudáfrica', 'Pretoria', 'Rand sudafricano', 2, 4, 59308690, 1.221037, 'África del Sur', 1, 'South Africa', 'ZA'),
    ('Nueva Zelanda', 'Wellington', 'Dólar neozelandés', 5, 1, 4822233, 2.934712, 'Oceanía', 3, 'New Zealand', 'NZ'),
    ('Italia', 'Roma', 'Euro', 4, 1, 60461826, 3.796742, 'Europa del Sur', 4, 'Italy', 'IT'),
	('Argentina', 'Buenos Aires', 'Peso argentino', 3, 1, 45195777, 2.780400, 'América del Sur', 3, 'Argentina', 'AR'),
    ('Reino Unido', 'Londres', 'Libra esterlina', 4, 1, 67886011, 0.242495, 'Europa Occidental', 4, 'United Kingdom', 'GB'),
    ('Nigeria', 'Abuja', 'Naira nigeriano', 2, 1, 206139587, 0.923768, 'África Occidental', 0, 'Nigeria', 'NG'),
    ('Indonesia', 'Yakarta', 'Rupia indonesia', 1, 1, 273523615, 1.904569, 'Asia Oriental', 1, 'Indonesia', 'ID'),
    ('España', 'Madrid', 'Euro', 4, 1, 46754778, 505992.91, 'Europa del Sur', 1,'Spain', 'ES'),
	('Suecia', 'Estocolmo', 'Corona sueca', 4, 9, 10379295, 0.450295, 'Europa del Norte', 1, 'Sweden', 'SE'),
    ('Nueva Guinea', 'Puerto Moresby', 'Kina', 5, 10, 8947024, 0.462840, 'Oceanía', 1, 'Papua New Guinea', 'PG'),
    ('Argelia', 'Argel', 'Dinar argelino', 2, 3, 43851044, 2.381741, 'África del Norte', 1, 'Algeria', 'DZ'),
    ('Jamaica', 'Kingston', 'Dólar jamaicano', 3, 1, 2961161, 0.109911, 'Caribe', 1, 'Jamaica', 'JM'),
	('Colombia', 'Bogotá', 'Peso colombiano', 3, 1, 50882891, 1.141748, 'América del Sur', 2, 'Colombia', 'CO'),
    ('Perú', 'Lima', 'Nuevo sol', 3, 1, 32971854, 1.285216, 'América del Sur', 3, 'Peru', 'PE'),
    ('Venezuela', 'Caracas', 'Bolívar soberano', 3, 2, 28435943, 0.916445, 'América del Sur', 3, 'Venezuela', 'VE'),
    ('Túnez', 'Túnez', 'Dinar tunecino', 2, 1, 11818619, 163610.00, 'África del Norte', 1,  'Tunisia', 'TN'),
    ('Noruega', 'Oslo', 'Corona noruega', 4, 1, 5367580, 323802.00, 'Europa del Norte', 1,'Norway', 'NO'),
	('Uruguay', 'Montevideo', 'Peso uruguayo', 3, 1, 3426000, 176.220, 'América del Sur', 3, 'Uruguay', 'UY'),
	('Honduras', 'Tegucigalpa', 'Lempira hondureño', 3, 1, 10280000, 112.492, 'Centro América', 2, 'Honduras', 'HN'),
	('El Salvador', 'San Salvador', 'Colón', 3, 1, 6314000, 21.040, 'Centro América', 1, 'El Salvador', 'SV'), 
	('Ucrania', 'Kiev', 'Grivna', 4, 1, 36744636, 603.700, 'Europa Oriental', 1, 'Ukraine', 'UA'),  
	('Rumanía', 'Bucarest', 'Leu', 4, 1, 19317984, 238.397, 'Europa Centro Oriental', 1, 'Romania', 'RO'),
	('Vanuatu', 'Port Vila', 'Vatu', 5, 1, 319137, 12.189, 'Oceanía', 1, 'Vanuatu', 'VU'),
	('Finlandia', 'Helsinki', 'Euro', 4, 11, 5517919, 338.450, 'Europa del Norte', 1, 'Finland', 'FI'),
	('Lituania', 'Vilna', 'Euro', 4, 11, 2921262, 65.301, 'Europa Oriental', 1, 'Lithuania', 'LT'),
	('Hungría', 'Budapest', 'Forinto húngaro', 4, 11, 9597085, 93.011, 'Europa Central', 1, 'Hungary', 'HU'),
	('Estonia', 'Tallin', 'Euro', 4, 11, 1294455, 45.226, 'Europa Oriental', 1, 'Estonia', 'EE'),
	('Polonia', 'Varsovia', 'Zloty', 4, 11, 37908704, 322.575, 'Europa Central', 2, 'Poland', 'PL'),
	('Bélgica', 'Bruselas', 'Euro', 4, 11, 11521238, 30.688, 'Europa Occidental', 1, 'Belgium', 'BE'),
	('Grecia', 'Atenas', 'Euro', 4, 11, 10816286, 131.957, 'Europa Oriental', 2, 'Greece', 'GR'),
	('Angola', 'Luanda', 'Kwanza angoleño', 2, 1, 34500000, 1.246700, 'África Occdental', 1, 'Angola', 'AO'),
	('Namibia', 'Windhoek', 'Dólar namibio', 2, 1, 2597000, 824.292, 'África del Sur', 1, 'Namibia', 'NA'),
	('Zambia', 'Lusaka', 'Kwacha zambiano', 2, 1, 19470500, 752.610, 'África Austral', 0, 'Zambia', 'ZM'),
	('Botsuana', 'Gaborone', 'Pula', 2, 1, 2588423, 581.730, 'África del Sur', 0, 'Botswana', 'BW'),
	('Tanzania', 'Dodoma', 'Chelín tanzano', 2, 1, 63588334, 945.087, 'África Oriental', 1, 'Tanzania', 'TZ'),
	('Kenia', 'Nairobi', 'Chelín keniano', 2, 1, 53005614, 580.367, 'África Oriental', 1, 'Kenya', 'KE'),
	('Fiyi', 'Suva', 'Dólar fiyiano', 5, 1, 924610, 18.270, 'Oceanía', 1, 'Fiji', 'FJ'),
	('Samoa', 'Apia', 'Tala', 5, 11, 200000, 2.831, 'Oceanía', 1, 'Samoa', 'WS'),
	('Bolivia', 'La Paz', 'Boliviano', 3, 1, 12080000, 1.098581, 'América del Sur', 0, 'Bolivia', 'BO'),
	('Islas Salomón', 'Honiara', 'Dólar de las islas salomón', 5, 11, 707851, 28.900, 'Oceanía', 1, 'Solomon Islands','SB'),
	('Tonga', 'Nukualofa', 'Paanga', 5, 11, 106017, 748, 'Oceanía', 1, 'Tonga', 'TO'),
	('Georgia', 'Tiflis', 'Lari georgiano', 1, 1, 3736357, 69.700, 'Asia Oriental', 1, 'Georgia', 'GE'),
	('Bangladesh', 'Daca', 'Taka bangladesí', 1, 11, 169400000, 147.570, 'Asia del Sur', 1, 'Bangladesh', 'BD'),
	('Israel', 'Jerusalén', 'Séquel israelí', 1, 11, 9364000, 22.145, 'Asia Occidental', 1, 'Israel', 'IL'),
	('Corea del Sur', 'Seúl', 'Won surcoreano', 1, 1, 51745000, 100.210, 'Asia Oriental', 1, 'South Korea', 'KR'),
	('Corea del Norte', 'Pionyang', 'Won norcoreano', 1, 10, 25971909, 120.540, 'Asia', 1, 'North Korea', 'KP'),
	('Hong Kong', 'Hong Kong', 'Dólares de hong kong', 1, 1, 7402000, 2.755, 'Asia Oriental', 1, 'Hong Kong', 'HK'),
	('Irán', 'Teherán', 'Rial iraní', 1, 5, 82021564, 1.745150, 'Asia occidental', 1, 'Iran', 'IR'),
	('Qatar', 'Doha', 'Riyal catarí', 1, 4, 2688000, 11.571, 'Asia occidental', 1, 'Qatar', 'QA'),
	('Tailandia', 'Bangkok', 'Baht tailandés', 1, 1, 71600000, 513.120, 'Asia Oriental', 1, 'Thailand', 'TH'),
	('Uzbekistán', 'Taskent', 'Som Uzbeko', 1, 1, 34920000, 448.924, 'Asia Central', 2, 'Uzbekistan', 'UZ'),
	('Armenia', 'Ereván', 'Dram armenio', 1, 11, 2791000, 29.743, 'Asia Occidental', 2, 'Armenia', 'AM'),
	('Malasia', 'T.F. Kuala Lumpur', 'Ringgit', 1, 11, 32580000, 330.252, 'Sureste de Asia', 2, 'Malaysia', 'MY'),
	('Filipinas', 'Manila', 'Peso filipino', 1, 1, 113900000, 298.170, 'Asia Oriental', 2, 'Philippines', 'PH'),
	('Vietnam', 'Hanói', 'Dong vietnamita', 1, 10, 97470000, 331.210, 'Asia Oriental', 2, 'Vietnam', 'VN'),
	('Chile', 'Santiago de Chile', 'Peso chileno', 3, 1, 17574003, 756.945, 'América del sur', 1, 'Chile', 'CL'),
	('Costa Rica', 'San José', 'Colón costarricense', 3, 1, 5226363, 51.100, 'Centro América', 1 , 'Costa Rica', 'CR'),
	('Cuba', 'La Habana', 'Peso cubano', 3, 10, 11256372, 109.880, 'Centro América', 2, 'Cuba', 'CU'),
	('República Dominicana', 'Santo Domingo', 'Peso dominicano', 3, 1, 11117873, 48.422, 'Centro América', 2, 'Dominican Republic', 'DO'),
	('Guatemala', 'Ciudad de Guatemala', 'Quetzal', 3, 1, 17110000, 108.889, 'Centro América', 2, 'Guatemala', 'GT'),
	('Haití', 'Puerto Príncipe', 'Gourde', 3, 1, 11450000, 27.750, 'Centro América', 2, 'Haiti', 'HT'),
	('Nicaragua', 'Managua', 'Córdobas', 3, 1, 6624554, 130.373,'Centro América', 2, 'Nicaragua', 'NI'),
	('Paraguay', 'Asunción', 'Guarani', 3, 1, 7453695, 406.752, 'América del Sur', 2, 'Paraguayan', 'PY'),
	('Panamá', 'Panamá', 'Balboa', 3, 1, 4279000, 75.512, 'Centro América', 2, 'Panama', 'PA'),
	('Belice', 'Belmopán', 'Dólar de belice', 3, 4, 400031, 22.970, 'Centro América', 3, 'Belize', 'BZ'),
	('Surinam', 'Paramaribo', 'Dólares surinameses', 3, 1, 634990, 163.270, 'América del Sur', 2, 'Surinam', 'SR'),
	('Curazao', 'Willemstad', 'Florín antillano', 3, 4, 152369, 444, 'América del Sur', 3, 'Curacao', 'CW'),
	('Barbados', 'Bridgetown', 'Dólar de barbados', 3, 4, 284996, 430, 'Mar Caribe Oriental', 3, 'Barbados', 'BB'),
	('Guadalupe', 'Basse-Terre', 'Franco', 3, 1, 403314, 1.628, 'Mar Caribe', 2, 'Guadeloupe', 'GP'),
	('Aruba', 'Oranjestad', 'Florín arubeño', 3, 1, 106537, 180, 'América del Sur', 3, 'Aruba', 'AW'),
	('Granada', 'Saint George', 'Dólar del caribe oriental', 3, 4, 231775, 88, 'América del Sur', 2, 'Grenade', 'GD'),
	('Suiza', 'Berna', 'Franco suizo', 4, 1, 8680890, 41.285, 'Europa Occidental', 3, 'Swiss', 'CH'),
	('Austria', 'Viena', 'Euro', 4, 1, 8993300, 83.879, 'Europa Occidental', 2, 'Austria', 'AT'),
	('Dinamarca', 'Copenhague', 'Corona danesa', 4, 11, 5928362, 42.951, 'Europa del Norte', 3, 'Denmark', 'DK'),
	('Irlanda', 'Dublín', 'Euro', 4, 1, 5086988, 70.282, 'Europa Occidental', 2, 'Ireland', 'IE'),
	('Serbia', 'Belgrado', 'Dinar serbio', 4, 1, 6690887, 88.449, 'Europa Central y Sudoriental', 2, 'Serbia', 'RS'),
	('Malta', 'La Valeta', 'Lira maltesa', 4, 11, 520971, 316, 'Europa Meridional', 2, 'Malta', 'MT'),
	('Bulgaria', 'Sofía', 'Lev búlgaro', 4, 11, 6306468, 110.936, 'Europa Occidental', 1, 'Bulgaria', 'BG'),
	('Eslovenia', 'Liubliana', 'Euro', 4, 11, 2107180, 20.273, 'Europa Central', 2, 'Slovenia', 'SI'),
	('Luxemburgo', 'Luxemburgo', 'Euro', 4, 4, 636000, 2.590, 'Europa Occidental', 1, 'Luxembourg', 'LU'),
	('Montenegro', 'Podgorica', 'Euro', 4, 1, 620029, 13812, 'Europa Oriental', 2, 'Montenegro', 'ME'),
	('Ghana', 'Acra', 'Cedi', 2, 1, 31486000, 238.533, 'África Occidental', 2, 'Ghana', 'GH'),
	('Marruecos', 'Rabat', 'Dírham marroquí', 2, 4, 37080000, 710.850, 'África Oriental', 1, 'Morocco', 'MA'),
	('Senegal', 'Dakar', 'Franco CFA', 2, 1, 16880000, 197.161, 'África Occidental', 2, 'Senegal', 'SN'),
	('Malí', 'Bamako', 'Franco CFA', 2, 1, 21904983, 1.240000, 'África Occidental', 2, 'Mali', 'ML'),
	('Zimbabue', 'Harare', 'Dólar estadounidense', 2, 1, 15990000, 390.580, 'África del Sur', 1, 'Zimbabwe', 'ZW'),
	('Islas Marshall', 'Majuro', 'Dólar estadounidense', 5, 1, 42050, 181, 'Oceanía', 1, 'Marshall Islands', 'MH');
	

GO


INSERT INTO Paises_Idiomas (pais_id, idioma_id, hablantes, porcentaje)
VALUES
    (1, 1, 14000000, 79.22),
    (1, 2, 500000, 2.81),
    (2, 7, 1200000000, 85.17),
    (2, 9, 200000, 0.01),
    (3, 1, 230000000, 69.41),
    (3, 2, 45000000, 13.54),
    (4, 4, 146000000, 99.88),
    (4, 8, 250000, 0.17),
    (5, 1, 210000000, 98.76),
    (5, 6, 50000000, 23.45),
    (6, 1, 1200000000, 85.19),
    (6, 7, 30000000, 2.12),
    (7, 1, 125000000, 99.24),
    (7, 6, 2000000, 1.58),
    (8, 1, 90000000, 89.24),
    (8, 2, 45000000, 44.62),
    (9, 1, 97000000, 98.35),
    (9, 6, 2000000, 2.03),
    (10, 1, 400000, 1.57),
    (10, 5, 20000000, 78.43),
    (11, 1, 1200000000, 98.43),
    (11, 2, 45000000, 3.72),
    (12, 1, 33000000, 85.11),
    (12, 3, 5000000, 12.88),
    (13, 1, 45000000, 88.23),
    (13, 2, 8000000, 15.65),
    (14, 1, 120000000, 99.89),
    (14, 6, 3000000, 2.48),
    (15, 1, 5000000, 79.21),
    (15, 4, 300000, 4.75),
    (16, 1, 35000000, 89.24),
    (16, 6, 2000000, 5.12),
    (17, 1, 45000000, 90.21),
    (17, 2, 5000000, 9.99),
    (18, 1, 60000000, 88.23),
    (18, 6, 3000000, 4.41),
    (19, 1, 7000000, 99.89),
    (19, 5, 500000, 7.12),
    (20, 1, 30000000, 88.76),
    (20, 3, 1000000, 2.94),
    (21, 1, 65000000, 90.21),
    (21, 2, 3000000, 4.12),
    (22, 1, 20000000, 88.23),
    (22, 6, 1000000, 5.41),
    (23, 1, 1000000, 79.21),
    (23, 4, 200000, 1.35),
    (24, 1, 5000000, 89.24),
    (24, 6, 200000, 7.12),
    (25, 1, 8000000, 90.21),
    (25, 2, 1000000, 4.11),
	(26, 1, 2500000, 79.21),
    (26, 4, 300000, 1.35),
    (27, 1, 5000000, 89.24),
    (27, 6, 200000, 7.12),
    (28, 1, 8000000, 90.21),
    (28, 2, 1000000, 4.11),
    (29, 1, 14000000, 79.22),
    (29, 2, 500000, 2.81),
    (30, 7, 1200000000, 85.17),
    (30, 9, 200000, 0.01),
	(31, 1,	3357480, 98),
	(31, 2, 68520, 2),
	(32, 1, 9252000, 90),
	(32, 2, 1028000, 10),
	(33, 1, 6187720, 99),
	--(33, 1, 126280, 0.02),
	(34, 9, 12125729, 33),
	(34, 17, 3674464, 10),
	(35, 4, 1545439, 0.08),
	(35, 18, 1159079, 0.06),
	(36, 2, 191482, 60),
	(36, 3, 95738, 30),
	(37, 13, 275896, 0.05),
	(37, 16, 4966127, 90),
	(38, 9, 146063, 0.05),
	(38, 17, 233701, 0.08),
	(39, 18, 9501114, 98),
	(39, 4, 95971, 0.01),
	(40, 9, 388337, 30),
	(40, 17, 12944, 0.01),
	(41, 17, 36771443, 97),
	(41, 9, 758174, 0.02),
	(42, 3, 3456371, 0.30),
	(42, 4, 115212, 0.01),
	(43, 20, 10708123, 99),
	(43, 19, 54081, 0.005),
	(44, 6, 32775000, 95),
	(44, 4, 172500, 0.005),
	(45, 2, 12985, 0.005),
	(45, 3, 519, 0.0002),
	(46, 2, 19081090, 98),
	(46, 4, 97352, 0.005),
	(47, 2, 517685, 20),
	(47, 3, 5176, 0.002),
	(48, 2, 9538250, 15),
	(48, 10, 6358833, 10),
	(49, 2, 15901684, 30),
	(49, 10, 159016, 0.003),
	(50, 2, 8293149, 90),
	(50, 3, 9214, 0.001),
	(51, 2, 24000, 0.12),
	(51, 3, 1400, 0.007),
	(52, 1, 8456000, 70),
	(52, 2, 241600, 0.02),
	(53, 2, 113256, 16),
	(53, 19, 3539, 0.005),
	(54, 2, 31805, 30),
	(54, 19, 318, 0.003),
	(55, 9, 373636, 10),
	(55, 3, 11209, 0.003),
	(56, 2, 20328000, 12),
	(56, 4, 338800, 0.002),
	(57, 10, 1872800, 20),
	(57, 9, 1404600, 15),
	(58, 2, 155235, 0.003),
	(58, 11, 51227550, 99),
	(59, 11, 25712189, 99),
	(59, 7, 25972, 0.001),
	(60, 2, 444120, 0.06),
	(60, 7, 888240, 12),
	(61, 10, 4101078, 0.05),
	(61, 2, 82921, 0.001),
	(62, 10, 2392320, 89),
	(62, 2, 268800, 10),
	(63, 7, 71600, 0.001),
	(63, 2, 8592000, 12),
	(64, 9, 6285600, 18),
	(64, 4, 69840, 0.002),
	(65, 9, 139550, 0.05),
	(65, 2, 5582, 0.002),
	(66, 7, 7819200, 24),
	(66, 2, 977400, 0.03),
	(67, 2, 63784000, 56),
	(67, 3, 569500, 0.005),
	(68, 2, 24367500, 25),
	(68, 3, 11696400, 12),
	(69, 1, 17398262, 99),
	(69, 2, 87870, 0.001),
	(70, 1, 5121835, 98),
	(70, 2, 10452, 0.002),
	(71, 1, 11031244, 98),
	(71, 2, 33769, 0.003),
	(72, 1, 10895515, 98),
	(72, 2, 33353, 0.003),
	(73, 1, 11977000, 70),
	(73, 2, 855500, 0.05),
	(74, 3, 2862500, 25),
	(74, 2, 343500, 0.03),
	(75, 1, 6293326, 95),
	(75, 2, 33122, 0.005),
	(76, 1, 6708325, 90),
	(76, 2, 223610, 0.03),
	(77, 1, 4065050, 95),
	(77, 2, 12837, 0.003),
	(78, 2, 248019, 62),
	(78, 1, 224017, 56),
	(79, 12, 380994, 60),
	(79, 10, 1269, 0.002),
	(80, 1, 15236, 10),
	(80, 2, 30473, 20),
	(81, 2, 270746, 95),
	(81, 3, 569, 0.002),
	(82, 3, 395247, 98),
	(82, 2, 1209, 0.003),
	(83, 12, 15980, 15),
	(83, 1, 10653, 10),
	(84, 2, 208597, 90),
	(84, 3, 11588, 0.05),
	(85, 4, 5468960, 63),
	(85, 5, 694471, 0.08),
	(86, 4, 8813434, 98),
	(86, 2, 449665, 0.05),
	(87, 3, 5335525, 90),
	(87, 4, 1067105, 18),
	(88, 2, 4730898, 93),
	(88, 3, 20347, 0.004),
	(89, 18, 2007266, 30),
	(89, 2, 13381, 0.002),
	(90, 2, 458454, 88),
	(90, 1, 2083, 0.004),
	(91, 20, 2207263, 35),
	(91, 9, 1576617, 25),
	(92, 5, 421436, 20),
	(92, 2, 105359, 0.05),
	(93, 3, 159000, 25),
	(93, 4, 95400, 15),
	(94, 9, 80603, 13),
	(94, 4, 43402, 0.07),
	(95, 2, 25188800, 80),
	(95, 3, 1259440, 0.04),
	(96, 10, 25956000, 70),
	(96, 3, 14832000, 40),
	(97, 3, 337600, 20),
	(97, 2, 151920, 0.09),
	(98, 10, 3066697, 14),
	(98, 2, 153334, 0.007),
	(99, 2, 319800, 0.02),
	(99, 3, 159900, 0.01),
	(100, 2, 34481, 82),
	(100, 3, 3784, 0.09);

GO
--SELECT * FROM Paises
INSERT INTO Paises_Vecinos (pais_id, vecino_id, kms_frontera)
VALUES
    (1, 26, 590),   -- Ecuador - Colombia
	(1, 27, 1420),  -- Ecuador - Perú
	(1, 28, 1370),   -- Ecuador - Venezuela
    (2, 4, 4209), -- China - Rusia
    (2, 6, 4253), -- China - India
    (3, 12, 8891),  -- Estados Unidos - Canadá
    (3, 7, 3145),  -- Estados Unidos - México
    (4, 2, 4209),  -- Rusia - China
	(5, 17, 1261), -- Brasil - Argentina
    (5, 26, 1644), -- Brasil - Colombia
	(5, 27, 2995), -- Brasil - Perú
	(5, 28, 2200), -- Brasil - Venezuela
    (6, 3, 3488),  -- India - China
    (7, 14, 3145),  --México - Estados Unidos
    (8, 21, 623), -- Francia - España
    (8, 16, 488),  -- Francia - Italia
    --(9, -, -), -- Egipto - Sin vecinos
    --(10, -, -),  -- Australia - No tiene vecinos es continente
    --(11, -, -), -- Japón - No tiene vecinos es isla
    (12, 3, 8891), -- Canadá - Estados Unidos
    (13, 8, 451), -- Alemania - Francia
    --(14, -, -),  -- Sudáfrica - Sin vecinos
    --(15, -, -, -- Nueva Zelanda - No tiene vecinos es isla
    (16, 8, 488), -- Italia - Francia
    --(16,- , -), -- Italia - Suiza -> No esta Suiza
    (17, 5, 1261),-- Argentina - Brasil
    --(18, -, -), -- Reino Unido - Sin vecinos
    --(19, -, -),-- Nigeria - Sin vecinos
    --(20, -, -), -- Indonesia -No tiene vecinos es isla
    (21, 8, 623),  -- España - Francia
    --(21, -, 325), -- España - Portugal
    (22, 30, 1619), -- Suecia - Noruega
    --(23, 26, 235), -- Nueva Guinea - No tiene vecinos es isla
    (24, 29, 965), -- Argelia - Túnez
    --(25, -, -), -- Jamaica - Es isla
	(26, 1, 590),  -- Colombia - Ecuador
	(26, 5, 1644),  -- Colombia - Brasil
	(26, 27, 1496),  -- Colombia - Perú
	(26, 28, 2219),  -- Colombia - Venezuela
	(27, 1, 1529),  -- Perú - Ecuador
	(27, 5, 2822),  -- Perú - Brasil
	(27, 26, 1496),  -- Perú - Colombia
	(28, 5, 2200),  -- Venezuela - Brasil
	(28, 26, 2219),  -- Venezuela - Colombia
	(29, 24, 965),  -- Túnez - Argelia
	(30, 22, 1619),  -- Noruega - Suecia
	(31, 5, 985), -- Uruguay - Brasil
	(31, 17, 579), -- Uruguay - Argentina
	(32, 33, 375), -- Honduras - El Salvador
	(32, 73, 256), -- Honduras - Guatemala
	(32, 75, 966), --Honduras - Nicaragua
	(33, 73, 256), -- El Salvador - Guatemala
	(33, 32, 190), -- El Salvador - Honduras 
	(33, 75, 425), -- El Salvador - Nicaragua
	(34, 4, 850), -- Ucrania - Rusia
	(34, 41, 570), -- Ucrania - Polonia
	(34, 39, 790), -- Ucrania - Hungria
	(35, 91, 290), -- Rumania - Bulgaria
	(35, 89, 450), -- Rumania - Serbia
	(35, 39, 590), -- Rumania - Hungria
	(36, 53, 900), -- Vanuatu - Islas Salomón
	(36, 50, 1500), -- Vanuatu - Fiyi
	(37, 22, 500), -- Finlandia - Suecia
	(37, 30, 1200), -- Finlandia - Noruega
	(37, 4, 400), -- Finlandia - Rusia
	(38, 41, 380), -- Lituania - Polonia
	(38, 4, 350), -- Lituania - Rusia
	(39, 86, 214), -- Hungria - Austria
	(39, 34, 670), -- Hungria - Ucrania
	(39, 35, 650), -- Hungria - Rumania
	(40, 4, 395), -- Estonia - Rusia
	(41, 13, 570), -- Polonia - Alemania
	(41, 34, 560), -- Polonia - Ucrania
	(41, 38, 340), -- Polonia - Lituania
	(42, 8, 300), -- Belgica - Francia
	(42, 93, 200), -- Belgica - Luxemburgo
	(42, 13, 650), -- Belgica - Alemania
	(43, 91, 300), -- Grecia - Bulgaria
	(43, 16, 850), -- Gracia - Italia
	(44, 47, 1800), -- Angola - Botsuana
	(44, 46, 1600), -- Angola - Zambia
	(45, 44, 1200), -- Namibia - Angola
	(45, 46, 1200), -- Namibia - Zambia
	(46, 48, 1300), -- Zambia - Tanzania
	(46, 99, 1100), -- Zambia - Zimbabue
	(47, 99, 900), -- Botsuana - Zimbabue
	(47, 46, 1100), -- Botsuana - Zambia
	(48, 49, 540), --Tanzania - Kenia
	(48, 46, 1200), -- Tanzania - Zambia
	(49, 48, 540), -- Kenia - Tanzania
	--(50, -,-), -- Fiyi país insular
	(51, 54, 520), -- Samoa - Tonga
	(52, 5, 1500), -- Bolivia - Brasil
	(52, 27, 1400), -- Bolivia - Perú
	(52, 69, 1800), -- Bolivia - Chile
	(53, 36, 1000), -- Islas Salomón - Vanuatu
	(54, 51, 810), -- Tonga - Samoa
	(55, 4, 1200), -- Georgia - Rusia 
	(55, 65, 265), -- Georgia - Armenia
	(56, 6, 150), -- Bangladesh - India
	(57, 9, 300), -- Israel - Egipto
	(58, 59, 195), -- Corea del sur - Corea del norte
	(58, 2, 900), -- Corea del Sur - China
	(59, 58, 195), -- Corea del Norte - Corea del Sur
	(59, 4, 550), -- Corea del Norte - Rusia
	(59, 2, 800), -- Corea del Norte - China
	(60, 2, 135), -- hong Kong - China
	(61, 65, 370), -- Irán - Armenia
	--(62, -, -), -- Qatar sin vecinos
	(63, 66, 1050), -- Tailandia - Malasia
	--(64, -, -), --Uzbekistán sin vecinos
	(65, 55, 260), -- Armenia - Georgia
	(65, 61, 370), -- Armenia - Irán
	(66, 63, 1050), -- Malasia - Tailandia
	(66, 20, 1100), -- Malasia - Indonesia
	(67, 66, 2000), -- Filipinas - Malasia
	(67, 20, 2500), -- Filipinas - Indonesia
	(68, 2, 1200), -- Vietnam - China
	(69, 27, 2200), -- Chile - Perú
	(69, 17, 1200), -- Chile - Argentina
	(69, 52, 1150), -- Chile - Bolivia
	(70, 75, 225), -- Costa Rica - Nicaragua
	(70, 77, 700), -- Costa Rica - Panama
	(71, 25, 560), -- Cuba - Jamaica
	(71, 74, 770), -- Cuba - Haití
	(72, 74, 360), -- Republica Dominicana - Haití
	(73, 7, 1020), -- Guatemala - México
	(73, 78, 200), -- Guatemala - Belice
	(73, 32, 400), -- Guatemala - Honduras
	(74, 72, 360), -- Haití - Republica Dominicana
	(75, 32, 270), -- Nicaragua - Honduras
	(75, 70, 350), -- Nicaragua - Costa Rica
	(76, 52, 400), -- Paraguay - Bolivia
	(76, 5, 900), -- Paraguay - Brasil
	(76, 17, 1000), -- Paraguay - Argentina
	(77, 70, 330), -- Panamá - Costa Rica
	(77, 26, 1200), -- Panamá - Colombia
	(78, 7, 10), -- Belice - México
	(78, 73, 100), -- Belice - Guatemala
	(79, 5, 400), -- Surinam - Brasil
	(80, 83, 70), -- Curazao - Aruba
	(80, 28, 100), -- Curazao - Venezuela
	(81, 84, 290), -- Barbados - Granada
	--(82, -, -), -- Guadalupe sin vecinos
	(83, 80, 30), -- Aruba - Curazao
	(83, 28, 30), -- Aruba - Venezuela
	(84, 81, 290), -- Granada - Barbados
	(85, 13, 40), -- Suiza - Alemania
	(85, 8, 70), -- Suiza - Francia
	(85, 16, 50), -- Suiza - Italia
	(86, 13, 50), -- Austria - Alemania
	(86, 39, 70), -- Austria - Hungría
	(87, 13, 180), -- Dinamarca - Alemania
	(87, 22, 8), -- Dinamarca - Suecia
	(87, 30, 380), -- Dinamarca - Noruega
	(88, 18, 90), -- Irlanda - Reino Unido
	(88, 8, 500), -- Irlanda - Francia
	(88, 21, 1000), -- Irlanda - España
	(89, 39, 170), -- Serbia - Hungría
	(89, 35, 160), -- Serbia - Rumania
	(90, 16, 95), -- Malta - Italia
	(90, 29, 290), -- Malta - Túnez
	(91, 43, 300), -- Bulgaria - Grecia
	(91, 35, 400), -- Bulgaria - Rumanía
	(91, 89, 320), -- Bulgaria - Serbia
	(92, 16, 100), -- Eslovenia - Italia
	(92, 86, 140), -- Eslovenia - Austria
	(92, 39, 330), -- Eslovenia - Hungria
	(93, 42, 30), -- Luxemburgo - Bélgica
	(93, 8, 50), -- Luxemburgo - Francia
	(93, 13, 40), -- Luxemburgo - Alemania
	(94, 89, 400), -- Montenegro - Serbia
	--(95, -, ), -- Ghana sin vecinos
	(96, 21, 10), -- Marruecos - España
	--(97, -, ), -- Senegal sin vecinos
	--(98, -, ), -- Mali sin vecinos
	(99, 47, 200), -- Zimbabue - Botsuana
	(99, 46, 270) -- Zimbabue - Zambia
	--(100, -, -); -- Islas Marshall país insular 
GO
--Cargar Paises
CREATE PROC CargarPaises
AS
BEGIN
SELECT p.id, p.pais, p.capital, p.moneda, c.continente,g.gobierno,p.posicion,p.code
FROM Paises p 
  INNER JOIN Continentes c ON p.continente_id = c.id
  INNER JOIN Gobiernos g ON p.gobierno_id = g.id
END
GO
--Continente de cada país
CREATE PROC PaisContinente
AS
BEGIN
SELECT p.pais, c.continente
FROM paises p 
  INNER JOIN continentes c ON p.continente_id = c.id
ORDER BY p.pais;
END
GO
--Países en cada continente
CREATE PROCEDURE PaisesXContinente
AS
Begin
SELECT c.continente, STRING_AGG(p.pais ,', ') as paises
FROM continentes c 
  INNER JOIN paises p ON p.continente_id = c.id 
GROUP BY c.continente
ORDER BY 1;
END 
GO

--aíses fronterizos a España

CREATE PROCEDURE FronterasXPais
@nombrePais VARCHAR(35) -- Parámetro para el nombre del país
AS
BEGIN
  SELECT p.pais AS pais_principal, v.pais AS pais_vecino, pv.kms_frontera
  FROM paises p 
    INNER JOIN paises_vecinos pv ON p.id = pv.pais_id 
    INNER JOIN paises v ON pv.vecino_id = v.id
  WHERE p.pais = @nombrePais;
END;
GO
-- Prueba de FronterasPais
/*EXEC FronterasXPais @nombrePais = 'Brasil'; -- Busco Alemania
GO
*/

--Países fronterizos a cada país
CREATE PROCEDURE FronterasTodosPaises
AS
SELECT p.Pais, STRING_AGG (v.pais  , ', ')  as Vecinos
FROM paises p 
  INNER JOIN paises_vecinos pv ON p.id = pv.pais_id 
  INNER JOIN paises v ON pv.vecino_id = v.id
GROUP BY p.pais
ORDER BY 1;
GO

--Idiomas que se habla en cada país
CREATE PROCEDURE IdiomasPaises
AS
SELECT p.Pais, STRING_AGG(i.idioma ,', ') as Idiomas
FROM paises p 
  INNER JOIN paises_idiomas pi ON p.id = pi.pais_id 
  INNER JOIN idiomas i ON pi.idioma_id = i.id
GROUP BY p.Pais	
ORDER BY 1;
GO

--Comprobar que las fronteras a ambos lados mida lo mismo

--En la tabla paises_vecinos para cada registro de (país, vecino) hay otro registro igual que es (vecino, país). En ambos casos los kilómetros de frontera deberían coincidir.
-- Se trata de averiguar cuando no se cumple.


CREATE PROCEDURE NoCoincidenFronteras
AS
SELECT *
FROM (
  SELECT a.pais_id, a.vecino_id, COALESCE(a.kms_frontera, 0) AS frontera1,
         COALESCE(b.kms_frontera, 0) AS frontera2
  FROM paises_vecinos a
  LEFT JOIN paises_vecinos b
  ON a.pais_id = b.vecino_id AND a.vecino_id = b.pais_id
  WHERE a.pais_id < a.vecino_id
) AS aa
WHERE frontera1 <> frontera2 OR frontera2 IS NULL;
GO



--Mostrar el país más poblado y el más grande

-- Este es para mostrar ambos al mismo tiempo
SELECT 
  Pais, 
  Poblacion,
  Extension
FROM paises 
WHERE poblacion >= ALL (SELECT poblacion FROM paises)
  OR extension >= ALL (SELECT extension FROM paises);
GO
  -- pais mas extenso
CREATE PROCEDURE PaisMasGrande
AS
SELECT TOP 1 Pais, Extension
FROM paises
ORDER BY extension DESC;
GO

--Pais mas poblado
CREATE PROCEDURE PaisMasPoblado
AS
SELECT TOP 1 Pais, Poblacion
FROM paises
ORDER BY poblacion DESC;
GO

  --Países ordenados por densidad de población

CREATE PROCEDURE OrdenarXDensidad
AS
SELECT Pais, poblacion / extension AS Densidad
FROM paises
WHERE extension IS NOT NULL 
ORDER BY poblacion / extension;
GO


--Idiomas y países de Europa donde se habla

CREATE PROCEDURE PaisesPorIdiomaYContinente
@continente VARCHAR(20) -- Parámetro para el continente
AS
BEGIN
  SELECT i.Idioma, STRING_AGG(p.pais , ', ') AS Paises
  FROM paises p
    INNER JOIN paises_idiomas pi ON pi.pais_id = p.id 
    INNER JOIN idiomas i ON pi.idioma_id = i.id
  WHERE p.continente_id = (SELECT id FROM continentes WHERE continente = @continente)
  GROUP BY i.idioma
  ORDER BY i.idioma;
END;
GO

--Kilómetros de frontera y de costa de cada país

CREATE PROCEDURE CostayFronteraPaises
AS
SELECT 
  Pais,
  Costa,
  Frontera,
  CASE 
    WHEN costa IS NULL AND frontera IS NULL THEN NULL
    WHEN costa IS NULL THEN frontera
    WHEN frontera IS NULL THEN costa
    ELSE frontera + costa
  END AS Total
FROM (
  SELECT 
    pais, 
    SUM(CAST(costa AS DECIMAL(15,5))) AS costa, 
    SUM(CAST(kms_frontera AS DECIMAL(15,5))) AS frontera
  FROM paises p 
    LEFT JOIN paises_vecinos pv ON pv.pais_id = p.id
  GROUP BY pais
) a;
GO



--Clasificar los países por ser islas, por tener costa, por ser interior o por falta de datos

CREATE PROCEDURE TipoPaisGeografia
AS
SELECT 
  Pais, 
  CASE 
    WHEN costa IS NULL AND frontera IS NULL THEN 'Faltan datos'
    WHEN frontera IS NULL THEN 'Isla'
    WHEN COALESCE(costa, 0) = 0 THEN 'Interior'
    ELSE 'Costero'
  END AS Tipo
FROM (
  SELECT 
    pais, 
    costa, 
    SUM(kms_frontera) AS frontera
  FROM paises p 
    LEFT JOIN paises_vecinos pv ON pv.pais_id = p.id
  GROUP BY pais, costa
) a
ORDER BY pais;
GO


--Números de países que empieza por cada letra encolumnado por continente
CREATE PROCEDURE AlfabetoPaisesXContinente
AS
SELECT Inicial, 
  SUM(CASE WHEN continente = 'Africa' THEN 1 ELSE 0 END) Africanos,
  SUM(CASE WHEN continente = 'América' THEN 1 ELSE 0 END) Americanos,
  SUM(CASE WHEN continente = 'Asia' THEN 1 ELSE 0 END) Asiaticos,
  SUM(CASE WHEN continente = 'Europa' THEN 1 ELSE 0 END) Europeos,
  SUM(CASE WHEN continente = 'Oceanía' THEN 1 ELSE 0 END) Oceanicos
FROM ( 
  SELECT LEFT(pais,1) inicial, continente
  FROM paises p INNER JOIN continentes c ON p.continente_id = c.id
) a
GROUP BY inicial
GO


--Países con más o igual población que alguno de los países con más de cincuenta millones de km2 de extensión

CREATE PROCEDURE PaisesSuperioresA50M
AS
SELECT Pais, poblacion AS Habitantes
FROM paises
WHERE poblacion >= ANY (
  SELECT poblacion 
  FROM paises 
  WHERE extension >= 5000000
)
ORDER BY pais;
GO

/* Original
SELECT pais, FORMAT(poblacion,0) habitantes
FROM paises
WHERE poblacion >= (
  SELECT MIN(poblacion)
  FROM paises 
  WHERE extension >= 5000000
)
ORDER BY pais
*/

--Países con más países limítrofes que sus vecinos

CREATE VIEW paises2 AS
    SELECT p.id, p.pais, COUNT(*) AS num_vecinos
FROM paises p
INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
GROUP BY p.id, p.pais;
  go

 --Select * from  paises2

  CREATE PROCEDURE PaisesConMasLimitrofres 
  AS
  SELECT pais, num_vecinos
FROM paises2 p  
WHERE num_vecinos > ALL (
  SELECT v.num_vecinos
  FROM paises_vecinos pv INNER JOIN paises2 v ON pv.vecino_id = v.id
  WHERE p.id = pv.pais_id)
ORDER BY 1
GO


/*
  CREATE VIEW paises2 AS
SELECT P1.pais, COUNT(DISTINCT P2.id) AS num_vecinos, COUNT(DISTINCT PV1.vecino_id) AS num_limitrofes
FROM Paises P1
JOIN Paises_Vecinos PV1 ON P1.id = PV1.pais_id
LEFT JOIN Paises_Vecinos PV2 ON P1.id = PV2.pais_id AND PV1.vecino_id = PV2.vecino_id
JOIN Paises P2 ON PV1.vecino_id = P2.id
GROUP BY P1.pais
HAVING COUNT(DISTINCT P2.id) > COUNT(DISTINCT PV1.vecino_id);
Go
*/



SELECT p.pais, p.num_vecinos
FROM paises2 p 
INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
INNER JOIN paises2 v ON pv.vecino_id = v.id
WHERE p.num_vecinos > v.num_vecinos
GROUP BY p.pais, p.num_vecinos
HAVING p.num_vecinos = COUNT(*)
ORDER BY p.pais;
GO


--Países con más población que sus países vecinos
CREATE PROCEDURE PaisesConMasPoblacionQueVecinos
AS
SELECT pais, poblacion AS habitantes
FROM paises p
WHERE poblacion > ALL (
  SELECT poblacion
  FROM paises v
  WHERE EXISTS (
    SELECT 1
    FROM paises_vecinos pv
    WHERE p.id = pv.pais_id
      AND v.id = pv.vecino_id
  )
)
ORDER BY 1;
GO


--Poner al derecho los nombres de países que estén puestos al revés. 
--Son los que llevan una coma en medio del nombre.


CREATE PROCEDURE CorregirPaises AS
SELECT pais,
  TRIM(CONCAT(
    SUBSTRING(pais, CHARINDEX(',', pais) + 1, LEN(pais)),
    ' ',
    SUBSTRING(pais, 1, CHARINDEX(',', pais) - 1)
  )) AS pais2
FROM paises
WHERE pais LIKE '%,%'
GO



--Extraer los nombres de los países que tengan dos nombres. 
--Son aquellos que tienen paréntesis en el nombre.

CREATE PROCEDURE PaisesConDosNombres 
AS
SELECT pais,
  TRIM(
    SUBSTRING(pais, 1, CHARINDEX('(', pais) - 1)
  ) AS pais2,
  TRIM(REPLACE(
    SUBSTRING(pais, CHARINDEX('(', pais) + 1, CHARINDEX(')', pais) - CHARINDEX('(', pais) - 1),
    ')', ''
  )) AS pais3
FROM paises
WHERE pais LIKE '%(%)%'
GO

--Número de países de cada gobierno encolumnado por continentes

CREATE PROCEDURE GobiernosPorContinentes 
AS
SELECT 
  gobierno,
  SUM(CASE WHEN continente = 'Africa' THEN 1 ELSE 0 END) africa,
  SUM(CASE WHEN continente = 'América' THEN 1 ELSE 0 END) america,
  SUM(CASE WHEN continente = 'Asia' THEN 1 ELSE 0 END) asia,
  SUM(CASE WHEN continente = 'Europa' THEN 1 ELSE 0 END) europa,
  SUM(CASE WHEN continente = 'Oceanía' THEN 1 ELSE 0 END) oceania,
  COUNT(*) total
FROM paises p 
  INNER JOIN gobiernos g ON p.gobierno_id = g.id
  INNER JOIN continentes c ON p.continente_id = c.id
GROUP BY gobierno
ORDER BY COUNT(*) DESC
GO


--Países limítrofes a Francia y Alemania al mismo tiempo
/*
SELECT pais 
FROM paises
WHERE id IN (
  SELECT vecino_id
  FROM paises p INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  WHERE pais = 'Alemania')
AND id IN (
  SELECT vecino_id
  FROM paises p INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  WHERE pais = 'Francia')
  */

  -- Para ingresar dos paises 
  CREATE PROCEDURE PaisesLimitrofesA2AlMismoTiempo
  AS
DECLARE @pais1 NVARCHAR(50);
DECLARE @pais2 NVARCHAR(50);

SELECT pais 
FROM paises
WHERE id IN (
  SELECT vecino_id
  FROM paises p INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  WHERE pais = @pais1
)
AND id IN (
  SELECT vecino_id
  FROM paises p INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  WHERE pais = @pais2
);
GO

  --Países limítrofes a Francia o Alemania indistintamente



  CREATE PROCEDURE PaisesLimitrofesA2Indistintos
  AS
DECLARE @pais1 NVARCHAR(50);
DECLARE @pais2 NVARCHAR(50);

SELECT pais 
FROM paises
WHERE id IN (
  SELECT vecino_id
  FROM paises p INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  WHERE pais IN (@pais1, @pais2)
) 
AND pais NOT IN (@pais1, @pais2);
GO



--Países limítrofes con Asia
CREATE PROCEDURE PaisesFronteraConAsia
AS
SELECT pais 
FROM paises p INNER JOIN continentes c ON p.continente_id = c.id
WHERE p.id IN (
  SELECT vecino_id
  FROM paises p2
    INNER JOIN paises_vecinos pv2 ON p2.id = pv2.pais_id
    INNER JOIN continentes c2 ON p2.continente_id = c2.id
  WHERE continente = 'Asia'
) 
AND continente <> 'Asia'
ORDER BY pais
GO


--Países con un tamaño parecido al de España. Una diferencia no mayor del 5%.


CREATE PROCEDURE PaisesSimilaresASpain
AS
SELECT pais, 
  FORMAT(CONVERT(NUMERIC(15, 5), extension), '0') AS extension,
  FORMAT(CONVERT(NUMERIC(15, 5), referencia - extension), '0') AS diferencia, 
  FORMAT(((referencia - extension) / referencia) * 100, '0.00') AS porcentaje
FROM (  
  SELECT pais, extension,
    (SELECT extension FROM paises WHERE pais = 'España') AS referencia
  FROM paises
  WHERE extension IS NOT NULL
) a
WHERE ABS(referencia - extension) / referencia <= 0.05
ORDER BY ABS(referencia - extension);
GO



--Comparar el número de veces que cada país es mayor que España en cuanto extensión y población


CREATE PROCEDURE VecesMasGrandesQueSpain 
AS
SELECT pais,
  FORMAT(CONVERT(NUMERIC(38, 15), extension) / CONVERT(NUMERIC(38, 15), mi_extension), '0.00') AS "Veces el tamaño de España",
  FORMAT(CONVERT(NUMERIC(38, 0), poblacion) / CONVERT(NUMERIC(38, 0), mi_poblacion), '0.00') AS "Veces la población de España"
FROM (  
  SELECT pais, extension, poblacion,
    (SELECT extension FROM paises WHERE pais = 'España') AS mi_extension,
    (SELECT poblacion FROM paises WHERE pais = 'España') AS mi_poblacion
  FROM paises
  WHERE extension IS NOT NULL 
    AND poblacion IS NOT NULL
) a
WHERE (CONVERT(NUMERIC(38, 15), extension) / CONVERT(NUMERIC(38, 15), mi_extension) >= 0) 
  OR (CONVERT(NUMERIC(38, 0), poblacion) / CONVERT(NUMERIC(38, 0), mi_poblacion) >= 0)
ORDER BY (CONVERT(NUMERIC(38, 15), extension) / CONVERT(NUMERIC(38, 15), mi_extension)) + 
         (CONVERT(NUMERIC(38, 0), poblacion) / CONVERT(NUMERIC(38, 0), mi_poblacion)) DESC;
GO


--Datos representativos de Italia incluyendo continente, gobierno, idiomas y países vecinos

SELECT p.pais, p.capital, p.poblacion, p.extension, c.continente, g.gobierno, i.idioma, v.pais vecino
FROM paises p
  LEFT JOIN continentes c ON p.continente_id = c.id
  LEFT JOIN gobiernos g ON p.gobierno_id = g.id
  LEFT JOIN paises_idiomas pi ON pi.pais_id = p.id LEFT JOIN idiomas i ON pi.idioma_id = i.id
  LEFT JOIN paises_vecinos pv ON pv.pais_id = p.id LEFT JOIN paises v ON pv.vecino_id = v.id
WHERE p.pais = 'Italia'
GO

CREATE PROCEDURE CaracteristicasPais
AS
DECLARE @pais_variable VARCHAR(35) = 'Brasil'; -- Puedes cambiar 'Italia' por el país que desees

SELECT p.pais, p.capital, p.poblacion, p.extension, c.continente, g.gobierno, i.idioma, v.pais vecino
FROM paises p
  LEFT JOIN continentes c ON p.continente_id = c.id
  LEFT JOIN gobiernos g ON p.gobierno_id = g.id
  LEFT JOIN paises_idiomas pi ON pi.pais_id = p.id 
  LEFT JOIN idiomas i ON pi.idioma_id = i.id
  LEFT JOIN paises_vecinos pv ON pv.pais_id = p.id 
  LEFT JOIN paises v ON pv.vecino_id = v.id
WHERE p.pais = @pais_variable;
GO



SELECT p.id, pais, capital, poblacion, extension, continente, gobierno
FROM paises p
  LEFT JOIN continentes c ON p.continente_id = c.id
  LEFT JOIN gobiernos g ON p.gobierno_id = g.id
WHERE pais = 'Italia';
SELECT pais vecino
FROM paises_vecinos pv
  LEFT JOIN paises v ON pv.vecino_id = v.id  
WHERE pv.pais_id = (SELECT id FROM paises WHERE pais = 'Italia');
SELECT idioma
FROM paises_idiomas pi 
  LEFT JOIN idiomas i ON pi.idioma_id = i.id  
WHERE pi.pais_id = (SELECT id FROM paises WHERE pais = 'Italia');
GO

--Países que incluyen el texto "lon" en el nombre, o en la capital o en el gobierno

CREATE PROCEDURE PaisesConLon AS
SELECT pais, capital, gobierno, poblacion, extension, patron, 
  CHARINDEX(REPLACE(patron, '%', ''), CONCAT(pais, capital, gobierno)) posicion
FROM paises p 
INNER JOIN gobiernos g ON p.gobierno_id = g.id
CROSS JOIN (SELECT '%lon%' patron) parametros
WHERE pais LIKE patron
  OR capital LIKE patron
  OR gobierno LIKE patron
ORDER BY 7, 1;
GO



-- Países que incluyen el texto "lon" o "mar" en el nombre o en la capital
CREATE PROCEDURE PaisesConLonOMar AS
SELECT pais, capital, poblacion, extension, patron,
  CHARINDEX(REPLACE(patron, '%', ''), CONCAT(pais, capital)) as posicion
FROM paises
CROSS JOIN (SELECT '%lon%' patron UNION SELECT '%mar%') parametros
WHERE pais LIKE patron
  OR capital LIKE patron
ORDER BY 6, 1;
GO


-- Países que contengan al mismo tiempo el texto "sa" y "ta" en el nombre del país

CREATE PROCEDURE PaisesConSAyTAenNombre
AS
SELECT pais, capital, patron1, patron2,
  CHARINDEX(REPLACE(patron1, '%', ''), pais) +
  CHARINDEX(REPLACE(patron2, '%', ''), pais) peso
FROM paises
CROSS JOIN (SELECT '%sa%' patron1, '%ta%' patron2) parametros
WHERE pais LIKE patron1 
  AND pais LIKE patron2
ORDER BY 5, 1;
GO


--Países con una población de 5 millones de habitantes con una desviación máxima del 10%
CREATE PROCEDURE PaisesCon5MillYDesviacion10
AS
SELECT pais, capital, poblacion, habitantes, desviacion, 
  ABS(poblacion - habitantes) / poblacion * 100 peso
FROM paises,
  (SELECT 5000000 habitantes, 10 desviacion) parametros
WHERE 
  poblacion BETWEEN habitantes * (1 - desviacion / 100) AND habitantes * (1 + desviacion / 100)
ORDER BY 6, 1
GO


--Comparar la población y la superficie de cada continente con el total del planeta Tierra

/*
SELECT continente, 
  FORMAT(poblacion, 0) total_poblacion, 
  FORMAT(poblacion / (SELECT SUM(poblacion) FROM paises) * 100, 2) porcentaje_poblacion,
  FORMAT(superficie, 0) total_superficie,
  FORMAT(superficie / (SELECT SUM(extension) FROM paises) * 100, 2) porcentaje_superficie
FROM (
  SELECT continente, 
    SUM(poblacion) poblacion,
    SUM(extension) superficie
  FROM paises p INNER JOIN continentes c ON p.continente_id = c.id
  GROUP BY continente
) a
ORDER BY poblacion DESC
*/




--Países a los que les falta alguno de estos campos: 
--capital, población, extensión, costa, gobierno o continente
CREATE PROCEDURE PaisesConCamposFaltantes AS
WITH CamposFaltantes AS (
  SELECT pais, 
    CONCAT_WS(', ',
      CASE WHEN capital IS NULL THEN 'capital' ELSE NULL END,
      CASE WHEN poblacion IS NULL THEN 'población' ELSE NULL END,
      CASE WHEN extension IS NULL THEN 'extensión'  ELSE NULL END,
      CASE WHEN costa IS NULL THEN 'costa' ELSE NULL END,
      CASE WHEN gobierno IS NULL THEN 'gobierno' ELSE NULL END,
      CASE WHEN continente IS NULL THEN 'continente' ELSE NULL END
    ) AS numero_campos_faltan
  FROM paises p
    LEFT JOIN gobiernos g ON p.gobierno_id = g.id
    LEFT JOIN continentes c ON p.continente_id = c.id
)
SELECT *
FROM CamposFaltantes
WHERE numero_campos_faltan IS NOT NULL
ORDER BY numero_campos_faltan DESC, pais;
GO


/*   Este no se pudo hacer 
--Comparar la población y extensión de cada pais con el total del continente donde se ubica.
--Ordenar los datos de más a menos significativos.

SELECT CONCAT(pais, ' / ', continente) pais_continente,
  FORMAT(poblacion / poblacion_continente * 100, 2) porcentaje_poblacion,
  FORMAT(extension / extension_continente * 100, 2) porcentaje_extension  
FROM paises INNER JOIN (
    SELECT continente_id, continente, 
      SUM(poblacion) poblacion_continente,
      SUM(extension) extension_continente
    FROM paises p INNER JOIN continentes c ON p.continente_id = c.id
    GROUP BY continente
  ) c 
  on paises.continente_id = c.continente_id
ORDER BY poblacion / poblacion_continente + extension / extension_continente 

*/

--PROCEDIMIENTOS ELIMINAR
CREATE PROCEDURE eliminarPais
    @id INT
AS
BEGIN
    -- Eliminar registros en Paises_Idiomas relacionados con el país
    DELETE FROM Paises_Idiomas
    WHERE pais_id = @id;

    -- Eliminar registros en Paises_Vecinos relacionados con el país
    DELETE FROM Paises_Vecinos
    WHERE pais_id = @id or vecino_id = @id;

    -- Eliminar el país en sí
    DELETE FROM Paises
    WHERE id = @id;
END;
GO

CREATE PROCEDURE eliminarIdioma
    @id INT
AS
BEGIN
    -- Eliminar registros en Paises_Idiomas relacionados con el idioma
    DELETE FROM Paises_Idiomas
    WHERE idioma_id = @id;

	-- Eliminar el idioma
    DELETE FROM Idiomas
    WHERE Idiomas.id = @id;
END;
GO

CREATE PROCEDURE eliminarContinente
    @continente_id INT
AS
BEGIN

	-- Eliminar registros en la tabla Paises_Idiomas relacionados con el continente
    DELETE FROM Paises_Idiomas
    WHERE pais_id IN (SELECT id FROM Paises WHERE continente_id = @continente_id);

	-- Eliminar registros en la tabla Paises_Vecinos relacionados con el continente
    DELETE FROM Paises_Vecinos
    WHERE pais_id IN (SELECT id FROM Paises WHERE continente_id = @continente_id) or vecino_id IN (SELECT id FROM Paises WHERE continente_id = @continente_id);

    -- Eliminar registros en la tabla Paises relacionados con el continente
    DELETE FROM Paises
    WHERE continente_id = @continente_id;

    -- Eliminar el continente en sí
    DELETE FROM Continentes
    WHERE id = @continente_id;
END;
GO

CREATE PROCEDURE eliminarGobierno
    @gobierno_id INT
AS
BEGIN
    -- Eliminar registros en la tabla Paises relacionados con el gobierno
    DELETE FROM Paises
    WHERE gobierno_id = @gobierno_id;

    -- Eliminar el gobierno en sí
    DELETE FROM Gobiernos
    WHERE id = @gobierno_id;
END;
GO


----CREACION DE TRIGGERS PARA LA TABLA AuditoriaTablas
-- Crear tabla AuditoriaTablas
CREATE TABLE dbo.AuditoriaTablas (
    idAuditoria INT IDENTITY(1,1) PRIMARY KEY,
	Tipo VARCHAR(10),
    Tabla VARCHAR(20),
	Registro INT,
    Campo VARCHAR(50),
    ValorAntes VARCHAR(50),
    ValorDespues VARCHAR(50),
    Fecha DATETIME
);
GO

-- Crear un trigger para la inserción de registros en la tabla Continentes
CREATE TRIGGER trContinentesInsert
ON dbo.Continentes
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Continentes', 'id', NULL, inserted.id, GETDATE(), 'Insert', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Continentes', 'continente', NULL, inserted.continente, GETDATE(), 'Insert', inserted.id
    FROM inserted;
END;
GO
-- Crear un trigger para la eliminación de registros en la tabla Continentes
CREATE TRIGGER trContinentesDelete
ON dbo.Continentes
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Continentes', 'id', deleted.id, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Continentes', 'continente', deleted.continente, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;
END;
GO
-- Crear un trigger para la actualización de registros en la tabla Continentes
CREATE TRIGGER trContinentesUpdate
ON dbo.Continentes
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la actualización en la tabla de auditoría solo para campos que han cambiado
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Continentes', 'id', deleted.id, inserted.id, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.id <> inserted.id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Continentes', 'continente', deleted.continente, inserted.continente, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.continente <> inserted.continente;
END;
GO
-- Crear un trigger para la inserción de registros en la tabla Gobiernos
CREATE TRIGGER trGobiernosInsert
ON dbo.Gobiernos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Gobiernos', 'id', NULL, inserted.id, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Gobiernos', 'gobierno', NULL, inserted.gobierno, GETDATE(), 'I', inserted.id
    FROM inserted;
END;
GO
-- Crear un trigger para la eliminación de registros en la tabla Gobiernos
CREATE TRIGGER trGobiernosDelete
ON dbo.Gobiernos
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Gobiernos', 'id', deleted.id, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Gobiernos', 'gobierno', deleted.gobierno, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;
END;
GO
-- Crear un trigger para la actualización de registros en la tabla Gobiernos
CREATE TRIGGER trGobiernosUpdate
ON dbo.Gobiernos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la actualización en la tabla de auditoría solo para campos que han cambiado
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Gobiernos', 'id', deleted.id, inserted.id, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.id <> inserted.id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Gobiernos', 'gobierno', deleted.gobierno, inserted.gobierno, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.gobierno <> inserted.gobierno;
END;
GO
-- Crear un trigger para la inserción de registros en la tabla Idiomas
CREATE TRIGGER trIdiomasInsert
ON dbo.Idiomas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Idiomas', 'id', NULL, inserted.id, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Idiomas', 'idioma', NULL, inserted.idioma, GETDATE(), 'I', inserted.id
    FROM inserted;
END;
GO
-- Crear un trigger para la eliminación de registros en la tabla Idiomas
CREATE TRIGGER trIdiomasDelete
ON dbo.Idiomas
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Idiomas', 'id', deleted.id, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Idiomas', 'idioma', deleted.idioma, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;
END;
GO
-- Crear un trigger para la actualización de registros en la tabla Idiomas
CREATE TRIGGER trIdiomasUpdate
ON dbo.Idiomas
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la actualización en la tabla de auditoría solo para campos que han cambiado
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Idiomas', 'id', deleted.id, inserted.id, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.id <> inserted.id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Idiomas', 'idioma', deleted.idioma, inserted.idioma, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.idioma <> inserted.idioma;
END;
GO
-- Crear un trigger para la inserción de registros en la tabla Paises
CREATE TRIGGER trPaisesInsert
ON dbo.Paises
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'id', NULL, inserted.id, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'pais', NULL, inserted.pais, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'capital', NULL, inserted.capital, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'moneda', NULL, inserted.moneda, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'continente_id', NULL, inserted.continente_id, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'gobierno_id', NULL, inserted.gobierno_id, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'poblacion', NULL, inserted.poblacion, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'extension', NULL, inserted.extension, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'posicion', NULL, inserted.posicion, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'existe', NULL, inserted.existe, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'costa', NULL, inserted.costa, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'country', NULL, inserted.country, GETDATE(), 'I', inserted.id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'code', NULL, inserted.code, GETDATE(), 'I', inserted.id
    FROM inserted;
END;
GO
-- Crear un trigger para la eliminación de registros en la tabla Paises
CREATE TRIGGER trPaisesDelete
ON dbo.Paises
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'id', deleted.id, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'pais', deleted.pais, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'capital', deleted.capital, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'moneda', deleted.moneda, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'continente_id', CAST(deleted.continente_id AS VARCHAR), NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'gobierno_id', CAST(deleted.gobierno_id AS VARCHAR), NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'poblacion', CAST(deleted.poblacion AS VARCHAR), NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'extension', CAST(deleted.extension AS VARCHAR), NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'posicion', deleted.posicion, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'existe', CAST(deleted.existe AS VARCHAR), NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'costa', CAST(deleted.costa AS VARCHAR), NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'country', deleted.country, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'code', deleted.code, NULL, GETDATE(), 'D', deleted.id
    FROM deleted;
END;
GO
-- Crear un trigger para la actualización de registros en la tabla Paises
CREATE TRIGGER trPaisesUpdate
ON dbo.Paises
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la actualización en la tabla de auditoría solo para campos que han cambiado
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'id', deleted.id, inserted.id, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.id <> inserted.id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'pais', deleted.pais, inserted.pais, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.pais <> inserted.pais;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'capital', deleted.capital, inserted.capital, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.capital <> inserted.capital;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises', 'moneda', deleted.moneda, inserted.moneda, GETDATE(), 'U', inserted.id
    FROM deleted
    INNER JOIN inserted ON deleted.id = inserted.id
    WHERE deleted.moneda <> inserted.moneda;

	-- Agregar el bloque para el campo 'continente_id'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'continente_id', CAST(deleted.continente_id AS VARCHAR), CAST(inserted.continente_id AS VARCHAR), GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.continente_id <> inserted.continente_id;

	-- Agregar el bloque para el campo 'gobierno_id'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'gobierno_id', CAST(deleted.gobierno_id AS VARCHAR), CAST(inserted.gobierno_id AS VARCHAR), GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.gobierno_id <> inserted.gobierno_id;

	-- Agregar el bloque para el campo 'poblacion'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'poblacion', CAST(deleted.poblacion AS VARCHAR), CAST(inserted.poblacion AS VARCHAR), GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.poblacion <> inserted.poblacion;

	-- Agregar el bloque para el campo 'extension'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'extension', CAST(deleted.extension AS VARCHAR), CAST(inserted.extension AS VARCHAR), GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.extension <> inserted.extension;

	-- Agregar el bloque para el campo 'posicion'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'posicion', deleted.posicion, inserted.posicion, GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.posicion <> inserted.posicion;

	-- Agregar el bloque para el campo 'existe'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'existe', CAST(deleted.existe AS VARCHAR), CAST(inserted.existe AS VARCHAR), GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.existe <> inserted.existe;

	-- Agregar el bloque para el campo 'costa'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'costa', CAST(deleted.costa AS VARCHAR), CAST(inserted.costa AS VARCHAR), GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.costa <> inserted.costa;

	-- Agregar el bloque para el campo 'country'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'country', deleted.country, inserted.country, GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.country <> inserted.country;

	-- Agregar el bloque para el campo 'code'
	INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
	SELECT 'dbo.Paises', 'code', deleted.code, inserted.code, GETDATE(), 'U', inserted.id
	FROM deleted
	INNER JOIN inserted ON deleted.id = inserted.id
	WHERE deleted.code <> inserted.code;
END;
GO
-- Crear un trigger para la inserción de registros en la tabla Paises_Idiomas
CREATE TRIGGER trPaisesIdiomasInsert
ON dbo.Paises_Idiomas
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'pais_id', NULL, inserted.pais_id, GETDATE(), 'I', inserted.pais_id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'idioma_id', NULL, inserted.idioma_id, GETDATE(), 'I', inserted.pais_id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'hablantes', NULL, inserted.hablantes, GETDATE(), 'I', inserted.pais_id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'porcentaje', NULL, inserted.porcentaje, GETDATE(), 'I', inserted.pais_id
    FROM inserted;
END;
GO
-- Trigger de eliminación para la tabla Paises_Idiomas
CREATE TRIGGER trPaisesIdiomasDelete
ON dbo.Paises_Idiomas
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la eliminación en la tabla de auditoría y eliminar registros correspondientes
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'pais_id', deleted.pais_id, NULL, GETDATE(), 'D', deleted.pais_id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'idioma_id', deleted.idioma_id, NULL, GETDATE(), 'D', deleted.pais_id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'hablantes', deleted.hablantes, NULL, GETDATE(), 'D', deleted.pais_id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'porcentaje', deleted.porcentaje, NULL, GETDATE(), 'D', deleted.pais_id
    FROM deleted;

    -- Eliminar los registros correspondientes en la tabla Paises_Idiomas
    DELETE pi
    FROM dbo.Paises_Idiomas pi
    INNER JOIN deleted ON pi.pais_id = deleted.pais_id AND pi.idioma_id = deleted.idioma_id;
END;
GO
-- Crear un trigger para la actualización de registros en la tabla Paises_Idiomas
CREATE TRIGGER trPaisesIdiomasUpdate
ON dbo.Paises_Idiomas
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la actualización en la tabla de auditoría
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'pais_id', deleted.pais_id, inserted.pais_id, GETDATE(), 'U', inserted.pais_id
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.idioma_id = inserted.idioma_id
    WHERE deleted.pais_id <> inserted.pais_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'idioma_id', deleted.idioma_id, inserted.idioma_id, GETDATE(), 'U', inserted.pais_id
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.idioma_id = inserted.idioma_id
    WHERE deleted.idioma_id <> inserted.idioma_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'hablantes', deleted.hablantes, inserted.hablantes, GETDATE(), 'U', inserted.pais_id
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.idioma_id = inserted.idioma_id
    WHERE deleted.hablantes <> inserted.hablantes;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'porcentaje', deleted.porcentaje, inserted.porcentaje, GETDATE(), 'U', inserted.pais_id
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.idioma_id = inserted.idioma_id
    WHERE deleted.porcentaje <> inserted.porcentaje;
END;
GO
-- Crear un trigger para la inserción de registros en la tabla Paises_Vecinos
CREATE TRIGGER trPaisesVecinosInsert
ON dbo.Paises_Vecinos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la inserción en la tabla de auditoría
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'pais_id', NULL, inserted.pais_id, GETDATE(), 'I', inserted.pais_id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'vecino_id', NULL, inserted.vecino_id, GETDATE(), 'I', inserted.pais_id
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'kms_frontera', NULL, inserted.kms_frontera, GETDATE(), 'I', inserted.pais_id
    FROM inserted;
END;
GO
-- Crear un trigger para la eliminación de registros en la tabla Paises_Vecinos
CREATE TRIGGER trPaisesVecinosDelete
ON dbo.Paises_Vecinos
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la eliminación en la tabla de auditoría y eliminar registros correspondientes
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'pais_id', deleted.pais_id, NULL, GETDATE(), 'D', deleted.pais_id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'vecino_id', deleted.vecino_id, NULL, GETDATE(), 'D', deleted.pais_id
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'kms_frontera', deleted.kms_frontera, NULL, GETDATE(), 'D', deleted.pais_id
    FROM deleted;

    -- Eliminar los registros correspondientes en la tabla Paises_Vecinos
    DELETE pv
    FROM dbo.Paises_Vecinos pv
    INNER JOIN deleted ON pv.pais_id = deleted.pais_id AND pv.vecino_id = deleted.vecino_id;
END;
GO
-- Crear un trigger para la actualización de registros en la tabla Paises_Vecinos
CREATE TRIGGER trPaisesVecinosUpdate
ON dbo.Paises_Vecinos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar información de la actualización en la tabla de auditoría
    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'pais_id', deleted.pais_id, inserted.pais_id, GETDATE(), 'U', inserted.pais_id
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.vecino_id = inserted.vecino_id
    WHERE deleted.pais_id <> inserted.pais_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'vecino_id', deleted.vecino_id, inserted.vecino_id, GETDATE(), 'U', inserted.pais_id
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.vecino_id = inserted.vecino_id
    WHERE deleted.vecino_id <> inserted.vecino_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'kms_frontera', deleted.kms_frontera, inserted.kms_frontera, GETDATE(), 'U', inserted.pais_id
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.vecino_id = inserted.vecino_id
    WHERE deleted.kms_frontera <> inserted.kms_frontera;
END;
GO