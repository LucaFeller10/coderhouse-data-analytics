# RetailPro – Proyecto de Data Analytics

Proyecto del curso de Data Analytics de Coderhouse. Analiza las ventas de TechStore/RetailPro: base de datos en SQL, consultas de negocio y modelo analítico en Power BI.

**Autor:** Luca Feller De Bari

## Herramientas utilizadas
- **MySQL** (MySQL Workbench): creación y consulta de la base de datos
- **Power BI Desktop**: limpieza de datos (Power Query / M), modelado y medidas DAX
- **Excel**: dataset de origen del pipeline ETL (`Pipeline_ETL_Dataset.xlsx`)

## Estructura del repositorio
| Archivo | Módulo | Descripción |
|---|---|---|
| `m3_ventas_tech_db.sql` | M3 | Crea las tablas `categorias`, `clientes`, `productos` y `ventas` y carga los datos |
| `m4_consultas_negocio.sql` | M4 | Resumen mensual, ranking de productos, clientes recurrentes y comparación contra el promedio |
| `m5_consultas_joins.sql` | M5 | Vista base con INNER JOIN, clientes sin compras, productos sin ventas y comparación por período |
| `Pipeline_ETL_Feller_De_Bari_Luca.pbix` | M6 | Pipeline ETL: limpieza de duplicados y nulos, tipos de datos y Merge |
| `Feller_De_Bari_Luca_Checkpoint2.pbix` | M8 | Modelo estrella, tabla calendario y 5 medidas DAX |

## Cómo ejecutar los scripts
1. Abrí MySQL Workbench y creá la base de datos (está comentada en el script):
   ```sql
   CREATE DATABASE m3_prentrega;
   ```
2. Ejecutá `m3_ventas_tech_db.sql`: crea las tablas e inserta los datos.
3. Ejecutá `m4_consultas_negocio.sql` y `m5_consultas_joins.sql`. Las dos usan `USE m3_prentrega;`.

> Los scripts usan sintaxis de MySQL (`LIMIT`, `EXTRACT`, comillas dobles en los textos). Para correrlos en SQL Server hay que adaptar esas partes.

## Archivos de Power BI
Los `.pbix` se abren con Power BI Desktop. El pipeline ETL lee `Pipeline_ETL_Dataset.xlsx`: si lo abrís en otra computadora, actualizá la ruta en **Transformar datos → Configuración de origen de datos**.
