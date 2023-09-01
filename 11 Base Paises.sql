/*Unique key (UK) acepta valor nulo la primera vez, mientras que el Primary key (PK) no puede ser nulo.
Se pueden tener varios UK, pero una sola PK. Aunque la PK pueda estar conformada por varios atributos, siempre será una sola PK.
Si bien es cierto que se pueden hacer Foreign Keys referenciando a cualquier atributo, sin importar si son PK, UK o cualquier otro, la mejor práctica es hacerlo referenciando a un PK, por concepto de normalización, donde una PK es usada para identificar a cada tupla, mientras que la UK es 
usada para impedir el duplicado de valores para un atributo.*/

USE master
go
if object_id('BD_Mundo') is not null
  DROP DATABASE BD_Mundo;
GO

CREATE DATABASE BD_Mundo;
GO

USE BD_Mundo;
GO

CREATE TABLE Continentes (
  id INT NOT NULL,
  continente VARCHAR(20) NOT NULL,
  --
  PRIMARY KEY (continente),
  UNIQUE (id)
) ;
GO

CREATE TABLE Gobiernos (
  id INT NOT NULL,
  gobierno VARCHAR(40) NOT NULL,
  --
  PRIMARY KEY (gobierno),
  UNIQUE  (id)
);
GO

CREATE TABLE idiomas (
  id INT NOT NULL,
  idioma VARCHAR(20) NOT NULL,
  --
  PRIMARY KEY (idioma),
  UNIQUE  (id)
);
GO

CREATE TABLE paises (
  id INT NOT NULL,
  pais VARCHAR(35) NOT NULL,
  capital VARCHAR(20),
  moneda VARCHAR(30),
  continente_id INT,
  gobierno_id INT,
  poblacion INT,
  extension DECIMAL(15,5),
  posicion VARCHAR(20),
  existe bit NOT NULL DEFAULT 1,
  costa INT DEFAULT 0,
  country VARCHAR(35),
  code VARCHAR(2),
  PRIMARY KEY (pais),
  UNIQUE  (id),
  FOREIGN KEY (continente_id) REFERENCES continentes(id),
  FOREIGN KEY (gobierno_id) REFERENCES gobiernos(id)
) ;
GO

CREATE TABLE paises_idiomas (
  pais_id INT NOT NULL,
  idioma_id INT NOT NULL,
  hablantes INT,
  porcentaje DECIMAL(15,5),
  --
  PRIMARY KEY (pais_id, idioma_id),
  FOREIGN KEY (pais_id) REFERENCES paises(id),
  FOREIGN KEY (idioma_id) REFERENCES idiomas(id)
) ;
GO

CREATE TABLE paises_vecinos (
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
INSERT INTO Continentes (id, continente)
VALUES
  (1, 'América'),
  (2, 'Europa'),
  (3, 'Asia'),
  (4, 'África'),
  (5, 'Oceanía');
GO

INSERT INTO Gobiernos (id, gobierno)
VALUES
  (1, 'Democracia'),
  (2, 'Monarquía'),
  (3, 'República'),
  (4, 'Dictadura'),
  (5, 'Teocracia'),
  (6, 'Monarquía Constitucional'),
  (7, 'Democracia Directa'),
  (8, 'República Parlamentaria'),
  (9, 'Dictadura Militar'),
  (10, 'Oligarquía');
GO

INSERT INTO idiomas (id, idioma)
VALUES
  (1, 'Español'),
  (2, 'Inglés'),
  (3, 'Francés'),
  (4, 'Alemán'),
  (5, 'Chino Mandarín'),
  (6, 'Italiano'),
  (7, 'Portugués'),
  (8, 'Ruso'),
  (9, 'Japonés'),
  (10, 'Árabe');
GO

INSERT INTO paises (id, pais, capital, moneda, continente_id, gobierno_id, poblacion, extension, posicion, costa, country, code)
VALUES
  (1, 'Estados Unidos', 'Washington, D.C.', 'Dólar estadounidense', 1, 1, 331002651, 9.8, 'Norteamérica', 3, 'United States', 'US'),
  (2, 'Brasil', 'Brasilia', 'Real brasileño', 1, 3, 212559417, 8.5, 'Sudamérica', 4, 'Brazil', 'BR'),
  (3, 'China', 'Pekín', 'Yuan renminbi', 3, 4, 1439323776, 9.6, 'Asia', 11, 'China', 'CN'),
  (4, 'Francia', 'París', 'Euro', 2, 3, 65273511, 0.551, 'Europa', 3, 'France', 'FR'),
  (5, 'Australia', 'Canberra', 'Dólar australiano', 5, 1, 25499884, 7.7, 'Oceanía', 25, 'Australia', 'AU'),
  (6, 'Alemania', 'Berlín', 'Euro', 2, 3, 83783942, 0.357, 'Europa', 2, 'Germany', 'DE'),
  (7, 'Japón', 'Tokio', 'Yen japonés', 3, 1, 126476461, 0.377, 'Asia', 6, 'Japan', 'JP'),
  (8, 'Egipto', 'El Cairo', 'Libra egipcia', 4, 4, 102334404, 1.001, 'África', 2, 'Egypt', 'EG'),
  (9, 'Canadá', 'Ottawa', 'Dólar canadiense', 1, 1, 37742154, 9.98, 'Norteamérica', 2, 'Canada', 'CA'),
  (10, 'Nueva Zelanda', 'Wellington', 'Dólar neozelandés', 5, 1, 4822233, 0.270, 'Oceanía', 15, 'New Zealand', 'NZ'),
  (11, 'México', 'Ciudad de México', 'Peso mexicano', 1, 3, 128932753, 1.964, 'Norteamérica', 3, 'Mexico', 'MX'),
  (12, 'India', 'Nueva Delhi', 'Rupia india', 3, 1, 1380004385, 3.287, 'Asia', 7, 'India', 'IN'),
  (13, 'Sudáfrica', 'Pretoria', 'Rand sudafricano', 4, 3, 59308690, 1.221, 'África', 2, 'South Africa', 'ZA'),
  (14, 'Italia', 'Roma', 'Euro', 2, 3, 60461826, 0.301, 'Europa', 7, 'Italy', 'IT'),
  (15, 'Argentina', 'Buenos Aires', 'Peso argentino', 1, 3, 45195777, 2.780, 'Sudamérica', 4, 'Argentina', 'AR'),
  (16, 'Rusia', 'Moscú', 'Rublo ruso', 3, 3, 145934462, 17.1, 'Europa/Asia', 37, 'Russia', 'RU'),
  (17, 'Kenia', 'Nairobi', 'Chelín keniano', 4, 3, 53771300, 0.580, 'África', 1, 'Kenya', 'KE'),
  (18, 'Corea del Sur', 'Seúl', 'Won surcoreano', 3, 1, 51269185, 0.100, 'Asia', 2, 'South Korea', 'KR'),
  (19, 'Colombia', 'Bogotá', 'Peso colombiano', 1, 3, 50882891, 1.141, 'Sudamérica', 3, 'Colombia', 'CO'),
  (20, 'Suecia', 'Estocolmo', 'Corona sueca', 2, 1, 10099265, 0.450, 'Europa', 3, 'Sweden', 'SE');
GO

INSERT INTO paises_idiomas (pais_id, idioma_id, hablantes, porcentaje)
VALUES
  (1, 1, 443960000, 13.4),
  (1, 2, 281200000, 8.5),
  (2, 1, 201480000, 94.9),
  (2, 3, 3710000, 1.7),
  (3, 4, 918000000, 64.0),
  (3, 5, 198700000, 13.8),
  (4, 1, 63000000, 97.2),
  (4, 3, 3940000, 6.1),
  (5, 1, 25000000, 98.0),
  (5, 2, 18500000, 72.4),
  (6, 1, 67250000, 95.7),
  (6, 3, 930000, 1.3),
  (7, 4, 125000000, 87.1),
  (7, 5, 145000000, 100.0),
  (8, 1, 84600000, 85.0),
  (8, 3, 1460000, 1.5),
  (9, 2, 18900000, 44.4),
  (9, 4, 1800000, 4.2),
  (10, 1, 4600000, 97.8),
  (10, 2, 3000000, 63.3),
  (11, 1, 125000000, 98.3),
  (11, 2, 2500000, 2.0),
  (12, 1, 1220000000, 87.7),
  (12, 3, 13000000, 0.9),
  (13, 2, 46000000, 43.9),
  (13, 1, 10000000, 9.5),
  (14, 1, 59400000, 97.6),
  (14, 2, 22600000, 37.2),
  (15, 1, 43000000, 95.0),
  (15, 3, 2070000, 4.6),
  (16, 1, 153000000, 85.4),
  (16, 3, 123000, 0.07),
  (17, 1, 82300000, 72.0),
  (17, 4, 4000000, 3.5),
  (18, 1, 5150000, 94.7),
  (18, 2, 370000, 6.8),
  (19, 2, 19000000, 42.0),
  (19, 4, 2300000, 5.1),
  (20, 1, 8900000, 88.2),
  (20, 2, 1500000, 14.9);
GO

INSERT INTO paises_vecinos (pais_id, vecino_id, kms_frontera)
VALUES
  (1, 2, 4047),
  (1, 3, 12887),
  (2, 1, 4047),
  (2, 4, 1566),
  (3, 1, 12887),
  (3, 4, 856),
  (3, 5, 2210),
  (4, 2, 1566),
  (4, 3, 856),
  (4, 5, 1691),
  (5, 3, 2210),
  (5, 4, 1691),
  (6, 7, 2380),
  (7, 6, 2380),
  (8, 9, 2258),
  (9, 8, 2258),
  (10, 11, 3141),
  (11, 10, 3141),
  (12, 13, 1690),
  (13, 12, 1690),
  (14, 15, 5130),
  (15, 14, 5130);
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

-- Prueba de FronterasPais
--EXEC FronterasPais @nombrePais = 'Brasil'; -- Busco Alemania



--Países fronterizos a cada país
CREATE PROCEDURE FronterasTodosPaises
AS
SELECT p.Pais, STRING_AGG (v.pais  , ', ')  as Vecinos
FROM paises p 
  INNER JOIN paises_vecinos pv ON p.id = pv.pais_id 
  INNER JOIN paises v ON pv.vecino_id = v.id
GROUP BY p.pais
ORDER BY 1;


--Idiomas que se habla en cada país
CREATE PROCEDURE IdiomasPaises
AS
SELECT p.Pais, STRING_AGG(i.idioma ,', ') as Idiomas
FROM paises p 
  INNER JOIN paises_idiomas pi ON p.id = pi.pais_id 
  INNER JOIN idiomas i ON pi.idioma_id = i.id
GROUP BY p.Pais	
ORDER BY 1;


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


SELECT pais, FORMAT(poblacion,0) habitantes
FROM paises
WHERE poblacion >= (
  SELECT MIN(poblacion)
  FROM paises 
  WHERE extension >= 5000000
)
ORDER BY pais


--Países con más países limítrofes que sus vecinos
go
CREATE VIEW paises2 AS
  SELECT id, pais, COUNT(*) num_vecinos
  FROM paises p INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  GROUP BY pais;
  go

SELECT pais, num_vecinos
FROM paises2 p  
WHERE num_vecinos > ALL (
  SELECT v.num_vecinos
  FROM paises_vecinos pv INNER JOIN paises2 v ON pv.vecino_id = v.id
  WHERE p.id = pv.pais_id)
ORDER BY 1

SELECT p.pais, p.num_vecinos
FROM paises2 p 
  INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  INNER JOIN paises2 v ON pv.vecino_id = v.id
WHERE p.num_vecinos > v.num_vecinos
GROUP BY 1, 2
HAVING p.num_vecinos = COUNT(*)
ORDER BY 1

--Países con más población que sus países vecinos

SELECT pais, FORMAT(poblacion,0) habitantes
FROM paises p
WHERE poblacion > ALL (
  SELECT poblacion
  FROM paises_vecinos pv INNER JOIN paises v ON pv.vecino_id = v.id
  WHERE p.id = pv.pais_id)
AND EXISTS (
  SELECT 1 
  FROM paises_vecinos pv2 
  WHERE p.id = pv2.pais_id)
ORDER BY 1


--Poner al derecho los nombres de países que estén puestos al revés. 
--Son los que llevan una coma en medio del nombre.

SELECT pais, 
  TRIM(CONCAT(
    SUBSTRING(pais FROM LOCATE(',', pais) + 1), 
    ' ', 
    SUBSTRING(pais FROM  LOCATE(',', pais) - 1)
  )) pais2
FROM paises
WHERE pais LIKE '%,%'

--Extraer los nombres de los países que tengan dos nombres. 
--Son aquellos que tienen paréntesis en el nombre.

SELECT pais,
  TRIM(
    SUBSTRING(pais FROM LOCATE('(', pais) - 1)
  ) pais2,
  TRIM(REPLACE(
    SUBSTRING(pais FROM LOCATE('(', pais) + 1),
  ')', '')) pais3
FROM paises
WHERE pais LIKE '%(%)%'

--Número de países de cada gobierno encolumnado por continentes

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

--Países limítrofes a Francia y Alemania al mismo tiempo

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

  --Países limítrofes a Francia o Alemania indistintamente

SELECT pais 
FROM paises
WHERE id IN (
  SELECT vecino_id
  FROM paises p INNER JOIN paises_vecinos pv ON p.id = pv.pais_id
  WHERE pais IN ('Alemania', 'Francia')
) 
AND pais NOT IN ('Alemania', 'Francia')

--Países limítrofes con Asia

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

--Países con un tamaño parecido al de España. Una diferencia no mayor del 5%.

SELECT pais, 
  FORMAT(extension, 0) extension,
  FORMAT(referencia - extension, 0) diferencia, 
  FORMAT((referencia - extension) / referencia * 100, 2) porcentaje
FROM (  
  SELECT pais, extension,
    (SELECT extension FROM paises WHERE pais = 'España') referencia
  FROM paises
  WHERE extension IS NOT NULL
) a
WHERE ABS(referencia - extension) / referencia <= 0.05
ORDER BY ABS(referencia - extension)

--Comparar el número de veces que cada país es mayor que España en cuanto extensión y población

SELECT pais,
  FORMAT(extension / mi_extension, 2) "Veces el tamaño de España",
  FORMAT(poblacion / mi_poblacion, 2) "Veces la población de España"
FROM (  
  SELECT pais, extension, poblacion,
    (SELECT extension FROM paises WHERE pais = 'España') mi_extension,
    (SELECT poblacion FROM paises WHERE pais = 'España') mi_poblacion
  FROM paises
  WHERE extension IS NOT NULL 
    AND poblacion IS NOT NULL
) a
WHERE (extension / mi_extension >= 1) 
  OR (poblacion / mi_poblacion >= 1)
ORDER BY (extension / mi_extension) + (poblacion / mi_poblacion) DESC


--Datos representativos de Italia incluyendo continente, gobierno, idiomas y países vecinos

SELECT p.pais, p.capital, p.poblacion, p.extension, c.continente, g.gobierno, i.idioma, v.pais vecino
FROM paises p
  LEFT JOIN continentes c ON p.continente_id = c.id
  LEFT JOIN gobiernos g ON p.gobierno_id = g.id
  LEFT JOIN paises_idiomas pi ON pi.pais_id = p.id LEFT JOIN idiomas i ON pi.idioma_id = i.id
  LEFT JOIN paises_vecinos pv ON pv.pais_id = p.id LEFT JOIN paises v ON pv.vecino_id = v.id
WHERE p.pais = 'Italia'


SELECT p.id, pais, capital, poblacion, extension, continente, gobierno
FROM paises p
  LEFT JOIN continentes c ON p.continente_id = c.id
  LEFT JOIN gobiernos g ON p.gobierno_id = g.id
WHERE pais = 'Italia';
SELECT pais vecino
FROM paises_vecinos pv
  LEFT JOIN paises v ON pv.vecino_id = v.id  
WHERE pv.pais_id = (SELECT id FROM paises WHERE pais = 'Italia');SELECT idioma
FROM paises_idiomas pi 
  LEFT JOIN idiomas i ON pi.idioma_id = i.id  
WHERE pi.pais_id = (SELECT id FROM paises WHERE pais = 'Italia');

--Países que incluyen el texto "lon" en el nombre, o en la capital o en el gobierno

SELECT pais, capital, gobierno, poblacion, extension, patron, 
  LOCATE(REPLACE(patron, '%', ''), CONCAT(pais,capital,gobierno)) posicion
FROM paises p INNER JOIN gobiernos g ON p.gobierno_id = g.id,
  (SELECT '%lon%' patron) parametros
WHERE pais LIKE patron
  OR capital LIKE patron
  OR gobierno LIKE patron
ORDER BY 7, 1

--Países que incluyen el texto "lon" o "mar" en el nombre o en la capital

SELECT pais, capital, poblacion, extension, patron,
  LOCATE(REPLACE(patron, '%', '') , CONCAT(pais,capital)) as posicion
FROM paises, 
  (SELECT '%lon%' patron UNION SELECT '%mar%') parametros
WHERE pais LIKE patron
  OR capital LIKE patron
ORDER BY 6, 1


--Países que contengan al mismo tiempo el texto "sa" y "ta" en el nombre del país

SELECT pais, capital, patron1, patron2,
  LOCATE(REPLACE(patron1, '%', ''), pais) +
  LOCATE(REPLACE(patron2, '%', ''), pais) peso
FROM paises,
  (SELECT '%sa%' patron1, '%ta%' patron2) parametros
WHERE pais LIKE patron1 
  AND pais LIKE patron2
ORDER BY 5, 1


--Países con una población de 5 millones de habitantes con una desviación máxima del 10%

SELECT pais, capital, poblacion, habitantes, desviacion, 
  ABS(poblacion - habitantes) / poblacion * 100 peso
FROM paises,
  (SELECT 5000000 habitantes, 10 desviacion) parametros
WHERE 
  poblacion BETWEEN habitantes * (1 - desviacion / 100) AND habitantes * (1 + desviacion / 100)
ORDER BY 6, 1

--Comparar la población y la superficie de cada continente con el total del planeta Tierra

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

--Países a los que les falta alguno de estos campos: 
--capital, población, extensión, costa, gobierno o continente

SELECT * FROM (
  SELECT pais, 
    
    CONCAT_WS(', ',
      CASE WHEN capital IS NULL THEN 'capital' ELSE NULL END,
      CASE WHEN poblacion IS NULL THEN 'población' ELSE NULL END,
      CASE WHEN extension IS NULL THEN 'extensión'  ELSE NULL END,
      CASE WHEN costa IS NULL THEN 'costa' ELSE NULL END,
      CASE WHEN gobierno IS NULL THEN 'gobierno' ELSE NULL END,
      CASE WHEN continente IS NULL THEN 'continente' ELSE NULL END
	  --campos_faltan
	  ) numero_campos_faltan
  FROM paises p
    LEFT JOIN gobiernos g ON p.gobierno_id = g.id
    LEFT JOIN continentes c ON p.continente_id = c.id
) 
WHERE numero_campos_faltan <> 0
ORDER BY numero_campos_faltan DESC, pais


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