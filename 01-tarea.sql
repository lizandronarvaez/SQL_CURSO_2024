-- VER TODOS LOS REGISTROS CON LIMITES
SELECT * FROM USERS LIMIT 10

-- VER EL REGISTRO CUYO ID SEA IGUAL A 10
SELECT * FROM USERS WHERE id=10;

-- Quiero todos los registros que cuyo primer nombre sea Jim
SELECT * FROM USERS WHERE NAME LIKE 'Jim %'

-- TODOS LOS REGISTROS CUYO SEGUNDO NOMBRE ES ALEXANDER
SELECT * FROM USERS WHERE NAME LIKE '% Alexander'

-- cambiar el nombre del registro con id=1 por tu nombre
UPDATE 
	USERS
SET 
	NAME='Lizandro Narváez'
WHERE
	ID=1

-- BORRAR EL ULTIMO REGISTRO DE LA TABLA
-- PRIMERO EJECUTA EL SUBQUERY Y DESPUES EL QUERY NORMAL
DELETE FROM USERS WHERE ID=(SELECT MAX(USERS.ID) FROM USERS);