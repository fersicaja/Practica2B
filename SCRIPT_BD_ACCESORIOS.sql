CREATE DATABASE BD_ACCESORIOSCOMP
GO

USE BD_ACCESORIOSCOMP
GO

CREATE TABLE PRODUCTO
(
codigo int PRIMARY KEY,
nombre varchar(50),
descripcion varchar(50),
precio decimal (10,2),
idProveedor int 
Foreign key (idProveedor) references PROVEEDOR (codigo)
);

CREATE TABLE PROVEEDOR
(
codigo int PRIMARY KEY,
nombre varchar(50),
descripcion varchar(50)
);

----------------------------SP--------------------------
Create procedure CRUD (
@codigo int, @nombre varchar(50), @descripcion varchar(50), 
@precio decimal (10,2), @idProveedor int, @condicion int
) 
as
Begin 
if @condicion = 1
Begin
insert into PRODUCTO values (@codigo, @nombre, @descripcion, @precio, @idproveedor);
End
if @condicion = 2
Begin
update PRODUCTO SET codigo=@codigo, nombre=@nombre, descripcion=@descripcion, precio=@precio, idproveedor=@idproveedor
where codigo=@codigo;
End
if @condicion = 3
Begin
delete from PRODUCTO where codigo=@codigo
End
End

create procedure ListarProductos
as
begin
select *FROM PRODUCTO;
end