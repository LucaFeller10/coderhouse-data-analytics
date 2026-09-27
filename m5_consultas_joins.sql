USE m3_prentrega;

-- SELECT * FROM ventas; --

SELECT
    ventas.fecha_venta AS fecha,
    clientes.id_cliente,
    clientes.nombre AS cliente,
    clientes.ciudad,
    productos.nombre_producto AS producto,
    categorias.nombre_categoria AS categoria,
    ventas.cantidad,
    ventas.precio_unitario,
    (ventas.cantidad * ventas.precio_unitario) AS total_venta
FROM ventas
INNER JOIN clientes
    ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos
    ON ventas.id_producto = productos.id_producto
INNER JOIN categorias
    ON productos.id_categoria = categorias.id_categoria;
    
--

SELECT
    clientes.nombre,
    clientes.email,
    clientes.fecha_registro
FROM clientes
LEFT JOIN ventas
    ON clientes.id_cliente = ventas.id_cliente
WHERE ventas.id_venta IS NULL;

--

SELECT
    productos.nombre_producto,
    categorias.nombre_categoria AS categoria,
    productos.precio
FROM productos
LEFT JOIN ventas
    ON productos.id_producto = ventas.id_producto
INNER JOIN categorias
    ON productos.id_categoria = categorias.id_categoria
WHERE ventas.id_venta IS NULL;

--

SELECT
    canal,
    SUM(total) AS total_facturado
FROM (
    SELECT
        fecha_venta AS fecha,
        (cantidad * precio_unitario) AS total,
        'Primer periodo' AS canal
    FROM ventas
    WHERE fecha_venta <= '2024-03-10'

    UNION ALL

    SELECT
        fecha_venta AS fecha,
        (cantidad * precio_unitario) AS total,
        'Segundo periodo' AS canal
    FROM ventas
    WHERE fecha_venta > '2024-03-10'
) AS ventas_consolidadas
GROUP BY canal;