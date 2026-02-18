-- Prueba de Integridad Referencial (Joins)

-- Buscar registros sin fecha válida
SELECT COUNT(*) as registros_sin_fecha
FROM dbo.fact_news fn
LEFT JOIN dbo.dim_date dd ON fn.date_key = dd.date_key
WHERE dd.date_key IS NULL;

-- Buscar registros sin fuente válida
SELECT COUNT(*) as registros_sin_fuente
FROM dbo.fact_news fn
LEFT JOIN dbo.dim_source ds ON fn.source_id = ds.source_id
WHERE ds.source_id IS NULL;

-- Prueba de Granularidad y Cuadratura
-- Total en la Fact Table
SELECT content_type, COUNT(*) as total_fact
FROM dbo.fact_news
GROUP BY content_type;
