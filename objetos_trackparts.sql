
USE TrackParts;

-- VISTA: Resumen de Pedidos
CREATE OR REPLACE VIEW vista_resumen_pedidos AS
SELECT p.id_pedido, c.nombre_completo, p.fecha_pedido, p.estado, f.total
FROM Pedido p
JOIN Cliente c ON p.id_cliente = c.id_cliente
LEFT JOIN Factura f ON p.id_pedido = f.id_pedido;

-- VISTA: Stock Bajo
CREATE OR REPLACE VIEW vista_stock_bajo AS
SELECT r.nombre_repuesto, s.stock_actual, s.stock_minimo
FROM Stock s
JOIN Repuesto r ON s.id_repuesto = r.id_repuesto
WHERE s.stock_actual < s.stock_minimo;

-- FUNCIÓN: Calcular total por pedido
DELIMITER //
CREATE FUNCTION calcular_total_pedido(p_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(cantidad * precio_unitario) INTO total
    FROM Detalle_pedido
    WHERE id_pedido = p_id;
    RETURN total;
END;
//
DELIMITER ;

-- FUNCIÓN: Obtener nombre del cliente
DELIMITER //
CREATE FUNCTION obtener_nombre_cliente(p_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nombre VARCHAR(100);
    SELECT nombre_completo INTO nombre
    FROM Cliente
    WHERE id_cliente = p_id;
    RETURN nombre;
END;
//
DELIMITER ;

-- PROCEDIMIENTO: Listar Pedidos por Estado
DELIMITER //
CREATE PROCEDURE pedidos_por_estado(IN estado_param VARCHAR(50))
BEGIN
    SELECT * FROM Pedido WHERE estado = estado_param;
END;
//
DELIMITER ;

-- PROCEDIMIENTO: Actualizar estado de turno
DELIMITER //
CREATE PROCEDURE actualizar_estado_turno(IN id_turno_param INT, IN nuevo_estado VARCHAR(50))
BEGIN
    UPDATE Turno SET estado = nuevo_estado WHERE id_turno = id_turno_param;
END;
//
DELIMITER ;

-- TRIGGER: Actualizar stock luego de compra
DELIMITER //
CREATE TRIGGER trg_actualizar_stock_compra
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN
    UPDATE Stock
    SET stock_actual = stock_actual + NEW.cantidad
    WHERE id_repuesto = NEW.id_repuesto;
END;
//
DELIMITER ;

-- TRIGGER: Restar stock al generar pedido
DELIMITER //
CREATE TRIGGER trg_restar_stock_pedido
AFTER INSERT ON Detalle_pedido
FOR EACH ROW
BEGIN
    UPDATE Stock
    SET stock_actual = stock_actual - NEW.cantidad
    WHERE id_repuesto = NEW.id_repuesto;
END;
//
DELIMITER ;
