CREATE DATABASE Aeropuerto
--Para borrar la tabla:   DROP DATABASE Aeropuerto
--Para borrar tablas:     DROP table Pasajeros
GO
USE Aeropuerto 
GO
CREATE TABLE Aeronaves(
AeronaveId smallint not null,
Matricula varchar(5) not null,
Modelo varchar(4) not null,
MaximosPasajeros smallint not null ,
MaximoCarga tinyint not null,
constraint ck_aeronaves_matricula_lv CHECK (Matricula like '[L,V]%'),
constraint ck_aronaves_modelo_letraytresnumeros CHECK (Modelo like '[A,B,J][0-9][0-9][0-9]'),
constraint ck_aeronaves_maximosPasajeros_mayoracero CHECK (MaximosPasajeros > 0),
constraint ck_aeronaves_maximoCarga_mayoracero CHECK (MaximoCarga > 0),
constraint pk_aeronaves PRIMARY KEY(AeronaveId),
constraint uq_aeronaves_aeronaveId_unico UNIQUE (AeronaveId),
constraint uq_aeronaves_matricula_unico UNIQUE (Matricula)
)
GO
CREATE TABLE Aeropuertos(
AeropuertoID char(3) not null,
constraint ck_aeropuertos_aeropuertoId_trescaracteres CHECK (AeropuertoId like '___'),
constraint uq_aeropuertos_aeropuertoId_unico UNIQUE (AeropuertoId)
)
GO
CREATE TABLE Ciudades(
CiudadId int not null,
Nombre varchar(50) not null,
constraint ck_ciudades_ciudadId_positivo CHECK ( CiudadId > 0 ),
constraint uq_ciudades_ciudadId_unico UNIQUE (CiudadId)
)
GO
CREATE TABLE Dias(
DiaId smallint not null,
Nombre varchar(15) not null,
constraint ck_dias_diaId_menorasiete CHECK ( DiaId < 7),
constraint uq_dias_diaId_unico UNIQUE (DiaId)
)
GO
CREATE TABLE Rutas(
RutaId smallint not null,
DistanciaKms smallint,
TiempoMinutos smallint,
constraint ck_rutas_distanciaKms_positivo CHECK (DistanciaKms > 0),
constraint uq_rutas_rutaID_unico UNIQUE (RutaID)
)
GO
CREATE TABLE RUTA_DIA_AERONAVE(
Horario char(4) not null,
VueloNumero varchar(6) not null,
Habilitado_hasta date default getDate(),--solo fechas contemporaneas 3 bites
constraint ck_rutaDiaAeronave_horario_rango CHECK (Horario like '[0-23][0-23][0-59][0-59]'),
constraint ck_rutaDiaAeronave_vueloNumero_letrasynumeros CHECK (VueloNumero like '[A-Z][A-Z][0-9][0-9][0-9][0-9]'),
--constraint ck_rutaDiaAeronave_habilitadoHasta CHEK()
)
GO
CREATE TABLE Vuelos(
Fecha date default getDate()  not null,--solo fechas contemporaneas 3 bites
constraint ck_vuelos_fecha_mayoroigualhoy CHECK (Fecha >= getdate()),
constraint uq_vuelos_fecha_unico UNIQUE (Fecha)
)
GO
CREATE TABLE Pasajes(
Asiento varchar(3) not null,
constraint ck_pasajes_asiento_letrasynumeros CHECK(Asiento like '[A-H][0-9][0-9]')
)
GO
CREATE TABLE Pasajeros(
PasajeroId int identity not null,
PaisOrigen varchar(2) default 'AR'not null,
TipoDocumento varchar(3) not null,
NumeroDocumento bigint not null,
Nombre varchar(50)not null,
constraint ck_pasajeros_pasajeroId_positivo CHECK (PasajeroId > 0),
constraint ck_pasajeros_paisOrigen_ar CHECK (PaisOrigen like '[A][R]'),
constraint ck_pasajeros_tipoDocumento_dni CHECK (TipoDocumento like '[D][N][I]'),
constraint ck_pasajeros_numeroDocumento_positivo CHECK (NumeroDocumento > 0),
constraint uq_pasajeros_pasajeroId_unico UNIQUE (PasajeroId)
)
------------------ LOS TEST ---------------------------------
--Select * from 
--Insert into Aeronaves (AeronaveId,Matricula,Modelo,MaximoPasajero,MaximoCarga) values ()

Select *  from Aeropuertos
insert into Aeropuertos (AeropuertoID) values ('asdd')
insert into Aeropuertos (AeropuertoID) values ('PSS')

Select *  from Ciudades
insert into Ciudades (CiudadId,Nombre) values (-1,'Ciudad')
insert into Ciudades (CiudadId,Nombre) values (1,'holauntoqueconpaulaquienhablacomo1holauntoqueconpaulaquienhablacomo')
insert into Ciudades (CiudadId,Nombre) values (1,'Posadas')

Select * from  Dias
insert into Dias (Nombre) values ('dia')
insert into Dias (DiaId,Nombre) values (8,'estoesunaoracionmuylargamuylargamuylargalarguisimasabesprobando')
insert into Dias (DiaId,Nombre) values (1,'Lunes')

Select *  from Rutas 
insert into Rutas (DistanciaKms,TiempoMinutos) values (-1,12)
insert into Rutas (RutaID,DistanciaKms,TiempoMinutos) values (1,-1,12)
insert into Rutas (RutaID,DistanciaKms,TiempoMinutos) values (1,1000,60000)
insert into Rutas (RutaID,DistanciaKms,TiempoMinutos) values (1,100,600)

Select * from Ruta_Dia_Aeronave
insert into Ruta_dia_aeronave (Horario,VueloNumero,Habilitado_hasta) values ('9010','a1123',getdate())
insert into Ruta_dia_aeronave (Horario,VueloNumero,Habilitado_hasta) values ('2220','a1123',getdate())
insert into Ruta_dia_aeronave (Horario,VueloNumero,Habilitado_hasta) values ('2220','pp1234',getdate())


Select * from vuelos
insert into Vuelos (Fecha) values ('')
insert into Vuelos (Fecha) values (getdate()-1)
insert into Vuelos (Fecha) values (getdate()+1)

Select * from Pasajes
insert into Pasajes (Asiento) values ('123')
insert into Pasajes (Asiento) values ('a12')

Select * from Pasajeros
insert into Pasajeros (PasajeroId,PaisOrigen,TipoDocumento,Nombre) values (-1,'ar','dni',1)
insert into Pasajeros (PaisOrigen,TipoDocumento,NumeroDocumento,Nombre) values ('br','dni',1,'Fabio')
insert into Pasajeros (PaisOrigen,TipoDocumento,NumeroDocumento,Nombre) values ('ar','dna',1,'Fabio')
insert into Pasajeros (PaisOrigen,TipoDocumento,NumeroDocumento,Nombre) values ('ar','dni',-1,'Fabio')
insert into Pasajeros (PaisOrigen,TipoDocumento,NumeroDocumento,Nombre) values ('ar','dna',1,'estoesunapruebaestoesunapruebaestoesunapruebaestoesunapruebaestoesunaprueba')
insert into Pasajeros (PaisOrigen,TipoDocumento,NumeroDocumento,Nombre) values ('ar','dni',2424112,'Fabio')