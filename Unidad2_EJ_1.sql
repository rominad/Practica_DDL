CREATE DATABASE Tienda
--Para borrar la tabla:   DROP DATABASE Tienda
--Para borrar tablas:     DROP table Movimientos
GO
USE Tienda 
GO
CREATE TABLE Rubros(
Idrubro smallint identity(0,1),
Descripcion varchar(30) not null,
constraint ck_rubros_descripcion_longitud_minima CHECK (descripcion like '___%'),
constraint pk_Rubros PRIMARY KEY(idrubro)
)
GO
CREATE TABLE Articulos(
IdArticulo char(5) not null,
Nombre varchar(30) not null,
Precio money not null,
--este es el campo de la entidad fuerte
Idrubro smallint  not null, 
constraint ck_articulos_idarticulo_letrasynumeros CHECK (IdArticulo like '[A-Z,a-z][0-9][A-Z,0-9]'),
constraint ck_articulos_nombre_longitud_minima CHECK (Nombre like '___%'),
constraint ck_articulos_precio_mayor_positivo CHECK (Precio > 0),
constraint fk_articulos_rubros_idrubros FOREIGN KEY (Idrubro) REFERENCES Rubros (Idrubro),
constraint pk_Articulos PRIMARY KEY (idarticulo),
constraint uq_articulos_nombre UNIQUE (nombre) --esto crea un indice, un nonclaster
-- el orden de las reglas: primero se hacen las checks,foraneas,primary key ,unique
)
GO
CREATE TABLE Depositos(
idDeposito char(3)not null ,
Nombre varchar(50) UNIQUE not null ,
constraint ck_Deposito_idDeposito_letrasynumeros CHECK (idDeposito like '[A-Z][0-9]_'),
constraint ck_Deposito_Nombre_mayoratres CHECK (Nombre like '___%'),
constraint pk_Depositos_idDeposito PRIMARY KEY(idDeposito),
constraint uq_Deposito_Nombre_unico UNIQUE (Nombre) --esto crea un indice 
)
GO
CREATE TABLE Stock(
Cantidad smallint not null ,
idArticulos char(5) not null,
idDepositos char(3)not null ,
constraint ck_stock_cantidad_mayoracero CHECK (Cantidad >= 0),
constraint fk_stock_articulosCodigo FOREIGN KEY (idArticulos) REFERENCES Articulos (IdArticulo),
constraint fk_stock_depositoCodigo FOREIGN KEY (idDepositos) REFERENCES Depositos (idDeposito),
constraint pk_stock PRIMARY KEY (idDepositos,idArticulos) -- una columna puede ser PK y FK a la vez....
)
GO
CREATE TABLE Operaciones(
idOperacion tinyint identity,
Operando char default '+' ,
Descripcion char(30) default 'Ingreso',
constraint ck_operaciones_operando_valido CHECK (Operando in ('+','-')),
constraint ck_operaciones_descripcion_mayoratres CHECK (Descripcion like '___%'),
constraint ch_operaciones_idOperaciones_menor100 CHECK (idOperacion <= 100),
constraint pk_operaciones PRIMARY KEY(idOperacion),
constraint uq_operaciones_descripcion_unico UNIQUE (Descripcion) --esto crea un indice 
)
GO
CREATE TABLE Movimientos(
idMovimiento tinyint identity,
Cantidad smallint default 1 ,
Fecha date default getDate(),--solo fechas contemporaneas 3 bites
idArticulos char(5) not null,
idDepositos  char(3)not null ,
idOperaciones  tinyint  not null,
constraint ck_movimientos_fecha_actual CHECK (Fecha >= getdate() -7), --validar fecha con diferencia de 7 dias
constraint ck_movimientos_cantidad_positivo CHECK (Cantidad > 0),
constraint fk_movimientos_depositoCodigo_idDeposito FOREIGN KEY (idDepositos) REFERENCES Depositos(idDeposito),
constraint fk_movimientos_articulosCodigo_idArticulo FOREIGN KEY (idArticulos) REFERENCES Articulos(idArticulo),
constraint fk_movimientos_operacionesCodigo_idOperaciones FOREIGN KEY (idOperaciones) REFERENCES Operaciones(idOperacion),
constraint pk_movimientos PRIMARY KEY(idMovimiento)
)
create index ix_movimientos_fecha on movimientos(Fecha) --se los crea fuera del ciclo
--claster: el orden fisico es como el de la tabla/es unico/. estas opciones son opcionales.si no le
--digo nada es nonclaster x defecto.


-------------------------- LOS TEST -------------------------------------------------------------
Select * from Rubros
Insert into Rubros (Descripcion) values ('')
Insert into Rubros (Descripcion) values ('AB')
Insert into Rubros (Descripcion) values ('1234567890123456789012345678901')
Insert into Rubros (Descripcion) values ('Bebidas')

Select * from Articulos
Insert into Articulos (Nombre) values (null)
Insert into Articulos (Nombre) values ('')
Insert into Articulos (IdArticulo,Nombre) values ('','')
Insert into Articulos (IdArticulo,Nombre,Precio) values ('','',0)
Insert into Articulos (IdArticulo, Nombre, Precio , Idrubro) values ('','Manaos',0,0)
Insert into Articulos (IdArticulo, Nombre, Precio , Idrubro) values ('','Manaos',0,0)
Insert into Articulos (IdArticulo, Nombre, Precio , Idrubro) values ('AB123','Manaos',0,0)
Insert into Articulos (IdArticulo, Nombre, Precio , Idrubro) values ('AB123','Manaos',30,1)
Insert into Articulos (IdArticulo, Nombre, Precio , Idrubro) values ('ABC12','CABALGATA',35,1)
Insert into Articulos (IdArticulo, Nombre, Precio , Idrubro) values ('A2A','CABALGATA',35,3)
--primero se comprueban los nulos despues los checks

Select * from Depositos
insert into Depositos (Nombre) values ('De')
insert into Depositos (idDeposito) values (1)
insert into Depositos (idDeposito,Nombre) values (1,'Fabio')
insert into Depositos (idDeposito,Nombre) values ('a12','Al')
insert into Depositos (idDeposito,Nombre) values ('a12','Deposito1')

Select * from Stock
insert into Stock (Cantidad,idArticulos,idDepositos) values (-1,'a2a','a12')
insert into Stock (Cantidad,idArticulos,idDepositos) values (7,'a2a','a12')

Select * from Operaciones
insert into Operaciones (Operando,Descripcion) values ('=','egreso')
insert into Operaciones (Operando,Descripcion) values ('-','egreso')


Select * from Movimientos
insert into Movimientos (Cantidad,Fecha,idArticulos,idDepositos,idOperaciones) 
values (7,getdate()-9,'a2a','a12',2)
insert into Movimientos (idMovimiento,Cantidad,Fecha,idArticulos,idDepositos,idOperaciones) 
values (1,7,getdate(),'a2b','a12',2)
insert into Movimientos (Cantidad,Fecha,idArticulos,idDepositos,idOperaciones) 
values (7,getdate()-8,'a2','a12',2)
insert into Movimientos (Cantidad,Fecha,idArticulos,idDepositos,idOperaciones) 
values (7,getdate(),'a2','a12',2)
insert into Movimientos (Cantidad,Fecha,idArticulos,idDepositos,idOperaciones) 
values (7,getdate(),'a2a','a1',2)
insert into Movimientos (Cantidad,Fecha,idArticulos,idDepositos,idOperaciones) 
values (7,getdate(),'a2a','a12',2)