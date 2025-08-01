
-- CREACIÓN DE BASE DE DATOS
CREATE DATABASE IF NOT EXISTS TrackParts;
USE TrackParts;

-- TABLA MARCA (referencial)
CREATE TABLE Marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL
);

-- TABLA CLIENTE
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20)
);

-- TABLA VEHICULO
CREATE TABLE Vehiculo (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_marca INT,
    modelo VARCHAR(50),
    año INT,
    patente VARCHAR(10) UNIQUE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_marca) REFERENCES Marca(id_marca)
);

-- TABLA REPUESTO
CREATE TABLE Repuesto (
    id_repuesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_repuesto VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2)
);

-- TABLA STOCK
CREATE TABLE Stock (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_repuesto INT,
    stock_actual INT,
    stock_minimo INT,
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
);

-- TABLA PEDIDO
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- TABLA DETALLE_PEDIDO
CREATE TABLE Detalle_pedido (
    id_detalle_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_repuesto INT,
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
);

-- TABLA FACTURA
CREATE TABLE Factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    fecha_emision DATE,
    total DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- TABLA EMPLEADO
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(100),
    puesto VARCHAR(50),
    fecha_ingreso DATE
);

-- TABLA SERVICIO
CREATE TABLE Servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10,2)
);

-- TABLA TURNO
CREATE TABLE Turno (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_vehiculo INT,
    id_servicio INT,
    fecha_turno DATE,
    hora_turno TIME,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- TABLA PROVEEDOR
CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(100),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

-- TABLA COMPRA
CREATE TABLE Compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    id_repuesto INT,
    fecha_compra DATE,
    cantidad INT,
    precio_compra DECIMAL(10,2),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor),
    FOREIGN KEY (id_repuesto) REFERENCES Repuesto(id_repuesto)
);
