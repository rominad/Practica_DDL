--1.3 - pruebas default
INSERT INTO Rubros (id,descripcion) values (1,"Descripcion")
INSERT INTO Rubros (descripcion) values ("nueva descr")
INSERT INTO Movimientos (Cantidad,Fecha) values ()
INSERT INTO Movimientos (Cantidad,Fecha) values (15)
INSERT INTO Operaciones (idOperacion,Operando,Descripcion) values (3,,hola)
INSERT INTO Operaciones (Operando,Descripcion) values ()

--.4 pruebas nulo
INSERT INTO Rubros (Descripcion) VALUES ()
INSERT INTO Articulos (Nombre,Precio) VALUES (,'Mouse',350)
INSERT INTO Articulos (Nombre,Precio) VALUES ('',350)
INSERT INTO Articulos (Nombre,Precio) VALUES ('Mouse',)
INSERT INTO Stock (Cantidad) VALUES ()
INSERT INTO Depositos (Nombre) VALUES ('Deposito')
INSERT INTO Depositos (Nombre) VALUES (111,'')

--1.5 pruebas dominios

--1.6 pruebas check 
INSERT INTO Rubros (Descripcion) VALUES ('a2')
INSERT INTO Articulos (Nombre,Precio) VALUES ('AA12A','Arti',1500)
INSERT INTO Articulos (Nombre,Precio) VALUES ('AA123','Ar',1500)
INSERT INTO Articulos (Nombre,Precio) VALUES ('AA123','Articulo',-2)
INSERT INTO Stock (Cantidad) VALUES (-2)
INSERT INTO Depositos (Nombre) VALUES (1a1,'dep')
INSERT INTO Depositos (Nombre) VALUES (a12,'de')
INSERT INTO Movimientos (Cantidad,Fecha) VALUES (1,-2,Today)

INSERT INTO () VALUES ()
INSERT INTO Operando () VALUES ()
INSERT INTO () VALUES ()
INSERT INTO () VALUES ()

--1.7 prueba valores unicos 
INSERT INTO () VALUES ()
INSERT INTO () VALUES ()