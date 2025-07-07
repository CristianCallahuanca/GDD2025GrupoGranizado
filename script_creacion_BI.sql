
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_COMPRAS_id_tiempo')
    ALTER TABLE GRANIZADO.BI_HECHOS_COMPRAS DROP CONSTRAINT FK_BI_HECHOS_COMPRAS_id_tiempo;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_COMPRAS_id_ubicacion')
    ALTER TABLE GRANIZADO.BI_HECHOS_COMPRAS DROP CONSTRAINT FK_BI_HECHOS_COMPRAS_id_ubicacion;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_COMPRAS_id_tipo_material')
    ALTER TABLE GRANIZADO.BI_HECHOS_COMPRAS DROP CONSTRAINT FK_BI_HECHOS_COMPRAS_id_tipo_material;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_PEDIDOS_id_tiempo')
    ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS DROP CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_tiempo;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_PEDIDOS_id_turno')
    ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS DROP CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_turno;
    IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_PEDIDOS_id_sucursal')
    ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS DROP CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_sucursal;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_PEDIDOS_id_estado_pedido')
    ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS DROP CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_estado_pedido;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_FACTURACION_id_tiempo')
    ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION DROP CONSTRAINT FK_BI_HECHOS_FACTURACION_id_tiempo;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_FACTURACION_id_rango_etario')
    ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION DROP CONSTRAINT FK_BI_HECHOS_FACTURACION_id_rango_etario;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_FACTURACION_id_ubicacion_sucursal')
    ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION DROP CONSTRAINT FK_BI_HECHOS_FACTURACION_id_ubicacion_sucursal;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_FACTURACION_id_turno')
    ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION DROP CONSTRAINT FK_BI_HECHOS_FACTURACION_id_turno;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_FACTURACION_id_sucursal')
    ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION DROP CONSTRAINT FK_BI_HECHOS_FACTURACION_id_sucursal;

IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_ENVIOS_id_tiempo')
    ALTER TABLE GRANIZADO.BI_HECHOS_ENVIOS DROP CONSTRAINT FK_BI_HECHOS_ENVIOS_id_tiempo;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_ENVIOS_id_rango_etario')
    ALTER TABLE GRANIZADO.BI_HECHOS_ENVIOS DROP CONSTRAINT FK_BI_HECHOS_ENVIOS_id_rango_etario;
IF EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_BI_HECHOS_ENVIOS_id_ubicacion_cliente')
    ALTER TABLE GRANIZADO.BI_HECHOS_ENVIOS DROP CONSTRAINT FK_BI_HECHOS_ENVIOS_id_ubicacion_cliente;

GO

IF OBJECT_ID('GRANIZADO.BI_HECHOS_ENVIOS', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_HECHOS_ENVIOS;
IF OBJECT_ID('GRANIZADO.BI_HECHOS_FACTURACION', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_HECHOS_FACTURACION;
IF OBJECT_ID('GRANIZADO.BI_HECHOS_PEDIDOS', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_HECHOS_PEDIDOS;
IF OBJECT_ID('GRANIZADO.BI_HECHOS_COMPRAS', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_HECHOS_COMPRAS;

IF OBJECT_ID('GRANIZADO.BI_SUCURSAL', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_SUCURSAL;
IF OBJECT_ID('GRANIZADO.BI_TIEMPO', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_TIEMPO;
IF OBJECT_ID('GRANIZADO.BI_TIPO_MATERIAL', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_TIPO_MATERIAL;
IF OBJECT_ID('GRANIZADO.BI_RANGO_ETARIO', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_RANGO_ETARIO;
IF OBJECT_ID('GRANIZADO.BI_TURNO', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_TURNO;
IF OBJECT_ID('GRANIZADO.BI_MODELO', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_MODELO;
IF OBJECT_ID('GRANIZADO.BI_ESTADO_PEDIDO', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_ESTADO_PEDIDO;
IF OBJECT_ID('GRANIZADO.BI_UBICACION', 'U') IS NOT NULL DROP TABLE GRANIZADO.BI_UBICACION;
GO
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'GRANIZADO')
BEGIN
    EXEC('CREATE SCHEMA GRANIZADO');
END;
GO

CREATE TABLE GRANIZADO.BI_UBICACION (
    id_ubicacion INT IDENTITY(1,1) NOT NULL,
    provincia NVARCHAR(50),
    localidad NVARCHAR(50)
);

CREATE TABLE GRANIZADO.BI_ESTADO_PEDIDO (
    id_estado_pedido INT IDENTITY(1,1) NOT NULL,
    descripcion_estado NVARCHAR(50)
);

CREATE TABLE GRANIZADO.BI_MODELO (
    id_modelo INT IDENTITY(1,1) NOT NULL,
    nombre_modelo NVARCHAR(50)
);

CREATE TABLE GRANIZADO.BI_TURNO (
    id_turno INT IDENTITY(1,1) NOT NULL,
    hora_inicial TIME,
	hora_final TIME
);

CREATE TABLE GRANIZADO.BI_RANGO_ETARIO (
    id_rango_etario INT IDENTITY(1,1) NOT NULL,
    rango_menor INT,
	rango_mayor INT
);

CREATE TABLE GRANIZADO.BI_TIPO_MATERIAL (
    id_tipo_material INT IDENTITY(1,1) NOT NULL,
    tipo NVARCHAR(50)
);

CREATE TABLE GRANIZADO.BI_TIEMPO (
    id_tiempo INT IDENTITY(1,1) NOT NULL,
    anio INT,
    mes INT,
    cuatrimestre INT
);

CREATE TABLE GRANIZADO.BI_SUCURSAL (
    id_sucursal INT IDENTITY(1,1) NOT NULL,
	nro_sucursal BIGINT NOT NULL
);

-- TABLAS DE HECHOS
CREATE TABLE GRANIZADO.BI_HECHOS_COMPRAS (
    id_tiempo INT NOT NULL,
	id_sucursal INT NOT NULL,
    id_tipo_material INT NOT NULL,
    monto_total DECIMAL(12,4)
);

CREATE TABLE GRANIZADO.BI_HECHOS_PEDIDOS (
    id_tiempo INT NOT NULL,
    id_turno INT NOT NULL,
    id_sucursal INT NOT NULL,
    id_estado_pedido INT NOT NULL,
    cantidad INT
);

CREATE TABLE GRANIZADO.BI_HECHOS_FACTURACION (
    id_tiempo INT NOT NULL,
    id_rango_etario INT NOT NULL,
    id_ubicacion_sucursal INT NOT NULL,
    id_sucursal INT NOT NULL,
	id_modelo INT NOT NULL,
    monto_total DECIMAL(12,4),
	cantidad_ventas INT NOT NULL,
	tiempo_fabricacion_horas INT NOT NULL
);

CREATE TABLE GRANIZADO.BI_HECHOS_ENVIOS (
    id_tiempo INT NOT NULL,
    id_ubicacion_cliente INT NOT NULL,
    cumplido BIT,
    costo_total_envio DECIMAL(12,4)
);

-- CLAVES PRIMARIAS
ALTER TABLE GRANIZADO.BI_UBICACION ADD CONSTRAINT PK_BI_UBICACION PRIMARY KEY (id_ubicacion);
ALTER TABLE GRANIZADO.BI_ESTADO_PEDIDO ADD CONSTRAINT PK_BI_ESTADO_PEDIDO PRIMARY KEY (id_estado_pedido);
ALTER TABLE GRANIZADO.BI_MODELO ADD CONSTRAINT PK_BI_MODELO PRIMARY KEY (id_modelo);
ALTER TABLE GRANIZADO.BI_TURNO ADD CONSTRAINT PK_BI_TURNO PRIMARY KEY (id_turno);
ALTER TABLE GRANIZADO.BI_RANGO_ETARIO ADD CONSTRAINT PK_BI_RANGO_ETARIO PRIMARY KEY (id_rango_etario);
ALTER TABLE GRANIZADO.BI_TIPO_MATERIAL ADD CONSTRAINT PK_BI_TIPO_MATERIAL PRIMARY KEY (id_tipo_material);
ALTER TABLE GRANIZADO.BI_TIEMPO ADD CONSTRAINT PK_BI_TIEMPO PRIMARY KEY (id_tiempo);
ALTER TABLE GRANIZADO.BI_SUCURSAL ADD CONSTRAINT PK_BI_SUCURSAL PRIMARY KEY (id_sucursal); --creo que esta

-- CLAVES FORÁNEAS
ALTER TABLE GRANIZADO.BI_HECHOS_COMPRAS ADD CONSTRAINT FK_BI_HECHOS_COMPRAS_id_tiempo FOREIGN KEY (id_tiempo) REFERENCES GRANIZADO.BI_TIEMPO(id_tiempo);
ALTER TABLE GRANIZADO.BI_HECHOS_COMPRAS ADD CONSTRAINT FK_BI_HECHOS_COMPRAS_id_tipo_material FOREIGN KEY (id_tipo_material) REFERENCES GRANIZADO.BI_TIPO_MATERIAL(id_tipo_material);
ALTER TABLE GRANIZADO.BI_HECHOS_COMPRAS ADD CONSTRAINT FK_BI_HECHOS_COMPRAS_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES GRANIZADO.BI_SUCURSAL(id_sucursal);

ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS ADD CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_tiempo FOREIGN KEY (id_tiempo) REFERENCES GRANIZADO.BI_TIEMPO(id_tiempo);
ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS ADD CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_turno FOREIGN KEY (id_turno) REFERENCES GRANIZADO.BI_TURNO(id_turno);
ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS ADD CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_estado_pedido FOREIGN KEY (id_estado_pedido) REFERENCES GRANIZADO.BI_ESTADO_PEDIDO(id_estado_pedido);
ALTER TABLE GRANIZADO.BI_HECHOS_PEDIDOS ADD CONSTRAINT FK_BI_HECHOS_PEDIDOS_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES GRANIZADO.BI_SUCURSAL(id_sucursal);

ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION ADD CONSTRAINT FK_BI_HECHOS_FACTURACION_id_tiempo FOREIGN KEY (id_tiempo) REFERENCES GRANIZADO.BI_TIEMPO(id_tiempo);
ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION ADD CONSTRAINT FK_BI_HECHOS_FACTURACION_id_rango_etario FOREIGN KEY (id_rango_etario) REFERENCES GRANIZADO.BI_RANGO_ETARIO(id_rango_etario);
ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION ADD CONSTRAINT FK_BI_HECHOS_FACTURACION_id_ubicacion_sucursal FOREIGN KEY (id_ubicacion_sucursal) REFERENCES GRANIZADO.BI_UBICACION(id_ubicacion);
ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION ADD CONSTRAINT FK_BI_HECHOS_FACTURACION_id_sucursal FOREIGN KEY (id_sucursal) REFERENCES GRANIZADO.BI_SUCURSAL(id_sucursal);
ALTER TABLE GRANIZADO.BI_HECHOS_FACTURACION ADD CONSTRAINT FK_BI_HECHOS_FACTURACION_id_modelo FOREIGN KEY (id_modelo) REFERENCES GRANIZADO.BI_MODELO(id_modelo);

ALTER TABLE GRANIZADO.BI_HECHOS_ENVIOS ADD CONSTRAINT FK_BI_HECHOS_ENVIOS_id_tiempo FOREIGN KEY (id_tiempo) REFERENCES GRANIZADO.BI_TIEMPO(id_tiempo);
ALTER TABLE GRANIZADO.BI_HECHOS_ENVIOS ADD CONSTRAINT FK_BI_HECHOS_ENVIOS_id_ubicacion_cliente FOREIGN KEY (id_ubicacion_cliente) REFERENCES GRANIZADO.BI_UBICACION(id_ubicacion);

go

--------------------------

IF OBJECT_ID('GRANIZADO.VW_GANANCIAS_MENSUALES', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_GANANCIAS_MENSUALES;

IF OBJECT_ID('GRANIZADO.VW_FACTURA_PROM_CUATRIMESTRAL', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_FACTURA_PROM_CUATRIMESTRAL;

IF OBJECT_ID('GRANIZADO.VW_TOP3_MODELOS_VENTAS', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_TOP3_MODELOS_VENTAS;

IF OBJECT_ID('GRANIZADO.VW_VOLUMEN_PEDIDOS', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_VOLUMEN_PEDIDOS;

IF OBJECT_ID('GRANIZADO.VW_CONVERSION_PEDIDOS', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_CONVERSION_PEDIDOS;

IF OBJECT_ID('GRANIZADO.VW_TIEMPO_PROM_FABRICACION', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_TIEMPO_PROM_FABRICACION;

IF OBJECT_ID('GRANIZADO.VW_PROMEDIO_COMPRAS_MENSUAL', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_PROMEDIO_COMPRAS_MENSUAL;

IF OBJECT_ID('GRANIZADO.VW_COMPRAS_POR_MATERIAL', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_COMPRAS_POR_MATERIAL;

IF OBJECT_ID('GRANIZADO.VW_CUMPLIMIENTO_ENVIOS', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_CUMPLIMIENTO_ENVIOS;

IF OBJECT_ID('GRANIZADO.VW_TOP3_COSTO_ENVIO_LOCALIDAD', 'V') IS NOT NULL
    DROP VIEW GRANIZADO.VW_TOP3_COSTO_ENVIO_LOCALIDAD;

---------------------------------------------------------------------

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_TIEMPO', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_TIEMPO;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_UBICACION', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_UBICACION;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_RANGO_ETARIO', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_RANGO_ETARIO;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_TURNO', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_TURNO;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_TIPO_MATERIAL', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_TIPO_MATERIAL;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_MODELO', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_MODELO;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_PEDIDO', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_PEDIDO;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_SUCURSAL', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_SUCURSAL;
GO


IF OBJECT_ID('GRANIZADO.MIGRAR_BI_HECHOS_PEDIDOS', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_PEDIDOS;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_HECHOS_FACTURACION', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_FACTURACION;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_HECHOS_ENVIOS', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_ENVIOS;
GO

IF OBJECT_ID('GRANIZADO.MIGRAR_BI_HECHOS_COMPRAS', 'P') IS NOT NULL
    DROP PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_COMPRAS;
GO


CREATE PROCEDURE GRANIZADO.MIGRAR_BI_TIEMPO
as
begin
   INSERT INTO GRANIZADO.BI_TIEMPO(ANIO, MES, CUATRIMESTRE)
	SELECT DISTINCT
		YEAR(FACTURA.Factura_Fecha),
		MONTH(FACTURA.Factura_Fecha),
		CASE
			WHEN MONTH(FACTURA.Factura_Fecha) <= 4 THEN '1'
			WHEN MONTH(FACTURA.Factura_Fecha) <= 8 THEN '2'
			WHEN MONTH(FACTURA.Factura_Fecha) <= 12 THEN '3'
		END 
		FROM GRANIZADO.FACTURA
end
go

CREATE PROCEDURE GRANIZADO.MIGRAR_BI_UBICACION
as
begin
   INSERT INTO GRANIZADO.BI_UBICACION (localidad,provincia)
   SELECT l.localidad_nombre,p.prov_nombre from GRANIZADO.LOCALIDAD l join GRANIZADO.PROVINCIA p
   on l.provincia_id = p.provincia_id
end
go


CREATE PROCEDURE GRANIZADO.MIGRAR_BI_RANGO_ETARIO
as
begin
   INSERT INTO GRANIZADO.BI_RANGO_ETARIO
   VALUES (0,24),
		(25, 34),
		(35,49),
		(50, 150)
end
go


CREATE PROCEDURE GRANIZADO.MIGRAR_BI_TURNO
as
begin
   INSERT INTO GRANIZADO.BI_TURNO
   VALUES ('8:00:00', '14:00:00'),
		('14:00:01', '20:00:00')
end
go

CREATE PROCEDURE GRANIZADO.MIGRAR_BI_TIPO_MATERIAL
as
begin
   INSERT INTO GRANIZADO.BI_TIPO_MATERIAL
   select tipo_nombre from GRANIZADO.TIPO_MATERIAL
end
go

CREATE PROCEDURE GRANIZADO.MIGRAR_BI_MODELO
as
begin
   INSERT INTO GRANIZADO.BI_MODELO
   SELECT nombre_modelo FROM GRANIZADO.MODELO
end
go

CREATE PROCEDURE GRANIZADO.MIGRAR_BI_PEDIDO
as
begin
   INSERT INTO GRANIZADO.BI_ESTADO_PEDIDO
   select distinct Pedido_Estado from GRANIZADO.PEDIDO
end
go

CREATE PROCEDURE GRANIZADO.MIGRAR_BI_SUCURSAL
AS
BEGIN
    INSERT INTO GRANIZADO.BI_SUCURSAL (nro_sucursal)
    SELECT 
        Sucursal_NroSucursal
    FROM GRANIZADO.SUCURSAL;
END
GO

-- INSERT HECHOS
CREATE PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_COMPRAS
AS
BEGIN
    INSERT INTO GRANIZADO.BI_HECHOS_COMPRAS (
        id_tiempo, 
        id_ubicacion_sucursal, 
        id_sucursal, 
        id_tipo_material, 
        monto_total
    )
    SELECT 
        T.id_tiempo,
        U.id_ubicacion,
        S.id_sucursal,
        TM.id_tipo_material,
        SUM(DC.Detalle_Compra_SubTotal) AS monto_total
    FROM GRANIZADO.DETALLE_COMPRA DC
    JOIN GRANIZADO.COMPRA C ON C.compra_id = DC.compra_id
    JOIN GRANIZADO.SUCURSAL SU ON SU.Sucursal_NroSucursal = C.Sucursal_NroSucursal
    JOIN GRANIZADO.DIRECCION DIR ON DIR.direccion_id = SU.direccion_id
    JOIN GRANIZADO.LOCALIDAD L ON L.localidad_id = DIR.localidad_id
    JOIN GRANIZADO.PROVINCIA P ON P.provincia_id = L.provincia_id
    JOIN GRANIZADO.BI_UBICACION U ON U.localidad = L.localidad_nombre AND U.provincia = P.prov_nombre
    JOIN GRANIZADO.BI_SUCURSAL S ON S.nro_sucursal = SU.Sucursal_NroSucursal
    JOIN GRANIZADO.MATERIAL M ON M.mat_id = DC.mat_id
    JOIN GRANIZADO.TIPO_MATERIAL TMAT ON TMAT.tipo_material_id = M.tipo_material_id
    JOIN GRANIZADO.BI_TIPO_MATERIAL TM ON TM.tipo = TMAT.tipo_nombre
    JOIN GRANIZADO.BI_TIEMPO T ON T.anio = YEAR(C.Compra_Fecha) AND T.mes = MONTH(C.Compra_Fecha)
    GROUP BY 
        T.id_tiempo,
        U.id_ubicacion,
        S.id_sucursal,
        TM.id_tipo_material
END
GO

CREATE PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_PEDIDOS
AS
BEGIN
    INSERT INTO GRANIZADO.BI_HECHOS_PEDIDOS (
        id_tiempo,
        id_turno,
        id_sucursal,
        id_estado_pedido,
        cantidad
    )
    SELECT 
        T.id_tiempo,
        TU.id_turno,
        S.id_sucursal,
        EP.id_estado_pedido,
        count(distinct(DP.Detalle_Pedido_Cantidad))
    FROM GRANIZADO.PEDIDO P
    JOIN GRANIZADO.BI_TIEMPO T 
        ON T.anio = YEAR(P.Pedido_Fecha) 
        AND T.mes = MONTH(P.Pedido_Fecha)
    JOIN GRANIZADO.BI_TURNO TU 
        ON CAST(FORMAT(P.Pedido_Fecha, 'HH:mm:ss') AS TIME) 
        BETWEEN TU.hora_inicial AND TU.hora_final
    JOIN GRANIZADO.BI_SUCURSAL S 
        ON S.nro_sucursal = P.Sucursal_NroSucursal
    JOIN GRANIZADO.DETALLE_PEDIDO DP 
        ON DP.Pedido_Numero = P.Pedido_Numero 
        AND DP.Sucursal_NroSucursal = P.Sucursal_NroSucursal
    JOIN GRANIZADO.BI_ESTADO_PEDIDO EP 
        ON EP.descripcion_estado = P.Pedido_Estado
    WHERE NOT EXISTS (
    SELECT 1 FROM GRANIZADO.BI_HECHOS_PEDIDOS HP
    WHERE HP.id_tiempo = T.id_tiempo
      AND HP.id_turno = TU.id_turno
      AND HP.id_sucursal = S.id_sucursal
      AND HP.id_estado_pedido = EP.id_estado_pedido
      AND HP.cantidad = DP.Detalle_Pedido_Cantidad
    )
    group by T.id_tiempo, TU.id_turno, S.id_sucursal, EP.id_estado_pedido
END
go


/*CREATE PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_FACTURACION
AS
BEGIN
    INSERT INTO GRANIZADO.BI_HECHOS_FACTURACION (id_tiempo, id_rango_etario, id_ubicacion_sucursal, id_sucursal, monto_total,cantidad_ventas,tiempo_fabricacion_horas)
    SELECT 
        T.id_tiempo,
        RE.id_rango_etario,
        U.id_ubicacion,
        S.id_sucursal,
        F.Factura_Total,
		COUNT(distinct F.Factura_Numero)
    FROM GRANIZADO.FACTURA F
    JOIN GRANIZADO.CLIENTE C ON C.cli_id = F.cli_id
    JOIN GRANIZADO.SUCURSAL SU ON SU.Sucursal_NroSucursal = F.Sucursal_NroSucursal
    JOIN GRANIZADO.DIRECCION DIR ON DIR.direccion_id = SU.direccion_id
    JOIN GRANIZADO.LOCALIDAD L ON L.localidad_id = DIR.localidad_id
    JOIN GRANIZADO.PROVINCIA P ON P.provincia_id = L.provincia_id
    JOIN GRANIZADO.BI_UBICACION U ON U.localidad = L.localidad_nombre AND U.provincia = P.prov_nombre
    JOIN GRANIZADO.BI_SUCURSAL S ON S.nro_sucursal = SU.Sucursal_NroSucursal
    JOIN GRANIZADO.BI_TIEMPO T ON T.anio = YEAR(F.Factura_Fecha) AND T.mes = MONTH(F.Factura_Fecha)
    JOIN GRANIZADO.BI_RANGO_ETARIO RE ON 
        DATEDIFF(YEAR, C.Cliente_FechaNacimiento, F.Factura_Fecha) BETWEEN RE.rango_menor AND RE.rango_mayor
    JOIN GRANIZADO.BI_TURNO TU ON 
        CAST(FORMAT(F.Factura_Fecha, 'HH:mm:ss') AS TIME) BETWEEN TU.hora_inicial AND TU.hora_final
	group by T.id_tiempo,RE.id_rango_etario,U.id_ubicacion,S.id_sucursal,F.Factura_Total
END
GO*/

CREATE PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_FACTURACION
AS
BEGIN
    -- CTE para obtener la fecha mÃ­nima del pedido vinculado a cada factura
    WITH PedidoPorFactura AS (
        SELECT
            f.Factura_Numero,
            MIN(p.Pedido_Fecha) AS FechaPedido
        FROM GRANIZADO.FACTURA f
        JOIN GRANIZADO.DETALLE_FACTURA df ON df.Factura_Numero = f.Factura_Numero
        JOIN GRANIZADO.DETALLE_PEDIDO dp ON dp.Pedido_Numero = df.Pedido_Numero AND dp.Sillon_Codigo = df.Sillon_Codigo
        JOIN GRANIZADO.PEDIDO p ON p.Pedido_Numero = dp.Pedido_Numero
        GROUP BY f.Factura_Numero
    ),
    HorasPorFactura AS (
        SELECT
            f.Factura_Numero,
            DATEDIFF(HOUR, pf.FechaPedido, f.Factura_Fecha) AS HorasFabricacion
        FROM GRANIZADO.FACTURA f
        JOIN PedidoPorFactura pf ON pf.Factura_Numero = f.Factura_Numero
    )
    INSERT INTO GRANIZADO.BI_HECHOS_FACTURACION (
        id_tiempo,
        id_rango_etario,
        id_ubicacion_sucursal,
        id_sucursal,
        id_modelo,
        monto_total,
        cantidad_ventas,
        tiempo_fabricacion_horas
    )
    SELECT
        t.id_tiempo,
        re.id_rango_etario,
        ub.id_ubicacion,
        s.id_sucursal,
        mo.id_modelo,
        SUM(df.Detalle_Factura_SubTotal),
        COUNT(DISTINCT f.Factura_Numero),
        SUM(hf.HorasFabricacion)
    FROM GRANIZADO.FACTURA f
    JOIN HorasPorFactura hf ON hf.Factura_Numero = f.Factura_Numero
    JOIN GRANIZADO.DETALLE_FACTURA df ON df.Factura_Numero = f.Factura_Numero
    JOIN GRANIZADO.DETALLE_PEDIDO dp ON dp.Pedido_Numero = df.Pedido_Numero AND dp.Sillon_Codigo = df.Sillon_Codigo
    JOIN GRANIZADO.PEDIDO p ON p.Pedido_Numero = dp.Pedido_Numero
    JOIN GRANIZADO.SILLON si ON si.Sillon_Codigo = dp.Sillon_Codigo
    JOIN GRANIZADO.MODELO m ON m.mod_id = si.Sillon_Modelo_Codigo
    JOIN GRANIZADO.BI_MODELO mo ON mo.nombre_modelo = m.nombre_modelo
    JOIN GRANIZADO.SUCURSAL su ON su.Sucursal_NroSucursal = f.Sucursal_NroSucursal
    JOIN GRANIZADO.BI_SUCURSAL s ON s.nro_sucursal = su.Sucursal_NroSucursal
    JOIN GRANIZADO.DIRECCION d ON d.direccion_id = su.direccion_id
    JOIN GRANIZADO.LOCALIDAD l ON l.localidad_id = d.localidad_id
    JOIN GRANIZADO.PROVINCIA pcia ON pcia.provincia_id = l.provincia_id
    JOIN GRANIZADO.BI_UBICACION ub ON ub.localidad = l.localidad_nombre AND ub.provincia = pcia.prov_nombre
    JOIN GRANIZADO.CLIENTE c ON c.cli_id = f.cli_id
    JOIN GRANIZADO.BI_RANGO_ETARIO re ON 
        DATEDIFF(YEAR, c.Cliente_FechaNacimiento, f.Factura_Fecha) BETWEEN re.rango_menor AND re.rango_mayor
    JOIN GRANIZADO.BI_TIEMPO t ON t.anio = YEAR(f.Factura_Fecha) AND t.mes = MONTH(f.Factura_Fecha)
    GROUP BY
        t.id_tiempo,
        re.id_rango_etario,
        ub.id_ubicacion,
        s.id_sucursal,
        mo.id_modelo
END
GO


CREATE PROCEDURE GRANIZADO.MIGRAR_BI_HECHOS_ENVIOS
AS
BEGIN
    INSERT INTO GRANIZADO.BI_HECHOS_ENVIOS (id_tiempo, id_rango_etario, id_ubicacion_cliente, cumplido, costo_total_envio)
    SELECT 
        T.id_tiempo,
        RE.id_rango_etario,
        U.id_ubicacion,
        CASE WHEN  E.Envio_Fecha <= E.Envio_Fecha_Programada THEN 1 ELSE 0 END,
        E.Envio_Total
    FROM GRANIZADO.ENVIO E
    JOIN GRANIZADO.FACTURA F ON F.Factura_Numero = E.Factura_Numero
    JOIN GRANIZADO.CLIENTE C ON C.cli_id = F.cli_id
    JOIN GRANIZADO.DIRECCION DIR ON DIR.direccion_id = C.direccion_id
    JOIN GRANIZADO.LOCALIDAD L ON L.localidad_id = DIR.localidad_id
    JOIN GRANIZADO.PROVINCIA P ON P.provincia_id = L.provincia_id
    JOIN GRANIZADO.BI_UBICACION U ON U.localidad = L.localidad_nombre AND U.provincia = P.prov_nombre
    JOIN GRANIZADO.BI_TIEMPO T ON T.anio = YEAR(E.Envio_Fecha_Programada) AND T.mes = MONTH(E.Envio_Fecha_Programada)
    JOIN GRANIZADO.BI_RANGO_ETARIO RE ON 
        DATEDIFF(YEAR, C.Cliente_FechaNacimiento, E.Envio_Fecha_Programada) BETWEEN RE.rango_menor AND RE.rango_mayor
END
GO

EXEC GRANIZADO.MIGRAR_BI_TIEMPO;
EXEC GRANIZADO.MIGRAR_BI_UBICACION;
EXEC GRANIZADO.MIGRAR_BI_RANGO_ETARIO;
EXEC GRANIZADO.MIGRAR_BI_TURNO;
EXEC GRANIZADO.MIGRAR_BI_TIPO_MATERIAL;
EXEC GRANIZADO.MIGRAR_BI_MODELO;
EXEC GRANIZADO.MIGRAR_BI_PEDIDO;
EXEC GRANIZADO.MIGRAR_BI_SUCURSAL;

EXEC GRANIZADO.MIGRAR_BI_HECHOS_COMPRAS;
EXEC GRANIZADO.MIGRAR_BI_HECHOS_PEDIDOS;
EXEC GRANIZADO.MIGRAR_BI_HECHOS_FACTURACION;
EXEC GRANIZADO.MIGRAR_BI_HECHOS_ENVIOS;

GO

--1) ganancias. Funcionando

 CREATE VIEW GRANIZADO.VW_GANANCIAS_MENSUALES AS
 SELECT 
     T.anio,
     T.mes,
     S.nro_sucursal,
     SUM(HF.monto_total - HC.monto_total) AS ganancia
 FROM GRANIZADO.BI_HECHOS_FACTURACION HF
 JOIN GRANIZADO.BI_HECHOS_COMPRAS HC ON HF.id_sucursal = HC.id_sucursal
 JOIN GRANIZADO.BI_TIEMPO T ON T.id_tiempo = HF.id_tiempo
 JOIN GRANIZADO.BI_SUCURSAL S ON S.id_sucursal = HF.id_sucursal
 group by S.nro_sucursal, T.anio, T.mes
GO

--2) Factura promedio mensual.

CREATE VIEW GRANIZADO.VW_FACTURA_PROM_CUATRIMESTRAL AS
SELECT 
    t.anio,
    t.cuatrimestre,
    u.provincia,
    AVG(f.monto_total) AS factura_promedio
FROM GRANIZADO.BI_HECHOS_FACTURACION f
JOIN GRANIZADO.BI_TIEMPO t ON f.id_tiempo = t.id_tiempo
JOIN GRANIZADO.BI_UBICACION u ON f.id_ubicacion_sucursal = u.id_ubicacion
GROUP BY t.anio, t.cuatrimestre, u.provincia;
GO

--3)Rendimiento de modelos. Funcionando

CREATE VIEW GRANIZADO.VW_TOP3_MODELOS_VENTAS AS
SELECT 
    sub.anio,
    sub.cuatrimestre,
    sub.localidad,
    sub.id_rango_etario,
    sub.nombre_modelo,
    sub.total_vendido
FROM (
    SELECT 
        t.anio,
        t.cuatrimestre,
        u.localidad,
        re.id_rango_etario,
        m.nombre_modelo,
        SUM(hf.cantidad_ventas) AS total_vendido,
        ROW_NUMBER() OVER (
            PARTITION BY t.anio, t.cuatrimestre, u.localidad, re.id_rango_etario
            ORDER BY SUM(hf.cantidad_ventas) DESC
        ) AS Posicion
    FROM GRANIZADO.BI_HECHOS_FACTURACION hf
    JOIN GRANIZADO.BI_RANGO_ETARIO re ON re.id_rango_etario = hf.id_rango_etario
    JOIN GRANIZADO.BI_UBICACION u ON hf.id_ubicacion_sucursal = u.id_ubicacion
    JOIN GRANIZADO.BI_TIEMPO t ON t.id_tiempo = hf.id_tiempo
    JOIN GRANIZADO.BI_MODELO m ON m.id_modelo = hf.id_modelo
    GROUP BY 
        t.anio,
        t.cuatrimestre,
        u.localidad,
        re.id_rango_etario,
        m.nombre_modelo
) AS sub
WHERE sub.Posicion <= 3
go

--4)Volumen de pedidos. ME DA 342 COINCIDE

CREATE VIEW GRANIZADO.VW_VOLUMEN_PEDIDOS AS
SELECT 
    t.anio,
    t.mes,
    s.id_sucursal,
    p.id_turno,
    COUNT(*) AS cantidad_pedidos
FROM GRANIZADO.BI_HECHOS_PEDIDOS p
JOIN GRANIZADO.BI_TIEMPO t ON p.id_tiempo = t.id_tiempo
JOIN GRANIZADO.BI_SUCURSAL s ON p.id_sucursal = s.id_sucursal
GROUP BY t.anio, t.mes, p.id_turno, s.id_sucursal;
GO

--5)Conversión de pedidos.  ME DA 90 COINCIDE CON 90

CREATE VIEW GRANIZADO.VW_CONVERSION_PEDIDOS AS
SELECT 
    t.cuatrimestre,
    t.anio,
    s.id_sucursal,
    e.descripcion_estado,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY t.anio, t.cuatrimestre, s.id_sucursal) AS porcentaje
FROM GRANIZADO.BI_HECHOS_PEDIDOS p
JOIN GRANIZADO.BI_TIEMPO t ON p.id_tiempo = t.id_tiempo
JOIN GRANIZADO.BI_ESTADO_PEDIDO e ON p.id_estado_pedido = e.id_estado_pedido
JOIN GRANIZADO.BI_SUCURSAL s ON p.id_sucursal = s.id_sucursal
GROUP BY t.anio, t.cuatrimestre, s.id_sucursal, e.descripcion_estado;
GO

--6)Tiempo promedio de fabricación: 

 CREATE VIEW GRANIZADO.VW_TIEMPO_PROM_FABRICACION AS
 SELECT 
     t.cuatrimestre,
     t.anio,
     s.nro_sucursal,
     CAST(AVG(1.0 * tf.tiempo_fabricacion_horas) AS DECIMAL(18,2)) AS dias_promedio
 FROM GRANIZADO.BI_HECHOS_FACTURACION tf
 JOIN GRANIZADO.BI_TIEMPO t ON tf.id_tiempo = t.id_tiempo
 JOIN GRANIZADO.BI_SUCURSAL s ON tf.id_sucursal = s.id_sucursal
 GROUP BY t.anio, t.cuatrimestre, s.nro_sucursal
 ORDER BY dias_promedio desc
 GO



--7)Promedio de Compras ME DA 19 COINCIDE

CREATE VIEW GRANIZADO.VW_PROMEDIO_COMPRAS_MENSUAL AS
SELECT 
    t.anio,
    t.mes,
    AVG(compra_por_mes.total_compra) AS promedio_compras
FROM (
    SELECT 
        c.id_tiempo,
        SUM(c.monto_total) AS total_compra
    FROM GRANIZADO.BI_HECHOS_COMPRAS c
    GROUP BY c.id_tiempo
) compra_por_mes
JOIN GRANIZADO.BI_TIEMPO t ON t.id_tiempo = compra_por_mes.id_tiempo
GROUP BY t.anio, t.mes;
GO


--8)Compras por tipo de material, sucursal y cuatrimestre  

CREATE VIEW GRANIZADO.VW_COMPRAS_POR_MATERIAL AS
SELECT 
    t.anio,
    t.cuatrimestre,
    s.id_sucursal,
    m.tipo,
    SUM(c.monto_total) AS total_compras
FROM GRANIZADO.BI_HECHOS_COMPRAS c
JOIN GRANIZADO.BI_TIEMPO t ON c.id_tiempo = t.id_tiempo
JOIN GRANIZADO.BI_TIPO_MATERIAL m ON c.id_tipo_material = m.id_tipo_material
JOIN GRANIZADO.BI_SUCURSAL s ON c.id_sucursal = s.id_sucursal
GROUP BY t.anio, t.cuatrimestre, s.id_sucursal, m.tipo;
GO

--9)Porcentaje de cumplimiento de envíos por mes CHEQUEAR PORCENTAJES ME DA 19 CUMPLE

CREATE VIEW GRANIZADO.VW_CUMPLIMIENTO_ENVIOS AS
SELECT 
    t.anio,
    t.mes,
    COUNT(CASE WHEN e.cumplido = 1 THEN 1 END) * 100.0 / COUNT(*) AS porcentaje_cumplimiento
FROM GRANIZADO.BI_HECHOS_ENVIOS e
JOIN GRANIZADO.BI_TIEMPO t ON e.id_tiempo = t.id_tiempo
GROUP BY t.anio, t.mes;
GO


--10)Top 3 localidades con mayor costo de envío promedio ME DA 3 COINCIDE

CREATE VIEW GRANIZADO.VW_TOP3_COSTO_ENVIO_LOCALIDAD AS
SELECT TOP 3
    u.localidad,
    u.provincia,
    AVG(e.costo_total_envio) AS costo_promedio
    FROM GRANIZADO.BI_HECHOS_ENVIOS e
    JOIN GRANIZADO.BI_UBICACION u ON e.id_ubicacion_cliente = u.id_ubicacion
    GROUP BY u.localidad, u.provincia
    ORDER BY AVG(e.costo_total_envio) DESC;