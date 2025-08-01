
USE TrackParts;

-- Inserción en MARCA
INSERT INTO Marca (nombre_marca) VALUES
('Toyota'), ('Ford'), ('Renault');

-- Inserción en CLIENTE
INSERT INTO Cliente (nombre_completo, dni, correo_electronico, telefono) VALUES
('Juan Pérez', '30123456', 'juanp@gmail.com', '1134567890'),
('Lucía González', '32456789', 'luciag@yahoo.com', '1145678901');

-- Inserción en VEHICULO
INSERT INTO Vehiculo (id_cliente, id_marca, modelo, año, patente) VALUES
(1, 1, 'Corolla', 2015, 'ABC123'),
(2, 2, 'Focus', 2018, 'XYZ456');

-- Inserción en REPUESTO
INSERT INTO Repuesto (nombre_repuesto, descripcion, precio) VALUES
('Repuesto 1', 'Filtro de aceite', 2500.00),
('Repuesto 2', 'Pastillas de freno', 4800.50);

-- Inserción en STOCK
INSERT INTO Stock (id_repuesto, stock_actual, stock_minimo) VALUES
(1, 12, 5),
(2, 4, 5);

-- Inserción en PEDIDO
INSERT INTO Pedido (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-07-01', 'Entregado'),
(2, '2025-07-02', 'Pendiente');

-- Inserción en DETALLE_PEDIDO
INSERT INTO Detalle_pedido (id_pedido, id_repuesto, cantidad, precio_unitario) VALUES
(1, 1, 2, 2500.00),
(1, 2, 1, 4800.50),
(2, 1, 1, 2500.00);

-- Inserción en FACTURA
INSERT INTO Factura (id_pedido, fecha_emision, total, metodo_pago) VALUES
(1, '2025-07-01', 9800.50, 'Efectivo'),
(2, '2025-07-02', 2500.00, 'Transferencia');

-- Inserción en EMPLEADO
INSERT INTO Empleado (nombre_empleado, puesto, fecha_ingreso) VALUES
('Carlos Sosa', 'Mecánico', '2020-01-10'),
('Ana Ruiz', 'Administrativa', '2021-03-15');

-- Inserción en SERVICIO
INSERT INTO Servicio (nombre_servicio, descripcion, precio) VALUES
('Cambio de aceite', 'Incluye filtro y mano de obra', 6000.00),
('Alineación y balanceo', 'Servicio completo de tren delantero', 7500.00);

-- Inserción en TURNO
INSERT INTO Turno (id_cliente, id_vehiculo, id_servicio, fecha_turno, hora_turno, estado) VALUES
(1, 1, 1, '2025-07-10', '09:00:00', 'Confirmado'),
(2, 2, 2, '2025-07-11', '11:30:00', 'Pendiente');

-- Inserción en PROVEEDOR
INSERT INTO Proveedor (nombre_proveedor, telefono, correo) VALUES
('Autopartes S.A.', '1123456789', 'ventas@autopartes.com'),
('Repuestera Norte', '1139876543', 'contacto@rnorte.com');

-- Inserción en COMPRA
INSERT INTO Compra (id_proveedor, id_repuesto, fecha_compra, cantidad, precio_compra) VALUES
(1, 1, '2025-06-28', 10, 2000.00),
(2, 2, '2025-06-29', 5, 4200.00);
