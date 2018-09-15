CREATE DATABASE tienda
--Para borrar la tabla:
--DROP DATABASE tienda
go

USE tienda 
go
-----------------------------------------------------------------------------------------------------------
-- RUBROS -- 
CREATE TABLE Rubros(
Idrubro smallint identity(0,1),
Descripcion varchar(30) not null,
constraint ck_rubros_descripcion CHECK (descripcion like '___%'),
constraint pk_Rubros PRIMARY KEY(idrubro)
)
--test
Select * from Rubros
Insert into Rubros (Descripcion) values ('Bebidas')
Insert into Rubros (Descripcion) values ('')
Insert into Rubros (Descripcion) values ('ABC')
Insert into Rubros (Descripcion) values ('1234567890123456789012345678901')
go
-----------------------------------------------------------------------------------------------------------
-- ARTICULOS --
CREATE TABLE Articulos(
IdArticulo char(5) not null,
Nombre varchar(30) not null,
Precio money not null,
--este es el campo de la entidad fuerte
Idrubro smallint identity(0,1) not null, 
constraint ck_articulos_idarticulo CHECK (IdArticulo like '[A-Z,a-z][0-9][A-Z,0-9]'),
constraint ck_articulos_nombre CHECK (Nombre like '___%'),
constraint ck_articulos_precio_mayor_cero CHECK (Precio > 0),
constraint fk_articulos_rubros_idrubros FOREIGN KEY (Idrubro) REFERENCES Rubros (Idrubro),
constraint pk_Articulos PRIMARY KEY (idarticulo),
constraint uq_articulos_nombre UNIQUE (nombre) --esto crea un indice 
-- el orden de las reglas: primero se hacen las checks,foraneas,primary key ,unique
)
--test
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
--primero se comprueban los nulos despues los checks
go
-----------------------------------------------------------------------------------------------------------
-- STOCK --
CREATE TABLE Stock(
Cantidad smallint not null ,
constraint ck_stock_cantidad_mayor_cero CHECK (Cantidad > -1),
constraint fk_stock_idArticulos FOREIGN KEY (idArticulos) REFERENCES Articulos (idArticulos),
constraint fk_stock_idDeposito FOREIGN KEY (idDeposito) REFERENCES Deposito (idDeposito)
)
--test
-----------------------------------------------------------------------------------------------------------
--DEPOSITO--
CREATE TABLE Depositos(
idDeposito char(3)not null ,
Nombre varchar(50) UNIQUE not null ,
constraint ck_idDeposito CHECK (idDeposito like '[A-Z,a-z][0-9][A-Z,0-9]'),
constraint ck_Nombre CHECK (Nombre like '___%'),

constraint pk_Deposito PRIMARY KEY(idDeposito),
constraint uq_deposito_nombre UNIQUE (Nombre) --esto crea un indice 

)
--test
-----------------------------------------------------------------------------------------------------------
--MOVIMIENTOS--
CREATE TABLE Movimientos(
idMovimiento tinyint identity(0,1),
Cantidad smallint default 1 ,
Fecha datetime default getDate(),
constraint ck_Cantidad CHECK (Cantidad > -1),
constraint fk_movimientos_idArticulos FOREIGN KEY (idArticulos) REFERENCES Articulos (idArticulos),
constraint fk_movimientos_idDeposito FOREIGN KEY (idDeposito) REFERENCES Deposito (idDeposito),
constraint fk_movimientos_idOperacion FOREIGN KEY (idOperacion) REFERENCES Operaciones (idOperacion),
constraint pk_Movimientos PRIMARY KEY(idMovimiento)

)
--test
-----------------------------------------------------------------------------------------------------------
-- OPERACIONES
CREATE TABLE Operaciones(
idOperacion tinyint identity(0,1),
Operando char default '+' ,
Descripcion char(30) UNIQUE default 'Ingreso',
constraint ck_Operando CHECK (Operando like '[+,-]'),
constraint ck_Descripcion CHECK (Descripcion like '___%'),
constraint pk_Operaciones PRIMARY KEY(idOperacion),
constraint uq_operaciones_Descripcion UNIQUE (Descripcion) --esto crea un indice 
)
--test
