CREATE DATABASE tienda
USE tienda 

CREATE TABLE Rubros(
idrubro smallint identity(0,1),
Descripcion varchar(30) not null CHECK (descripcion > 3)
)
CREATE TABLE Articulos(
idArticulo char(5) not null CHECK [A-Z][A-Z][0-9][0-9][0-9],
Nombre char(30) UNIQUE not null CHECK (Nombre > 3),
Precio decimal(10,2) not null CHECK (Precio > 0)
)
CREATE TABLE Stock(
Cantidad smallint not null CHECK (Cantidad > -1)
)
CREATE TABLE Depositos(
idDeposito char(3)not null CHECK [A-Z,a-z][0-9][A-Z,0-9],
Nombre varchar(50) UNIQUE not null CHECK (Nombre > 3)
)
CREATE TABLE Movimientos(
idMovimiento tinyint identity(0,1),
Cantidad smallint default 1 CHECK (Cantidad > -1),
Fecha datetime defaul Today
)
CREATE TABLE Operaciones(
idOperacion tinyint identity(0,1),
Operando char default + CHECK ['+','-'],
Descripcion char(30) UNIQUE default "ingreso" CHECK (Descripcion > 3)
)