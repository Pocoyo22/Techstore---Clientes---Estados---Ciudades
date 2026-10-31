**Base de datos:** TechStore  
## 1. Creación de las tablas 'estados, ciudades'

CREATE TABLE estados (
    id integer PRIMARY KEY,
    nombre varchar(50) NOT NULL UNIQUE
);

CREATE TABLE ciudades (
    id integer PRIMARY KEY,
    nombre varchar(50) NOT NULL,
    estado_id integer NOT NULL REFERENCES estados(id),
    CONSTRAINT ciudades_nombre_estado_key
    UNIQUE (nombre, estado_id)
);

## 2. Se insertan los registros a los estados y las ciudades.

INSERT INTO estados (id, nombre) VALUES
(1, 'Aguascalientes'),
(2, 'Baja California'),
(3, 'CDMX'),
(4, 'Chihuahua'),
(5, 'Coahuila'),
(6, 'Guanajuato'),
(7, 'Guerrero'),
(8, 'Jalisco'),
(9, 'Michoacán'),
(10, 'Nuevo León'),
(11, 'Puebla'),
(12, 'Querétaro'),
(13, 'San Luis Potosí'),
(14, 'Sinaloa'),
(15, 'Sonora'),
(16, 'Veracruz'),
(17, 'Yucatán');


INSERT INTO ciudades (id, nombre, estado_id) VALUES
(1, 'Acapulco', 7),
(2, 'Aguascalientes', 1),
(3, 'Chihuahua', 4),
(4, 'Ciudad de México', 3),
(5, 'Culiacán', 14),
(6, 'Guadalajara', 8),
(7, 'Hermosillo', 15),
(8, 'Juárez', 4),
(9, 'León', 6),
(10, 'Mérida', 17),
(11, 'Mexicali', 2),
(12, 'Monterrey', 10),
(13, 'Morelia', 9),
(14, 'Puebla', 11),
(15, 'Querétaro', 12),
(16, 'Saltillo', 5),
(17, 'San Luis Potosí', 13),
(18, 'Tijuana', 2),
(19, 'Veracruz', 16),
(20, 'Zapopan', 8);

## 3. Actualización de los datos existentes en clientes

UPDATE clientes SET ciudad = '1' WHERE ciudad = 'Acapulco';
UPDATE clientes SET ciudad = '2' WHERE ciudad = 'Aguascalientes';
UPDATE clientes SET ciudad = '3' WHERE ciudad = 'Chihuahua';
UPDATE clientes SET ciudad = '4' WHERE ciudad = 'Ciudad de México';
UPDATE clientes SET ciudad = '5' WHERE ciudad = 'Culiacán';
UPDATE clientes SET ciudad = '6' WHERE ciudad = 'Guadalajara';
UPDATE clientes SET ciudad = '7' WHERE ciudad = 'Hermosillo';
UPDATE clientes SET ciudad = '8' WHERE ciudad = 'Juárez';
UPDATE clientes SET ciudad = '9' WHERE ciudad = 'León';
UPDATE clientes SET ciudad = '10' WHERE ciudad = 'Mérida';
UPDATE clientes SET ciudad = '11' WHERE ciudad = 'Mexicali';
UPDATE clientes SET ciudad = '12' WHERE ciudad = 'Monterrey';
UPDATE clientes SET ciudad = '13' WHERE ciudad = 'Morelia';
UPDATE clientes SET ciudad = '14' WHERE ciudad = 'Puebla';
UPDATE clientes SET ciudad = '15' WHERE ciudad = 'Querétaro';
UPDATE clientes SET ciudad = '16' WHERE ciudad = 'Saltillo';
UPDATE clientes SET ciudad = '17' WHERE ciudad = 'San Luis Potosí';
UPDATE clientes SET ciudad = '18' WHERE ciudad = 'Tijuana';
UPDATE clientes SET ciudad = '19' WHERE ciudad = 'Veracruz';
UPDATE clientes SET ciudad = '20' WHERE ciudad = 'Zapopan';

## 4. Cambio del tipo de dato de ciudad 
ALTER TABLE clientes
ALTER COLUMN ciudad TYPE INTEGER
USING ciudad::INTEGER;

## 5. Cambio del nombre de la columna ciudad a ciudad_id
ALTER TABLE clientes
RENAME COLUMN ciudad TO ciudad_id;

## 6. Creación de la relación entre clientes y ciudades
ALTER TABLE clientes
ADD CONSTRAINT fk_clientes_ciudades
FOREIGN KEY (ciudad_id)
REFERENCES ciudades(id);

## 7. Creación de la relación entre ciudades y estados
ALTER TABLE ciudades
ADD CONSTRAINT fk_ciudades_estados
FOREIGN KEY (estado_id)
REFERENCES estados(id);
