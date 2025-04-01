SELECT * FROM emp;
--LA MEJOR PRAXIS ES UTILIZAR EL NOMBRE DE LOS CAMPOS--
--CONTROL + ENTER = EJECUTA LA LINEA DONDE ESTEMOS POSICIONADOS--
SELECT apellido, oficio, salario FROM emp;
--ORDENACION DE DATOS--
-- LA ORDENACION DE BASE SIEMPRE ES ASCENDENTE--
SELECT * FROM emp ORDER BY apellido;
-- PARA PONERLO ASCENDENTE SE USA EL ASC AL FINAL--
SELECT * FROM emp ORDER BY apellido ASC;
-- PARA PONERLO DESCENDENTE SE USA EL DESC AL FINAL--
SELECT * FROM emp ORDER BY apellido DESC;
--ORDENAR POR MAS DE UN CAMPO--
SELECT * FROM emp ORDER BY dept_no, oficio;
--FILTRADO DE REGISTROS--
--OPERADORES DE COMPARACION--
/* 
= IGUAL
>= MAYOR O IGUAL
<= MENOR O IGUAL
> MAYOR
< MENOR
<> DISTINTO
*/
--ORACLE POR DEFECTO DIFERENCIA ENTRE MAYUSCULAS Y MINUSCULAS EN SUS TEXTOS (STRING/VARCHAR)--
--TODO LO QUE NO SEA UN NUMERO SE ESCRIBE ENTRE COMILLAS SIMPLES '..'--
-- PARA FILTRAR SE UTILIZA LA PALABRA where Y SE ESCRIBE SOLAMENTE UNA VEZ EN TODA LA CONSULTA
-- DESPUES DEL FROM
--  MOSTRAR TODOS LOS EMPLANEADOS DEL DEPARTAMENTO 10
SELECT * FROM emp WHERE dept_no = 10; 
--  MOSTRAR TODOS LOS EMPLEADOS CUYO OFICIO SEA DIRECTOR
SELECT * FROM emp WHERE oficio = 'DIRECTOR';
--  MOSTRAR TODOS LOS OFICIOS QUE SEAN DIFERENTES A DIRECTOR
SELECT * FROM emp WHERE oficio <> 'DIRECTOR';
SELECT * FROM emp WHERE oficio != 'DIRECTOR';

-- OPERADORES RELACIONALES
-- NOS PERMITEN REALIZAR MAS DE UNA PREGUNTA DENTRO DE UNA CONSULTA
/*
OR --> MUESTRA LOS DATOS DE CADA FILTRO
AND --> TODOS LOS FILTROS DEBEN CUMPLIRSE
NOT --> NEGACION DE UNA CONDICION (EVITARLO SIEMPRE)
*/
--  MOSTRAR LOS EMPLEADOS DEL DEPARTAMENTO 10 Y QUE TENGAN OFICIO DIRECTOR
SELECT * FROM emp WHERE dept_no = 10 AND oficio = 'DIRECTOR';
SELECT * FROM emp WHERE dept_no = 10 OR oficio = 'DIRECTOR';
--  MOSTRAR LOS EMPLEADOS DEL DEPARTAMENTO 10 Y DEL DEPARTAMENTO 20
SELECT * FROM emp WHERE dept_no = 10 AND dept_no = 20; -- ESTE NO MUESTRA NADA AL NO HABER EMPLEADOS QUE COMPARTAN AMBOS DEPARTAMENTOS
SELECT * FROM emp WHERE dept_no = 10 OR dept_no = 20;
-- TENEMOS OTROS OPERADORES ADEMAS DE LOS ESTANDAR
-- BETWEEN MUESTRA LOS DATOS ENTRE UN RANGO INCLUSIVE
--  MOSTRAR LOS EMPLEADOS CUYO SALARIO ESTE ENTRE 251000 Y 390000
SELECT * FROM emp WHERE salario BETWEEN 251000 AND 390000 ORDER BY salario DESC; -- ordenador por salio de forma descendente
-- PODEMOS HACER LA MISMA CONSULTA CON OPERADORES Y ES EFICIENTE
SELECT * FROM emp WHERE salario >= 251000 AND salario <= 390000 ORDER BY salario DESC;
-- LA NEGACION ES ALGO DE LO QUE DEBEMOS DE HUIR
--  MOSTRAR LOS EMPLEADOS QUE NO SEAN DIRECTOR
SELECT * FROM emp WHERE NOT oficio = 'DIRECTOR'; -- EL not SIEMPRE VA DESPUES DEL WHERE
-- PODEMOS REALIZAR LA CONSULTA CON OPERADOR
SELECT * FROM emp WHERE oficio <> 'DIRECTOR';
-- EXISTE UN OPERADOR PARA BUSCAR COINCIDENCIAS EN TEXTO
-- NOS PERMITE MEDIANTE CARACTERES ESPECIALES HACER FILTROS DE TEXTO
/* 
% BUSCA CULAQUIER CARACTER Y LOGINTUD
_ UN CARACTER CUALQUIERA
? UN CARACTER NUMERICO
*/
--  MOSTRAR LOS EMPLEADOS CUYOS APELLIDOS EMPIEZAN POR S
SELECT * FROM emp WHERE apellido LIKE 's%';
--  MOSTRAR LOS EMPLEADOS CUYOS APELLIDOS FINALIZA EN A
SELECT * FROM emp WHERE apellido LIKE '%a';
--  MOSTRAR TODOS LOS EMPLEADOS CUYOS APELLIDOS SEAN DE CUATRO LETRAS
SELECT * FROM emp WHERE apellido LIKE '____'; -- CADA GUION BAJO ES UNA LETRA, POR ESO HAY 4 GUIONES BAJOS
-- EXISTE OTRO OPERADOR PARA BUSCAR COINCIDENCIAS DE IGUALDAD EN UN MISMO CAMPO
-- IN (VALOR1, VALOR2)
--  MOSTRA LOS EMPLEADOS DEL DEPARTAMENTO 10 Y DEL 20
SELECT * FROM emp WHERE dept_no IN (10, 20, 30);
-- NOT IN (VALOR1, VALOR2) MUESTRA LOS QUE NOS ESTAN DENTRO DE ESTOS VALORES
SELECT * FROM emp WHERE dept_no NOT IN (10, 20); 

-- CAMPOS CALCULADOS
-- UN CAMPO CALCULADO ES UNA HERRAMIENTA EN UNA CONSULTA
-- UN CAMPO CALCULADO SIEMPRE DEBE DE TENER UN ALIAS
-- SIRVE PARA GENERENAR CAMPOS QUE NO EXISTAN EN LA TABLA Y LOS PODEMOS CALCULAR
-- MOSTRAR EL APELLIDO, EL SALARIO, COMISION Y EL SALARIO TOTAL DE TODOS LOS EMPLEADOS (SALARIO + COMISION) DE TODOS LOS EMPLEADOS
SELECT APELLIDO, SALARIO AS SUELDO, COMISION, (SALARIO + COMISION) AS TOTAL FROM emp;
-- UN CAMPO CALCULADO ES SOLO PARA EL CURSOR
-- MOSTRAR EL APELLIDO, EL SALARIO, COMISION Y EL SALARIO TOTAL DE TODOS LOS EMPLEADOS (SALARIO + COMISION) DE TODOS LOS EMPLEADOS CUYO SALARIO + COMISION SEA MAYOR A 344500
SELECT APELLIDO, SALARIO AS SUELDO, COMISION, (SALARIO + COMISION) AS TOTAL FROM emp WHERE (SALARIO + COMISION) >= 344500;
-- QUEREMOS LA CONSULTA ORIGINAL Y ORDENAR POR ELLA
SELECT APELLIDO, SALARIO AS SUELDO, COMISION, (SALARIO + COMISION) AS TOTAL FROM emp ORDER BY TOTAL; -- ORDER BY AFECTA SOBRE EL SELECT, DESPUES IRIA EL WHERE
-- CLAUSULA DISTINC: SE UTILIZA PARA EL SELECT Y LO QUE REALIZA ES ELIMINAR REPETIDOS DE LA CONSULTA
-- MOSTRAR EL OFICIO DE LOS EMPLEADOS
SELECT OFICIO FROM emp;
-- MOSTRAR LOS DIFERENTES OFICIOS DE LOS EMPLEADOS
SELECT DISTINCT OFICIO FROM emp;
-- MOSTRAR LOS DIFERENTES OFICIOS Y APELLIDOS DE LOS EMPLEADOS (NO TIENE SENTIDO HACERLO)
SELECT DISTINCT OFICIO, APELLIDO FROM emp;

--  CONSULAS DE SELECCION

SELECT * FROM enfermo;



--                                              EJERCICIOS

-- EJERCICIO 6
-- Mostrar todos los enfermos nacidos antes del 11/01/1970.
SELECT * FROM enfermo;
DESC enfermo; --muestra la informacion de la tabla
SELECT * FROM enfermo WHERE FECHA_NAC < '11/01/1970';
-- EJERCICIO 7
-- Igual que el anterior, para los nacidos antes del 1/1/1970 ordenados por número de inscripción.
SELECT * FROM enfermo WHERE FECHA_NAC < '11/01/1970' ORDER BY INSCRIPCION;
-- EJERCICIO 8
-- Listar todos los datos de la plantilla del hospital del turno de mañana
SELECT * FROM plantilla;
SELECT * FROM plantilla WHERE TURNO = 'M';
-- EJERCICIO 9
-- Idem del turno de noche.
SELECT * FROM plantilla;
SELECT * FROM plantilla WHERE TURNO = 'N';
-- EJERCICIO 10
-- Listar los doctores que su salario anual supere 3.000.000 €.
SELECT * FROM plantilla;
SELECT (SALARIO*12) AS SUELDO_ANUAL FROM plantilla WHERE (SALARIO*12) > 3000000;
SELECT * FROM plantilla WHERE (SALARIO*12) > 3000000;
-- EJERCICIO 11
-- Visualizar los empleados de la plantilla del turno de mañana que tengan un salario entre 2.000.000 y 2.250.000.
SELECT * FROM plantilla WHERE TURNO = 'M';
SELECT * FROM plantilla WHERE TURNO = 'M' AND (SALARIO >= 200000 and SALARIO <= 225000);
-- EJERCICIO 12
-- Visualizar los empleados de la tabla emp que no se dieron de alta entre el 01/01/1986 y el 12/12/1994.
SELECT * FROM emp;
SELECT * FROM emp WHERE (FECHA_ALT <= '01/01/86' OR FECHA_ALT >= '12/12/94') AND OFICIO = 'EMPLEADO'; -- EJERCICIO CORRECTO
SELECT * FROM emp WHERE (FECHA_ALT >= '01/01/86' AND FECHA_ALT <= '12/12/94') AND OFICIO = 'EMPLEADO'; -- MUESTRA LOS QUE SI SE DIERON DE ALTA ENTRE ESAS FECHAS
SELECT * FROM emp WHERE NOT ( FECHA_ALT >= '01/01/86' AND FECHA_ALT <= '12/12/94') AND OFICIO = 'EMPLEADO'; -- EJERCICIO CORRECTO TAMBIEN USANDO EL not
-- EERCICIO 13
-- Mostrar los nombres de los departamentos situados en Madrid o en Barcelona.
SELECT * FROM dept;
SELECT DNOMBRE FROM dept;
SELECT DNOMBRE, LOC FROM dept WHERE LOC = 'BARCELONA' OR LOC = 'MADRID';
SELECT DISTINCT DNOMBRE,LOC FROM dept WHERE LOC IN ('BARCELONA','MADRID');
SELECT DNOMBRE, LOC FROM dept WHERE LOC IN ('BARCELONA','MADRID'); -- EJERCICIO CORRECTO

-- CONSULTAS DE AGRUPACION
-- ESTE TIPO DE CONSULTAS NOS PERMITEN MOSTRAR ALGUN RESUMEN SOBRE UN GRUPO DETERMINADO DE LOS DATOS
-- UTILIZAN FUNCIONES DE AGRUPACION PARA CONSEGUIR EL RESUMEN
-- LAS FUNCIONES DEBEN TENER ALIAS
-- COUNT (*): CUENTA EL NUMERO DE REGISTROS, INCLUYENDO NULOS
-- COUNT (CAMPO): CUENTA EL NUMERO DE REGISTROS SIN NULOS
-- SUM (NUMERO): SUMA EL TOTAL DE UN CAMPO NUMERICO
-- AVG (NUMERO): RECUPERA LA MEDIA DE UN CAMPO NUMERICO
-- MAX (CAMPO): DEVUELVE EL MAXIMO VALOR DE UN CAMPO
-- MIN (CAMPO): DEVUELVE EL MINIMO VALOR DE UN CAMPO

-- MOSTRAR EL NUMERO DE REGISTROS DE LA TABLA DOCTOR
SELECT COUNT(*) AS numero_doctores FROM doctor;
SELECT COUNT(apellido) AS numero_doctores FROM doctor;
-- PODEMOS COMBINAR SIN PROBLEMA VARIAS FUNCIONES
-- QUEREMOS EL NUMERO DE DOCTORES Y EL MAXIMO DE SALARIO
SELECT COUNT (*) AS doctores, MAX (salario) AS maximo FROM doctor;
-- LOS DATOS RESULTANTES DE LAS FUNCIONES PODEMOS AGRUPARLOS POR ALGUN CAMPO O CAMPOS DE LA TABLA
-- CUANDO QUEREMOS AGRUPAR UTILIZAMOS group by DESPUES DEL from
--TRUCO: DEBEMOS AGRUPAR POR CADA CAMPO QUE NO SEA UNA FUNCION

-- MOSTRAR CUANTOS DOCTORES EXISTEN POR CADA ESPECIALIDAD
SELECT * FROM doctor;
SELECT COUNT (*) AS doctores, especialidad FROM DOCTOR GROUP BY especialidad;

-- MOSTRAR NUMERO DE PERSONAS Y MAXIMO SALARIO DE LOS EMPLEADOS POR CADA DEPARTAMENTO Y OFICIO
SELECT COUNT (*) AS personas, MAX (salario) AS maximo_salario, dept_no, oficio FROM emp GROUP BY dept_no, oficio;

-- MOSTRAR EL NUMERO DE PERSONAS DE LA PLANTILLA
SELECT COUNT (*) AS personas FROM plantilla;

-- MOSTRAR EL NUMERO DE PERSONAS DE LA PLANTILLA POR CADA TURNO
SELECT COUNT (*) AS personas, turno FROM plantilla GROUP BY turno;
SELECT turno, COUNT (*) AS personas FROM plantilla GROUP BY turno;

-- FILTRANDO EN CONSULTAS DE AGRUPACION
-- TENEMOS DOS POSIBILIDADES:
-- WHERE: ANTES DEL GROUP BY Y PARA FILTRAR SOBRE LA TABLA
-- HAVING: DESPUES DEL GROUP BY Y PARA FILTRAR SOBRE EL CONJUNTO

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO
SELECT COUNT (*) AS empleados, oficio FROM emp GROUP BY oficio;

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO QUE COBREN MAS DE 200000
SELECT COUNT (*) AS empleados, oficio FROM emp WHERE salario > 200000 GROUP BY oficio;

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO Y QUE SEAN ANALISTAS O VENDEDORES
-- (PODEMOS DECIDIR CON HAVING O WHERE)
SELECT COUNT (*) AS empleados, oficio FROM emp GROUP BY oficio HAVING oficio IN ('ANALISTA', 'VENDEDOR'); -- MAS RAPIDO
SELECT COUNT (*) AS empleados, oficio FROM emp WHERE oficio IN ('ANALISTA', 'VENDEDOR') GROUP BY oficio;

-- CUANDO NO PODEMOS DECIDIR Y ESTAMOS OBLIGADOS A USAR HAVING:
-- SI QUEREMOS FILTRAR POR UNA FUNCION DE AGRUPACION

-- MOSTRAR CUANTOS EMPLEADOS TENEMOS POR CADA OFICIO SOLAMENTE DONDE TENGAMOS 2 O MAS EMPLEADOS DEL MISMO OFICIO
SELECT COUNT (*) AS empleados, oficio FROM emp GROUP BY oficio HAVING COUNT (*) >= 2;


--                                              EJERCICIOS

-- EJERCICIO 2
-- Encontrar el salario más alto, mas bajo y la diferencia entre ambos de todos los empleados con oficio EMPLEADO.
SELECT oficio, MAX (salario) AS maximo_salario, MIN (salario) AS minimo_salario, MAX (salario) - MIN (salario) AS diferencia_salarios FROM emp GROUP BY oficio HAVING oficio = 'EMPLEADO';

-- EJERCICIO 4
-- Visualizar el número de personas que realizan cada oficio en cada departamento ordenado por departamento.
SELECT COUNT (*) AS personas, oficio, dept_no FROM emp GROUP BY dept_no, oficio ORDER BY 3;

-- EJERCICIO 5
-- Buscar aquellos departamentos con cuatro o más personas trabajando.
SELECT * FROM emp;
SELECT COUNT (*) AS personas, dept_no  FROM emp GROUP BY dept_no HAVING COUNT (*) >= 4;

-- EJERCICIO 7
-- Visualizar el número de enfermeros, enfermeras e interinos que hay en la plantilla, ordenados por la función.
SELECT funcion, COUNT (*) AS puestos FROM plantilla GROUP BY funcion HAVING funcion IN ('ENFERMERO', 'ENFERMERA', 'INTERINO') ORDER BY funcion;

-- EJERCICIO 8
-- Visualizar departamentos, oficios y número de personas, para aquellos departamentos que tengan dos o más personas trabajando en el mismo oficio.
SELECT dept_no, oficio, COUNT (*) AS personas FROM emp GROUP BY oficio, dept_no HAVING COUNT (*) >= 2;

-- EJERCICIO 10
-- Calcular el valor medio de las camas que existen para cada nombre de sala. Indicar el nombre de cada sala y el número de cada una de ellas.
SELECT * FROM sala;
SELECT COUNT (nombre), nombre, AVG (NUM_CAMA) AS media_camas from sala GROUP BY nombre; 

-- EJERCICIO 11
-- Calcular el salario medio de la plantilla de la sala 6, según la función que realizan. Indicar la función y el número de empleados.
SELECT * FROM plantilla;
SELECT COUNT (*) AS empleados, sala_cod, AVG (salario), funcion FROM plantilla GROUP BY sala_cod, funcion HAVING sala_cod = 6;

-- EJERCICIO 13
-- Mostrar el número de hombres y el número de mujeres que hay entre los enfermos.
SELECT * FROM enfermo;
SELECT COUNT (*) AS personas, sexo FROM enfermo GROUP BY sexo;

-- EJERCICIO 15
-- Calcular el número de salas que existen en cada hospital.
SELECT * FROM sala;
SELECT COUNT (*) AS numero_salas, hospital_cod FROM sala GROUP BY hospital_cod;

-- EJERCICIO 16
-- Mostrar el número de enfermeras que existan por cada sala
SELECT * FROM plantilla;
SELECT COUNT (*) AS enfermeras_sal, sala_cod AS enfermeras_sala FROM plantilla WHERE funcion = 'ENFERMERA' GROUP BY sala_cod;



-- CONSULTAS DE COMBINACION
-- NOS PERMITEN MOSTRAR DATOS DE VARIAS TABLAS QUE DEBEN ESTAR RELACCIONADAS ENTRE SI MEDIANTE UNA CLAVE
-- 1) NECESITAMOS EL CAMPO O CAMPOS DE RELACCION ENTRE LAS TABLAS (CAMPO = COLUMNA)
-- 2) DEBEMOS PONER EL NOMBRE DE CADA TABLA Y CADA CAMPO EN LA CONSULTA
-- SINTAXIS:
SELECT TABLA1.CAMPO1, TABLA1.CAMPO2,
TABLA2.CAMPO1, TABLA2.CAMPO2 
FROM TABLA1
INNER JOIN TABLA2
ON TABLA1.CAMPORELACION = TABLA2.CAMPORELACION;

-- MOSTRAR EL APELLIDO, EL OFICIO DE EMPLEADOS JUNTO A SU NOMBRE DE DEPARTAMENTO Y LOCALIDAD
SELECT emp.apellido, emp.oficio, dept.dnombre, dept.loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no; --ESTA ESLA EFICIENTE Y CORRECTA

-- TENEMOS OTRA SINTAXIS PARA REALIZAR LOS JOIN
SELECT emp.apellido, emp.oficio, dept.dnombre, dept.loc FROM emp, dept WHERE emp.dept_no = dept.dept_no; -- YA NO SE USA

-- PODEMOS REALIZAR, POR SUPUESTO NUESTROS WHERE
-- QUEREMOS MOSTRAR LOS DATOS SOLO DE MADRID
SELECT emp.apellido, emp.oficio, dept.dnombre, dept.loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no WHERE dept.loc = 'MADRID';

-- NO ES OBLIGATORIO INCLUIR EL NOMBRE DE LA TABLA ANTES DEL CAMPO A MOSTRAR EN EL SELECT, PERO ES PEOR YA QUE LLEVA A PERDIDAS DE INFORMACION
SELECT emp.apellido, oficio, dept.dnombre, loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no;

-- PODEMOS INCLUIR ALIAS A LOS NOMBRES DE LAS TABLAS PARA LLAMARLAS ASI A LO LARGO DE LA CONSULTA, ES UTIL CUANDO TENEMOS TABLAS CON NOMBRES MUY LARGOS
-- CUANDO PONEMOS ALIAS, LA TABLA SE LLAMARA ASI PARA TODA LA CONSULTA
SELECT e.apellido, e.oficio, d.dnombre, d.loc FROM emp e INNER JOIN dept d ON e.dept_no = d.dept_no; -- EN EL FROM E INNER JOIN SE PONEN LOS ALIAS 

-- TENEMOS MULTIPLES TIPOS DE JOIN EN LAS BASES DE DATOS:
-- INNER: COMBINA LOS RESULTADOS DE LAS DOS TABLAS
-- LEFT: COMBINA LAS DOS TABLAS Y LA TABLA IZQUIERDA
-- RIGHT: COMBINA LAS DOS TABLAS Y LA TABLA DERECHA
-- FULL: COMBINA LAS DOS TABLAS Y FUERZA LAS DOS TABLAS
-- CROSS: PRODUCTO CARTESIANO, COMBINAR CADA DATO DE UNA TABLA CON LOS OTROS DATOS DE LA OTRA TABLA

SELECT DISTINCT dept_no from emp;
SELECT * FROM dept;
SELECT e.apellido, e.oficio, d.dnombre, d.loc FROM emp e INNER JOIN dept d ON e.dept_no = d.dept_no ORDER BY d.loc;


-- TENEMOS UN DEPARTAMENO: 40, PRODUCCION, GRANADA SIN EMPLEADOS
-- VAMOS A CREAR UN NUEVO EMPLEADO QUE NO TENGA DEPARTAMENTO

INSERT INTO emp VALUES('1111', 'sin dept', 'EMPLEADO', 7919, TO_DATE('20-10-1986', 'DD-MM-YYYY'), 258500, 50000, 50);
SELECT * FROM emp;

-- TENEMOS UN EMPLEADO SIN DEPARTAMENTO EN EL 50
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no;

-- LEFT: COMBINA LAS DOS TABLAS Y LA TABLA IZQUIERDA
-- LA TABLA DE LA IZQUIERDA ES LA DE ANTES DEL JOIN
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp LEFT JOIN dept ON emp.dept_no = dept.dept_no;

-- RIGHT: COMBINA LAS DOS TABLAS Y LA TABLA DERECHA
-- LA TABLA DE LA DERECHA ES LA DE DESPUES DEL JOIN
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp RIGHT JOIN dept ON emp.dept_no = dept.dept_no;

-- FULL: COMBINA LAS DOS TABLAS Y FUERZA LAS DOS TABLAS
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp FULL JOIN dept ON emp.dept_no = dept.dept_no;

-- CROSS: PRODUCTO CARTESIANO, COMBINAR CADA DATO DE UNA TABLA CON LOS OTROS DATOS DE LA OTRA TABLA, NO LLEVA ON
SELECT emp.apellido, dept.dnombre, dept.loc FROM emp CROSS JOIN dept;

-- MOSTRAR LA MEDIA SALARIAL DE LOS DOCTORES POR HOSPITAL
SELECT AVG (salario) as media, hospital_cod FROM doctor GROUP BY hospital_cod;
-- MOSTRAR LA MEDIA SALARIAL DE LOS DOCTORES POR HOSPITAL MOSTRANDO EL NOMBRE DEL HOSPITAL
SELECT AVG (doctor.salario) as media, hospital.nombre FROM doctor INNER JOIN hospital ON doctor.hospital_cod = hospital.hospital_cod GROUP BY hospital.nombre;

-- MOSTRAR EL NUMERO DE EMPLEADOS QUE EXISTEN POR CADA LOCALIDAD
SELECT COUNT (emp.emp_no) AS cantidad_empleados, dept.loc FROM emp RIGHT JOIN dept ON emp.dept_no = dept.dept_no GROUP BY dept.loc;
SELECT * FROM emp;


--                                              EJERCICIOS

-- EJERCICIO 1
-- Seleccionar el apellido, oficio, salario, numero de departamento y su nombre de todos los empleados cuyo salario sea mayor de 300000
SELECT * FROM dept;
SELECT * FROM emp;
SELECT emp.apellido, emp.oficio, emp.salario, dept.dept_no, dept.dnombre FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no WHERE emp.salario >= '300000';

-- EJERCICIO 2
-- Mostrar todos los nombres de Hospital con sus nombres de salas correspondientes.
SELECT * FROM hospital;
SELECT * FROM sala;
SELECT sala.nombre AS sala_hospital, hospital.nombre AS nombre_hospital FROM sala INNER JOIN hospital ON sala.hospital_cod = hospital.hospital_cod;

-- EJERCICIO 3
-- Calcular cuántos trabajadores de la empresa hay en cada ciudad.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.loc, COUNT (emp.emp_no) AS cantidad_empleados FROM dept LEFT JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc;

-- EJERCICIO 4
-- Visualizar cuantas personas realizan cada oficio en cada departamento mostrando el nombre del departamento.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.dnombre, COUNT (emp.emp_no) AS personas , emp.oficio FROM dept LEFT JOIN emp ON emp.dept_no = dept.dept_no GROUP BY emp.oficio, dept.dnombre;

-- EJERCICIO 5
-- Contar cuantas salas hay en cada hospital, mostrando el nombre de las salas y el nombre del hospital
SELECT * FROM hospital;
SELECT * FROM sala;
SELECT COUNT (sala.sala_cod) AS numero_salas, sala.nombre AS sala_nombre, hospital.nombre AS hospital_nombre FROM sala INNER JOIN hospital ON sala.hospital_cod = hospital.hospital_cod GROUP BY sala.nombre, hospital.nombre;

-- EJERCICIO 6
-- Queremos saber cuántos trabajadores se dieron de alta entre el año 1997 y 1998 y en qué departamento.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT COUNT (emp.emp_no) AS altas, dept.dnombre FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no WHERE (emp.fecha_alt >= '01/01/97' AND emp.fecha_alt <= '31/12/98') GROUP BY dept.dnombre;
SELECT COUNT (emp.emp_no) AS altas, dept.dnombre FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no WHERE fecha_alt BETWEEN '01/01/97' AND '31/12/98' GROUP BY dept.dnombre; -- manera del profesor

-- EJERCICIO 7
-- Buscar aquellas ciudades con cuatro o más personas trabajando.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.loc, COUNT (emp.emp_no) AS personas FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc HAVING COUNT (emp.emp_no) >= '4';

-- EJERCICIO 8
-- Calcular la media salarial por ciudad.Mostrar solamente la media para Madrid y SEVILLA.
SELECT * FROM dept;
SELECT * FROM emp;
SELECT dept.loc, AVG (emp.salario) AS media_salarial FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc  HAVING dept.loc = 'MADRID' OR dept.loc = 'SEVILLA';
SELECT dept.loc, AVG (emp.salario) AS media_salarial FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY dept.loc  HAVING dept.loc IN ('MADRID', 'SEVILLA'); -- manera del profesor

-- EJERCICIO 9
-- Mostrar los doctores junto con el nombre de hospital en el que ejercen, la dirección y el teléfono del mismo.
SELECT * FROM hospital;
SELECT * FROM doctor;
SELECT doctor.apellido, hospital.nombre, hospital.direccion, hospital.telefono FROM doctor INNER JOIN hospital ON hospital.hospital_cod = doctor.hospital_cod;

-- EJERCICIO 10
-- Mostrar los nombres de los hospitales junto con el mejor salario de los empleados dela plantilla decada hospital.
SELECT * FROM hospital;
SELECT * FROM plantilla;
SELECT hospital.nombre, MAX (plantilla.salario) AS maximo_salario FROM hospital INNER JOIN plantilla ON hospital.hospital_cod = plantilla.hospital_cod GROUP BY hospital.nombre;

-- EJERCICIO 11
-- Visualizar el Apellido, función y turnode los empleados de la plantilla junto con el nombre de la salayel nombre del hospitalcon el teléfono.
-- SELECT TABLA1.CAMPO1, TABLA1.CAMPO2, TABLA2.CAMPO1, TABLA2.CAMPO2, TABLA3.CAMPO1, TABLA3.CAMPO2 FROM TABLA1 INNER JOIN TABLA2 ON TABLA1.RELACION = TABLA2.RELACION INNER JOIN TABLA3 ON TABLA1.RELACION = TABLA3.RELACION;
SELECT * FROM plantilla;
SELECT * FROM sala;
SELECT * FROM hospital;
SELECT plantilla.apellido, plantilla.funcion, plantilla.turno, sala.nombre AS nombre_sala, hospital.nombre AS nombre_hospital, hospital.telefono FROM plantilla INNER JOIN hospital ON plantilla.hospital_cod = hospital.hospital_cod INNER JOIN sala ON hospital.hospital_cod = sala.hospital_cod AND plantilla.sala_cod = sala.sala_cod;

-- EJERCICIO 12
-- Visualizar el máximo salario, mínimo salario de los Directores dependiendo de la ciudad en la que trabajen. Indicar el número total de directores por ciudad
SELECT * FROM dept;
SELECT * FROM emp;
SELECT COUNT (emp.emp_no) as directores, emp.oficio, dept.loc, MAX (emp.salario) AS maximo_salario, MIN (emp.salario) AS minimo_salario FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no GROUP BY emp.oficio, dept.loc HAVING oficio = 'DIRECTOR';
SELECT COUNT (emp.emp_no) as directores, dept.loc, MAX (emp.salario) AS maximo_salario, MIN (emp.salario) AS minimo_salario FROM dept INNER JOIN emp ON emp.dept_no = dept.dept_no WHERE oficio = 'DIRECTOR' GROUP BY dept.loc; --Manera del profesor

-- EJERCICIO 13
-- Averiguar la combinación de que salas podría haber por cada uno de los hospitales
SELECT * FROM hospital;
SELECT * FROM sala;
SELECT sala.nombre AS nombre_sala, hospital.nombre AS nombre_hospital FROM sala CROSS JOIN hospital;


-- SUBCONSULTAS 
-- SON CONSULTAS QUE NECESITAN DEL RESULTADO DE OTRA CONSULTA PARA PODER SER EJECUTADAS. NO SON AOUTONOMAS, NECESITAN ALGUN VALOR. 
-- NO IMPORTA EL NIVEL DE ANIDAMIENTO DE SUBCONSULTAS, AUNQUE PUEDEN REALENTIZAR LA RESPUESTA.
-- GENERAN BLOQUEOS EN CONSULTAS SELECT, LO QUE TAMBIEN REALENTIZAN LAS RESPUESTAS
-- DEBEMOS INTENTAR EVITARLAS EN LA MEDIDA DE LO POSIBLE CON SELECT

-- QUIERO VISUALIZAR LOS DATOS DEL EMPLEADO QUE MAS COBRA DE LA EMPRESA (EMP)
SELECT MAX (salario) FROM emp;
-- 650000
SELECT * FROM emp WHERE salario = 650000;
-- SE EJECUTAN LAS DOS CONSULTAS A LA VEZ Y SE ANIDA EL RESULTADO DE UNA CONSULTA CON LA IGUALDAD DE LA RESPUESTA DE OTRA CONSULTA
-- LAS SUBCONSULTAS VAN ENTRE PARENTESIS
SELECT * FROM emp WHERE salario = (SELECT MAX (salario) FROM emp);

-- MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO "GIL"
SELECT * FROM emp;
SELECT * FROM emp WHERE oficio = (SELECT oficio FROM emp WHERE apellido = 'gil');
-- MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO "GIL" Y QUE COBREN MENOS QUE "JIMENEZ"
SELECT * FROM emp;
SELECT * FROM emp WHERE oficio = (SELECT oficio FROM emp WHERE apellido = 'gil') AND salario < (SELECT salario FROM emp WHERE apellido = 'jimenez');
-- MOSTRAR LOS EMPLEADOS QUE TIENEN EL MISMO OFICIO QUE EL EMPLEADO "GIL" Y EL MISMO OFICIO QUE "JIMENEZ"
-- SI UNA SUBCONSULTA DEVUELVE MAS DE UN VALOR, SE UTILIZA EL OPERADOR IN
SELECT * FROM emp;
SELECT * FROM emp WHERE oficio IN (SELECT oficio FROM emp WHERE apellido = 'gil' OR apellido = 'jimenez');

-- POR SUPUESTO, PODEMOS UTILIZAR SUBCONSULTAS PARA OTRAS TABLAS
-- EVITARLO SI LAS TABLAS TIENEN ALGUNA RELACION DE CAMPOS
-- MOSTRAR EL APELLIDO Y EL OFICIO DE LOS EMPLEADOS DEL DEPARTAMENTO DE MADRID
SELECT apellido, oficio FROM emp WHERE dept_no = (SELECT dept_no FROM dept WHERE LOC = 'MADRID');
SELECT emp.apellido, emp.oficio FROM emp INNER JOIN dept ON emp.dept_no = dept.dept_no WHERE dept.loc = 'MADRID'; -- ESTA SERIA LA MANERA MAS EFICIENTE DE HACERLO


-- CONSULTAS UNION
-- MUESTRAN, EN UN MISMO CURSOR, UN MISMO CONJUNTO DE RESULTADOS
-- ESTAS CONSULTAS SE UTILIZAN COMO CONCEPTO, NO COMO RELACION
-- DEBEMOS DE SEGUIR TRES NORMAS:
-- 1) LA PRIMERA CONSULTA ES LA JEFA
-- 2) TODAS LAS CONSULTAS DEBEN TENER EL MISMO NUMERO DE COLUMNAS
-- 3) TODAS LAS COLUMNAS DEBEN TENER EL MISMO TIPO DE DATO ENTRE SI

-- EN NUESTRA BASE DE DATOS, TENEMOS DATOS DE PERSONAS EN DIFERENTES TABLAS
-- EMP, PLANTILLA Y DOCTOR
SELECT apellido, oficio, salario FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario  FROM doctor;
-- POR SUPUESTO PODEMOS ORDENAR SIN PROBLEMA
SELECT apellido, oficio, salario FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario  FROM doctor ORDER BY salario;
-- EN LOS UNION ES MEJOR ORDENAR POR NUMERANDO "ORDER BY 3" POR EJEMPLO EN ESTE CASO. YA QUE SI PONEMOS UN ALIAS NO FUNCIONARIA, SOLO CON NUMERANDO.
SELECT apellido, oficio, salario FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario  FROM doctor ORDER BY 3;
-- SI NO SE LLAMAN IGUAL LAS COLUMNAS EL ORDER BY CON NOMBRE NO FUNCIONARA, POR ESO USAR SIEMPRE NUMERANDO
-- POR SUPUESTO PODEMOS FILTRAR LOS DATOS DE LA CONSULTA.
-- MOSTRAR LOS DATOS DE LAS PERSONAS QUE COBREN MENOS DE 300000
SELECT apellido, oficio, salario FROM emp WHERE salario < 300000 UNION SELECT apellido, funcion, salario FROM plantilla WHERE salario < 300000 UNION SELECT apellido, especialidad, salario FROM doctor WHERE salario < 300000 ORDER BY 1;
-- CADA FILTRO ES AFECTADO A CADA UNA DE LAS COLUMNAS
-- CADA WHERE ES INDEPENDIENTE, SE HACEN EN CADA SELECT

-- UNION ELIMINA LOS RESULTADOS REPETIDOS
SELECT apellido, oficio FROM emp UNION SELECT apellido, oficio FROM emp;
-- SI QUEREMOS RESULTADOS REPETIDOS DEBEMOS USAR UNION ALL
SELECT apellido, oficio FROM emp UNION ALL SELECT apellido, oficio FROM emp;

-- SELECT TO SELECT
-- ES UNA CONSULTA SOBRE UN CURSOR (SELECT)
-- CUANDO HACEMOS UN SELECT EN REALIDAD ESTAMOS RECUPERANDO DATOS DE UNA TABLA
-- ESTE TIPO DE CONSULTAS NOS PERMITEN RECUPERAR DATOS DE UN SELECT YA REALIZADO.
-- LOS WHERE Y DE MAS SE HACEN SOBRE EL CURSOR.
-- SITAXIS:
SELECT * FROM (SELECT TABLA1.CAMPO1 AS ALIAS, TABLA1.CAMPO2 FROM TABLA1 UNION TABLA2.CAMPO1, TABLA2.CAMPO2 FROM TABLA2) CONSULTA WHERE CONSULTA.ALIAS = 'VALOR';

-- QUEREMOS MOSTRAR LOS DATOS DE TODAS LAS PERSONAS DE MI BBDD (EMP, DOCTOR, PLANTILLA)
-- SOLAMENTE QUEREMOS LOS QUE COBREN MENOS DE 300000
SELECT * FROM (SELECT apellido, oficio, salario AS sueldo FROM emp UNION SELECT apellido, funcion, salario FROM plantilla UNION SELECT apellido, especialidad, salario FROM doctor) datos WHERE datos.sueldo < 300000  ORDER BY 1;

-- CONSULTAS A NIVEL DE FILA
-- SON CONSULTAS CREADAS PARA DAR FORMA A LA SALIDA DE DATOS
-- NO MODIFICAN LOS DATOS DE LA TABLA, LOS MUESTRAN DE OTRA FORMA SEGUN YO LOS NECESITE. VAN CON PREGUNTAS EN LAS CONSULTAS.
-- 1) SINTAXIS EALUANDO UN CAMPO DE IGUALDAD:
SELECT CAMPO1, CAMPO2, CASE CAMPO3 WHEN 'DATO1' THEN 'VALOR1' WHEN 'DATO2' THEN 'VALOR2' ELSE 'VALOR3' END AS ALIAS FROM TABLA; 

SELECT * FROM plantilla;
-- MOSTRAMOS LOS DATOS DE LA PLANTILLA PERO CON SU TURNO QUE SE VEA BIEN
SELECT apellido, funcion, CASE turno WHEN 'T' THEN 'TARDE' WHEN 'M' THEN 'MAÑANA' WHEN 'N' THEN 'NOCHE' END AS turno_alargado FROM plantilla;

-- 2) EVALUAR POR UN OPERADOR (RANGO, MAYOR O MENOR, DISTINTO)
SELECT campo1, campo2, CASE WHEN campo3 <= 800 THEN 'resultado' WHEN campo3 > 800 THEN 'resultado2' ELSE 'resultado3'  END AS formato FROM tabla;

-- MOSTRAR SALARIOS DE LA PLANTILLA
SELECT * FROM plantilla;
SELECT apellido, funcion, salario, CASE WHEN salario >= 250000 THEN 'salario correcto' WHEN salario >= 170000 AND salario < 250000 THEN 'salario medio' ELSE 'becario' END AS rango_salarial FROM plantilla;

SELECT apellido, funcion, salario,
    CASE WHEN salario >= 250000 THEN 'salario correcto'
    WHEN salario >= 170000 AND salario < 250000 THEN 'salario medio'
    ELSE 'becario'
END AS rango_salarial
FROM plantilla;


--                                              EJERCICIOS

-- EJERCICIO 1
-- MOSTRAR LA SUMA SALARIAL DE LOS EMPLEADOS POR SU NOMBRE DE DEPARTAMENTO
SELECT dept.dnombre AS departamento, SUM (emp.salario) AS suma_salarial FROM dept INNER JOIN emp ON dept.dept_no = emp.dept_no GROUP BY dept.dnombre;

-- EJERCICIO 2
-- MOSTRAR LA SUMA SALARIAL DE LOS DOCTORES POR SU HOSPITAL
SELECT hospital.nombre AS hospital, SUM (doctor.salario) AS suma_salarial FROM hospital INNER JOIN doctor ON hospital.hospital_cod = doctor.hospital_cod GROUP BY hospital.nombre;

-- EJERCICIO 3
-- ME GUSTARIA PODER VER TODO JUNTO EN UNA MISMA CONSULTA
SELECT dept.dnombre AS departamento_u_hospital, SUM (emp.salario) AS suma_salarial FROM dept INNER JOIN emp ON dept.dept_no = emp.dept_no GROUP BY dept.dnombre UNION SELECT hospital.nombre AS hospital, SUM (doctor.salario) AS suma_salarial FROM hospital INNER JOIN doctor ON hospital.hospital_cod = doctor.hospital_cod GROUP BY hospital.nombre;



-- CONSULAS DE ACCION
-- SON CONSULTAS PARA MODIFICAR LOS REGISTROS DE LA BBDD
-- EN ORACLE, LAS CONSULAS DE ACCION SON TRANSACCIONALES, ES DECIR, SE ALMACENAN DE FORMA TEMPORAL POR SESION.
-- PARA DESHACER LOS CAMBIOS O HACERLOS PERMANENTES TENEMOS DOS PALABRAS:
-- COMMIT: HACE LOS CAMBIOS PERMANENTES
-- ROLLBACK: DESHACE LOS CAMBIOS REALIZADOS

-- EJEMPLO:
-- 1) INSERTO 2 REGISTROS NUEVOS
-- 2) COMMIT: REGISTRA DE FORMA PERMANENTE EL PUNTO 1
-- 3) INSERTO OTRO REGISTRO NUEVO
-- 4) ROLLBACK: SOLMENTE QUITA EL PUNTO 3

-- TENEMOS 3 TIPOS DE CONSULTAS DE ACCIONES
-- INSERT: INSERTA UN NUEVO REGISTRO EN UNA LA TABLA
-- UPDATE: MODIFICA UNO O MAS REGISTROS DE UNA TABLA
-- DELETE: ELIMINA UNO O MAS REGISTROS DE UNA TABLA
-----------------------


-- INSERT 
-- CADA REGISTRO A INSERTAR ES UNA INSTRUCCION INSERT, SI QUEREMOS INSERTAR 5 REGISTROS SON 5 INSERT
-- TENEMOS DOS TIPOS DE SINTAXIS:
-- 1) INSERTAR TODOS LOS DATOS DE LA TABLA: DEBEMOS INDICAR TODAS LAS COLUMNAS/CAMPOS DE LA TABLA Y EN EL MISMO ORDEN QUE ESTEN EN LA PROPIA TABLA.
-- INSERT INTO tabla VALUES (valor1, valor2, valor3, valor4);
-- EJEMPLOS:

INSERT INTO dept VALUES (50, 'ORACLE', 'BERNABEU');
SELECT * FROM dept;
ROLLBACK;

INSERT INTO dept VALUES (50, 'ORACLE', 'BERNABEU');
COMMIT;
INSERT INTO dept VALUES (51, 'BORRAR', 'BORRAR');
ROLLBACK;
SELECT * FROM dept;

-- 2) INSERTAR SOLAMENTE ALGUNOS DATOS DE LA TABLA: DEBEMOS INDICAR EL NOMBRE DE LAS COLUMNAS QUE DESEAMOS INSERTAR Y LOS VALORES IRAN EN DICHO ORDEN, LA TABLA NO TIENE NADA QUE VER.
-- INSERT INTO tabla (campo3, campo7) VALUES (valor3, valor7);
-- EJEMPLOS:
SELECT * FROM dept;
INSERT INTO dept (dept_no, loc) VALUES (55, 'ALMERIA');

-- LAS SUBCONSULTAS SON SUPER UTILES SI ESTAMOS EN CONSULTAS DE ACCION
-- NECESITO UN DEPARTAMENTO DE SIDRA EN GIJON.
-- GENERAR EL SIGUIENTE NUMERO DISPONIBLE EN LA CONSULTA DE ACCION
SELECT * FROM dept;
SELECT MAX (dept_no) + 1 FROM dept;
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'SIDRA', 'GIJON');
INSERT INTO dept VALUES (56, 'SIDRA', 'GIJON');
ROLLBACK;


-- DELETE
-- ELIMINA UNA O MAS FILAS DE UNA TABLA, SI NO EXISTE NADA PARA ELIMINAR NO HACE NADA
-- DELETE FROM tabla;
-- LA SINTAXIS ANTERIOR ELIMINA TODOS LOS REGISTROS DE LA TABLA
-- OPCIONAL, INCLUIR WHERE
-- ELIMINAR EL DEARTAMENTO DE ORACLE:
SELECT * FROM dept;
DELETE FROM dept WHERE dnombre = 'ORACLE';
SELECT * FROM dept;
ROLLBACK;

-- MUY UTIL UTILIZAR SUBCONSULTAS PARA DELETE
-- ELIMINAR TODOS LOS EMPLEADOS DE GRANADA
DELETE FROM emp WHERE dept_no = (SELECT dept_no FROM dept WHERE loc = 'GRANADA');
SELECT * FROM dept;
SELECT * FROM emp;
ROLLBACK;


-- UPDATE
-- MODIFICA UNA O VARIAS FILAS DE UNA TABLA, PUEDE MODIFICAR VARIAS COLUMNAS A LA VEZ
-- UPDATE tabla SET campo1 = valor1, campo2 = valor2;
-- ESTA CONSULTA MODIFICA TODAS LAS FILAS DE LA TABLA, ES CONVENIENTE USAR UN WHERE
-- MODIFICAR EL SALARIO DE LA PLANTILLA DEL TURNO DE NOCHE, TODOS GANARAN 315000
SELECT * FROM plantilla;
UPDATE plantilla SET salario = 315000 WHERE turno = 'N';

-- MODIFICAR LA CIUDAD Y EL NOMBRE DEL DEPARTAMENTO 10. SE LLAMARA CUENTAS Y NOS VAMOS A TOLEDO
UPDATE dept SET loc = 'TOLEDO', dnombre = 'CUENTAS' WHERE dept_no = 10;
SELECT * FROM dept;
ROLLBACK;

-- PODEMOS MANTENER EL VALOR DE UNA COLUMNA Y ASIGNAR "ALGO" CON OPERACIONES MATEMATICAS
-- INCREMENTAR EN 1 EL SALARIO DE TODOS LOS EMPLEADOS
SELECT * FROM emp;
UPDATE emp SET salario = salario + 1;

-- PODEMOS UTILIZAR SUBCONSULTAS EN UPDATE
-- 1) SI LAS SUBCONSULTAS ESTAN EN EL SET, SOLAMENTE DEBEN DEVOLVER UN DATO
SELECT * FROM emp;
-- ARROYO ESTA ENVIDIOSO DE SALA, PONER EL MISMO SALARIO A ARROYO QUE SALA
UPDATE emp SET salario = (SELECT salario FROM emp WHERE apellido = 'sala') WHERE apellido = 'arroyo';

-- LOS CATALANES ESTAN SUBIDOS Y LES BAJAMOS EL SUELDO A LA MITAD.
-- PONER A LA MITAD EL SUELDO DE LOS EMPELADOS DE BARCELONA
SELECT * FROM emp;
SELECT * FROM DEPT;
UPDATE emp SET salario = salario / 2 WHERE dept_no = (SELECT dept_no FROM dept WHERE loc = 'BARCELONA');
ROLLBACK;

--                                              EJERCICIOS

-- EJERCICIO 1
-- Dar de alta con fecha actual al empleado José Escriche Barrera como programador perteneciente al departamento de producción.  Tendrá un salario base de 70000 pts/mes y no cobrará comisión.
SELECT * FROM emp;
INSERT INTO emp (emp_no, apellido, oficio, fecha_alt, salario, comision, dept_no) VALUES (( SELECT MAX (emp_no) + 1 FROM emp), 'escriche', 'PROGRAMADOR', '31/03/25', 70000, 0, (SELECT DEPT_NO FROM DEPT WHERE DNOMBRE='PRODUCCIÓN')); 


-- EJERCICIO 2
-- Se quiere dar de alta un departamento de informática situado en Fuenlabrada (Madrid).
SELECT * FROM DEPT;
INSERT INTO dept VALUES (60, 'INFORMATICA', 'FUENLABRADA');

-- EJERCICIO 3
-- El departamento de ventas, por motivos peseteros, se traslada a Teruel, realizar dicha modificación.
SELECT * FROM DEPT;
UPDATE dept SET loc = 'TERUEL' WHERE loc = 'BARCELONA';

-- EJERCICIO 4
--En el departamento anterior (ventas), se dan de alta dos empleados: Julián Romeral y Luis Alonso.  Su salario base es el menor que cobre un empleado, y cobrarán una comisión del 15% de dicho salario.
SELECT * FROM emp;

INSERT INTO emp (emp_no, oficio, apellido, salario, comision, dept_no)
VALUES (
(SELECT MAX (emp_no) + 1 FROM emp),
'EMPLEADO',
'romeral', 
(SELECT MIN (salario) FROM emp WHERE oficio = 'EMPLEADO'),
(SELECT MIN (salario) * 0.15 FROM emp WHERE oficio = 'EMPLEADO'),
30); 

ROLLBACK;

-- EJERCICIO 5
-- Modificar la comisión de los empleados de la empresa, de forma que todos tengan un incremento del 10% del salario.
SELECT * FROM emp;
UPDATE emp SET comision = salario * 0.1;

-- EJERCICIO 6
-- Incrementar un 5% el salario de los interinos de la plantilla que trabajen en el turno de noche.
SELECT * FROM plantilla;
UPDATE plantilla SET salario = salario + (salario * 0.05) WHERE funcion = 'INTERINO' AND turno = 'N';
ROLLBACK;

-- EJERCICIO 7
-- Incrementar en 5000 Pts. el salario de los empleados del departamento de ventas y del presidente, tomando en cuenta los que se dieron de alta antes que el presidente de la empresa.
SELECT * FROM emp;
SELECT * FROM dept;
UPDATE emp SET salario =  salario + 5000 WHERE fecha_alt <= '17/11/95' AND  dept_no = (SELECT dept_no FROM dept WHERE dnombre = 'VENTAS') OR oficio = 'PRESIDENTE';

-- EJERCICIO 8
-- El empleado Sanchez ha pasado por la derecha a un compañero.  Debe cobrar de comisión 12.000 ptas más que el empleado Arroyo y su sueldo se ha incrementado un 10% respecto a su compañero.
SELECT * FROM emp;
UPDATE emp SET comision = (SELECT comision + 12000 FROM emp WHERE apellido = 'arroyo'), salario = (SELECT salario * 1,10 FROM emp WHERE apellido = 'arroyo') WHERE apellido = 'sanchez';

-- EJERCICIO 9
-- Se tienen que desplazar cien camas del Hospital SAN CARLOS para un Hospital de Venezuela.  Actualizar el número de camas del Hospital SAN CARLOS.
SELECT * FROM hospital;
UPDATE hospital SET num_cama = num_cama - 100 WHERE nombre = 'san carlos';

-- EJERCICIO 10
-- Subir el salario y la comisión en 100000 pesetas y veinticinco mil pesetas respectivamente a los empleados que se dieron de alta en este año.
SELECT * FROM emp;
UPDATE emp SET salario = salario + 100000, comision = comision + 25000 WHERE fecha_alt >= '01/01/2025';

-- EJERCICIO 11
-- Ha llegado un nuevo doctor a la Paz.  Su apellido es House y su especialidad es Diagnostico.   Introducir el siguiente número de doctor disponible.
SELECT * FROM doctor;
INSERT INTO doctor (doctor_no, apellido, especialidad) VALUES ((SELECT MAX (doctor_no) + 1 FROM doctor), 'House','Diagnostico');




-- INSERT ANSI SQL (MENOS RAPIDO)
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'into', 'into');
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'into2', 'into2');
INSERT INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'into3', 'into3');

SELECT * FROM dept;
SELECT * FROM DUAL;

-- INSERT ALL (MAS RAPIDO)
INSERT ALL 
    INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'all', 'all')
    INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'all2', 'all2')
    INTO dept VALUES ((SELECT MAX (dept_no) + 1 FROM dept), 'all3', 'all3')
SELECT * FROM dual;

-- EN LOS INSERT ALL NO PUEDES AÑADIR UN INCREMENTAR COMO EN EL EJEMPLO ANTERIOR YA QUE TE ASIGNA EL MISMO NUMERO A TODAS LAS FILAS

-- CREAR TABLAS CON CREATE, UTIL PARA HACER COPIAS DE TABLAS

CREATE TABLE departamentos AS SELECT * FROM dept;
DESCRIBE dept;

SELECT * FROM departamentos;
DESCRIBE departamentos;

CREATE TABLE doctoreshospital AS SELECT doctor.doctor_no as iddoctor, doctor.apellido, hospital.nombre, hospital.telefono FROM doctor INNER JOIN hospital ON doctor.hospital_cod = hospital.hospital_cod;
SELECT * FROM DOCTORESHOSPITAL;

-- INSERT INTO SELECT
-- ESTA INSTRUCCION NOS PERMIE COPIAR DATOS DE UNA TABLA ORIGEN A UNA TABLA DESTINO.
-- LA DIFERENCIA CON CREATE SELECT ESTA EN QUE LA TABLA DEBE DE EXISTIR, SIN TABLA DE DESINO NO PODEMOS EJECUTAR ESTA INSRUCCION
-- LA TABLA DE DESTINO TIENE QUE TENER LA MISMA ESTRUCTURA DE LA TABLA DE ORIGEN
-- SINTAXIS

INSERT INTO destino SELECT * FROM origen;

-- EJEMPLO
-- VAMOS A COPIAR LOS DATOS DE LA TABLA DEPT DENTRO DE LA TABLA DEPARTAMENTOS
INSERT INTO departamentos SELECT * FROM dept;
SELECT * FROM departamentos;


-- VARIABLES DE SUSTITUCON

SELECT apellido, oficio, salario, comision FROM emp WHERE emp_no = '&numero';
SELECT apellido, &&dato, salario, comision FROM emp WHERE &dato = '&dato2';
SELECT * FROM emp;
-- LA VARIABLE &DATO AL EJECUTARLA Y ASIGNARLE 'OFICIO' YA QUEDA FIJA COMO 'OFICIO', SI QUEREMOS USAR OTRA VARIABLE DEBEREMOS DE DARLE OTRA QUE NOS INVENTEMOS QUE ESTE LIBRE

-- NATURAL JOIN
-- MUESTRA TODOS LOS DATOS DE LAS DOS COLUMNAS O LOS DATOS QUE INDIQUEMOS SIN TENER QUE USAR EL INNER JOIN - ON.
SELECT apellido, oficio, dnombre, loc, dept_no, apellido FROM emp NATURAL JOIN dept;
SELECT * FROM emp NATURAL JOIN dept, enfermo;

-- USING
SELECT apellido, oficio, dnombre FROM emp INNER JOIN dept USING (dept_no);


-- NECESITO SABER LOS EMPLEADOS QUE TRABAJAN PARA negro (7698)
SELECT * FROM emp WHERE dir = 7698;

-- TENEMOS UN PRESIDENTE QUE ES EL JEFE DE LA EMPRESA: REY (7839)
-- MOSTRAR TODOS LOS EMPLEADOS QUE TRABAJAN PARA REY
SELECT * FROM emp WHERE dir = 7839;

SELECT LEVEL, DIR , EMP_NO, APELLIDO FROM EMP CONNECT BY EMP_NO = PRIOR DIR START WITH APELLIDO = 'jimenez';

SELECT LEVEL, DIR , EMP_NO, APELLIDO FROM EMP  CONNECT BY PRIOR EMP_NO = DIR START WITH APELLIDO='jimenez';

-- MOSTRAR LOS EMPLEADOS SUBORDINADOS A PARTIR DEL DIRECTOR jimenez

SELECT LEVEL AS nivel, dir, oficio, apellido FROM emp CONNECT BY PRIOR EMP_NO = DIR START WITH APELLIDO='jimenez' ORDER BY 1;

-- ARROYO HA METIDO LA MATA, QUIERO VER A TODOS SUS JEFES EN MI DESPACHO, MANDA EL LISTADO, SOY REY

SELECT LEVEL AS nivel, apellido, oficio FROM emp CONNECT BY emp_no = PRIOR dir START WITH apellido = 'arroyo';

-- SYS_CONNECT_BY_PATH (apellido,' ') AS relacion, PARA AÑADIR GRAFICAMENTE EL RESULTADO CON SEPARADORES EN UNA COLUMNA

SELECT LEVEL AS nivel, apellido, oficio, SYS_CONNECT_BY_PATH (apellido,' ') AS relacion FROM emp CONNECT BY emp_no = PRIOR dir START WITH apellido = 'arroyo';


-- INTERSECT (COGE LOS DATOS DE DOS TABLAS O UNA MISMA TABLA, UTIL PARA VER DATOS QUE SE HAN PODIDO MODIFICAR)

SELECT * FROM PLANTILLA WHERE TURNO='T' INTERSECT SELECT* FROM PLANTILLA WHERE FUNCION='ENFERMERA';

-- MINUS (MUESTRA LOS REGISTROS DEL PRIMER SELECT DE UNA TABLA QUITANDO LOS DATOS DEL RESULTADO DEL SEGUNDO SELECT)

SELECT * FROM PLANTILLA WHERE TURNO='T'MINUS SELECT * FROM PLANTILLA WHERE FUNCION='ENFERMERA';







