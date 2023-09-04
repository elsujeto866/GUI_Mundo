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
--SELECT * FROM Continentes

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
--SELECT * FROM Continentes

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
    ('Indonesia', 'Yakarta', 'Rupia indonesia', 1, 1, 273523615, 1.904569, 'Sureste de Asia', 1, 'Indonesia', 'ID'),
    ('España', 'Madrid', 'Euro', 4, 1, 46754778, 505992.91, 'Europa del Sur', 1,'Spain', 'ES'),
	('Suecia', 'Estocolmo', 'Corona sueca', 4, 9, 10379295, 0.450295, 'Europa del Norte', 1, 'Sweden', 'SE'),
    ('Nueva Guinea', 'Puerto Moresby', 'Kina', 5, 10, 8947024, 0.462840, 'Oceanía', 1, 'Papua New Guinea', 'PG'),
    ('Argelia', 'Argel', 'Dinar argelino', 2, 3, 43851044, 2.381741, 'África del Norte', 1, 'Algeria', 'DZ'),
    ('Jamaica', 'Kingston', 'Dólar jamaicano', 3, 1, 2961161, 0.109911, 'Caribe', 1, 'Jamaica', 'JM'),
	('Colombia', 'Bogotá', 'Peso colombiano', 3, 1, 50882891, 1.141748, 'América del Sur', 2, 'Colombia', 'CO'),
    ('Perú', 'Lima', 'Nuevo sol', 3, 1, 32971854, 1.285216, 'América del Sur', 3, 'Peru', 'PE'),
    ('Venezuela', 'Caracas', 'Bolívar soberano', 3, 2, 28435943, 0.916445, 'América del Sur', 3, 'Venezuela', 'VE'),
    ('Túnez', 'Túnez', 'Dinar tunecino', 2, 1, 11818619, 163610.00, 'África del Norte', 1,  'Tunisia', 'TN'),
    ('Noruega', 'Oslo', 'Corona noruega', 4, 1, 5367580, 323802.00, 'Europa del Norte', 1,'Norway', 'NO');
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
    (30, 9, 200000, 0.01);
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
	(30, 22, 1619);  -- Noruega - Suecia
GO
--Cargar Paises
CREATE PROC CargarPaises
AS
BEGIN
SELECT p.pais, p.capital, p.moneda, c.continente,g.gobierno,p.posicion,p.code
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
EXEC FronterasXPais @nombrePais = 'Brasil'; -- Busco Alemania
GO


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
    SELECT 'dbo.Paises_Idiomas', 'pais_id', NULL, inserted.pais_id, GETDATE(), 'I', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'idioma_id', NULL, inserted.idioma_id, GETDATE(), 'I', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'hablantes', NULL, inserted.hablantes, GETDATE(), 'I', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'porcentaje', NULL, inserted.porcentaje, GETDATE(), 'I', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
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
    SELECT 'dbo.Paises_Idiomas', 'pais_id', deleted.pais_id, NULL, GETDATE(), 'D', CONCAT(deleted.pais_id, '-', deleted.idioma_id)
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'idioma_id', deleted.idioma_id, NULL, GETDATE(), 'D', CONCAT(deleted.pais_id, '-', deleted.idioma_id)
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'hablantes', deleted.hablantes, NULL, GETDATE(), 'D', CONCAT(deleted.pais_id, '-', deleted.idioma_id)
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'porcentaje', deleted.porcentaje, NULL, GETDATE(), 'D', CONCAT(deleted.pais_id, '-', deleted.idioma_id)
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
    SELECT 'dbo.Paises_Idiomas', 'pais_id', deleted.pais_id, inserted.pais_id, GETDATE(), 'U', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.idioma_id = inserted.idioma_id
    WHERE deleted.pais_id <> inserted.pais_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'idioma_id', deleted.idioma_id, inserted.idioma_id, GETDATE(), 'U', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.idioma_id = inserted.idioma_id
    WHERE deleted.idioma_id <> inserted.idioma_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'hablantes', deleted.hablantes, inserted.hablantes, GETDATE(), 'U', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.idioma_id = inserted.idioma_id
    WHERE deleted.hablantes <> inserted.hablantes;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Idiomas', 'porcentaje', deleted.porcentaje, inserted.porcentaje, GETDATE(), 'U', CONCAT(inserted.pais_id, '-', inserted.idioma_id)
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
    SELECT 'dbo.Paises_Vecinos', 'pais_id', NULL, inserted.pais_id, GETDATE(), 'I', CONCAT(inserted.pais_id, '-', inserted.vecino_id)
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'vecino_id', NULL, inserted.vecino_id, GETDATE(), 'I', CONCAT(inserted.pais_id, '-', inserted.vecino_id)
    FROM inserted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'kms_frontera', NULL, inserted.kms_frontera, GETDATE(), 'I', CONCAT(inserted.pais_id, '-', inserted.vecino_id)
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
    SELECT 'dbo.Paises_Vecinos', 'pais_id', deleted.pais_id, NULL, GETDATE(), 'D', CONCAT(deleted.pais_id, '-', deleted.vecino_id)
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'vecino_id', deleted.vecino_id, NULL, GETDATE(), 'D', CONCAT(deleted.pais_id, '-', deleted.vecino_id)
    FROM deleted;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'kms_frontera', deleted.kms_frontera, NULL, GETDATE(), 'D', CONCAT(deleted.pais_id, '-', deleted.vecino_id)
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
    SELECT 'dbo.Paises_Vecinos', 'pais_id', deleted.pais_id, inserted.pais_id, GETDATE(), 'U', CONCAT(inserted.pais_id, '-', inserted.vecino_id)
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.vecino_id = inserted.vecino_id
    WHERE deleted.pais_id <> inserted.pais_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'vecino_id', deleted.vecino_id, inserted.vecino_id, GETDATE(), 'U', CONCAT(inserted.pais_id, '-', inserted.vecino_id)
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.vecino_id = inserted.vecino_id
    WHERE deleted.vecino_id <> inserted.vecino_id;

    INSERT INTO dbo.AuditoriaTablas (Tabla, Campo, ValorAntes, ValorDespues, Fecha, Tipo, Registro)
    SELECT 'dbo.Paises_Vecinos', 'kms_frontera', deleted.kms_frontera, inserted.kms_frontera, GETDATE(), 'U', CONCAT(inserted.pais_id, '-', inserted.vecino_id)
    FROM deleted
    INNER JOIN inserted ON deleted.pais_id = inserted.pais_id AND deleted.vecino_id = inserted.vecino_id
    WHERE deleted.kms_frontera <> inserted.kms_frontera;
END;
GO