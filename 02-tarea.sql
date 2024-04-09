
-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like
SELECT 
	COUNT(*) AS DOMINIOS_CON_GOOGLE 
	FROM (
		SELECT 
			SUBSTRING(email 
		FROM 
			POSITION('@' IN email)) AS DOMINIO_CON_GOOGLE 
FROM USERS
) AS DOMINIOS 
WHERE DOMINIO_CON_GOOGLE='@google.com'


-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct

SELECT country as Paises, count(*) as USUARIOS_POR_PAISES FROM (
		SELECT 
			COUNTRY,SUBSTRING(email FROM  POSITION('@' IN email)) AS DOMINIO_CON_GOOGLE 
FROM USERS 
) AS DOMINIOS 
WHERE DOMINIO_CON_GOOGLE='@google.com'
group by country


-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by
SELECT 	
	COUNTRY,
	COUNT(*) 
FROM USERS
GROUP BY COUNTRY


-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection
SELECT 	
	FIRST_NAME,
	LAST_NAME,
	COUNTRY,
	LAST_CONNECTION
FROM USERS
WHERE COUNTRY='Iceland'


-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX
SELECT 
	COUNT(*) 
FROM USERS
WHERE COUNTRY='Iceland' 
	AND LAST_CONNECTION 
		LIKE '112%'


-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis 

SELECT 
	*
FROM USERS
WHERE COUNTRY='Iceland' 
	AND (LAST_CONNECTION LIKE '112%'
	OR LAST_CONNECTION LIKE '28%'
	OR LAST_CONNECTION LIKE '188%')

-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también
SELECT 
	*
FROM USERS
WHERE COUNTRY='Iceland' 
	AND LAST_CONNECTION LIKE '112%'
	OR LAST_CONNECTION LIKE '28%'
	OR LAST_CONNECTION LIKE '188%'
ORDER BY USERS.LAST_NAME ASC , 
		 USERS.FIRST_NAME ASC


-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)

SELECT COUNTRY,FIRST_NAME, LAST_NAME
FROM USERS 
WHERE USERS.COUNTRY IN ('Mexico','Honduras','Costa Rica')
ORDER BY USERS.COUNTRY ASC,
	USERS.FIRST_NAME ASC,
	USERS.LAST_NAME ASC


-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc
SELECT 	
	country,
	COUNT(*) AS PERSONAS_PAIS 
FROM USERS 
WHERE USERS.COUNTRY 
	IN ('Mexico','Honduras','Costa Rica')
GROUP BY COUNTRY
ORDER BY COUNTRY ASC