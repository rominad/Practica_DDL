CREATE DATABASE Aeropuerto
USE Aeropuerto 
go
-----------------------------------------------------------------------------------------------------------
-- CIUDADES --
CREATE TABLE Ciudades(
CiudadId ,
Nombre,
constraint Ciudades CHECK (),
)
--test

go
-----------------------------------------------------------------------------------------------------------
-- AEROPUERTOS--
CREATE TABLE Aeropuertos(
AeropuertoID,
constraint Ciudades CHECK (),
)
--test

go
-----------------------------------------------------------------------------------------------------------
-- RUTAS --
CREATE TABLE Rutas(
RutaId
DistanciaKms
TiempoMinutos
constraint Ciudades CHECK (),
)
--test

GO
-----------------------------------------------------------------------------------------------------------
-- RUTA_DIA_AERONAVE --
CREATE TABLE RUTA_DIA_AERONAVE(
Horario
VueloNumero
Habilitado_hasta
constraint Ciudades CHECK (),
)
--test

GO
-----------------------------------------------------------------------------------------------------------
-- AERONAVES --
CREATE TABLE Aeronaves(
AeronaveId,
Matricula varchar(5),
Modelo varchar(4),
MaximosPasajeros,
MaximoCarga,
constraint Ciudades CHECK (),
)
--test

GO
-----------------------------------------------------------------------------------------------------------
--DIAS
CREATE TABLE Dias(
DiaId,
Nombre,
constraint Ciudades CHECK (),
)
--test

GO
-----------------------------------------------------------------------------------------------------------
-- VUELOS --
CREATE TABLE Vuelos(
Fecha
constraint Ciudades CHECK (),
)
--test

GO
-----------------------------------------------------------------------------------------------------------
-- PASAJES --
CREATE TABLE Pasajes(
Asiento
PasajeroId
PaisOrigen
TipoDocumento
NúmeroDocumento
Nombre
constraint Ciudades CHECK (),
)
--test

GO
-----------------------------------------------------------------------------------------------------------
-- PASAJEROS --
CREATE TABLE Pasajeros(
constraint Ciudades CHECK (),
)
--test

