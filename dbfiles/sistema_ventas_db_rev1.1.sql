USE sistema_ventas_db;

CREATE TABLE IF NOT EXISTS  tbl_rol(
	cveRol SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(250) NOT NULL,
    clave VARCHAR(100) NOT NULL,
    estatus TINYINT(1)
);

CREATE TABLE IF NOT EXISTS tbl_usuario(
	cveUsuario SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(350) NOT NULL,
    apellidos VARCHAR(450) NOT NULL,
    username VARCHAR(150) NOT NULL,
    password VARCHAR(500) NOT NULL,
    email VARCHAR(250) NOT NULL,
    fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tbl_rol_usuario(
	cveRolUsuario SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cveRol SMALLINT NOT NULL,
    cveUsuario SMALLINT NOT NULL,
    FOREIGN KEY (cveRol) REFERENCES tbl_rol(cveRol),
    FOREIGN KEY (cveUsuario) REFERENCES tbl_usuario(cveUsuario)
);

CREATE TABLE IF NOT EXISTS tbl_categoria(
	cveCategoria SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(250) NOT NULL,
    descripcion VARCHAR(450) NOT NULL,
    cveRegistro SMALLINT NOT NULL,
    FOREIGN KEY (cveRegistro) REFERENCES tbl_usuario(cveUsuario),
    fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tbl_producto(
	cveProducto SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(250) NOT NULL,
    descripcion VARCHAR(450) NOT NULL,
    stock INT NOT NULL,
    precioUnitario FLOAT NOT NULL,
    cveCategoria SMALLINT NOT NULL,
    FOREIGN KEY (cveCategoria) REFERENCES tbl_categoria(cveCategoria),
    cveRegistro SMALLINT NOT NULL,
    FOREIGN KEY (cveRegistro) REFERENCES tbl_usuario(cveUsuario),
    fechaRegistro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tbl_imagen_producto(
	cveImagen SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ruta VARCHAR(500) NOT NULL,
    cveProducto SMALLINT NOT NULL,
    FOREIGN KEY (cveProducto) REFERENCES tbl_producto(cveProducto)
);

CREATE TABLE IF NOT EXISTS tbl_venta(
	cveVenta SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    totalVenta SMALLINT NOT NULL,
    fechaVenta DATETIME DEFAULT CURRENT_TIMESTAMP,
    cveRegistro SMALLINT NOT NULL,
    FOREIGN KEY (cveRegistro) REFERENCES tbl_usuario(cveUsuario)
);

CREATE TABLE IF NOT EXISTS tbl_detalle_venta(
	cveDetalleVenta SMALLINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cantidad SMALLINT NOT NULL,
    precioProducto FLOAT NOT NULL,
    cveProducto SMALLINT NOT NULL,
    FOREIGN KEY (cveProducto) REFERENCES tbl_producto(cveProducto),
    cveVenta SMALLINT NOT NULL,
    FOREIGN KEY (cveVenta) REFERENCES tbl_venta(cveVenta)
);

INSERT INTO tbl_rol VALUES (1, 'Administrador', 'admin', 1);
INSERT INTO tbl_rol VALUES (2, 'Ventas', 'ventas', 1);

INSERT INTO tbl_usuario(cveUsuario, nombre, apellidos, username, password, email) VALUES(1, 'Eric', 'Domenzain', 'admin', '$2a$10$cqPJ31ODV4fACLWsrrx4QeQeMNdSjhfDAL8qk8Xr.IhrRxrjrEP6q', 'ericdomenzain@gmail.com');

INSERT INTO tbl_rol_usuario(cveRol, cveUsuario) VALUES(1, 1);