--Tendencias de tema por mes (top3)
WITH CategoryCounts AS (
    SELECT 
        dd.year, 
        dd.month,
        dt.category,
        COUNT(fn.id) as conteo
    FROM fact_news fn 
    LEFT JOIN dim_date dd ON fn.date_key = dd.date_key
    LEFT JOIN dim_topic dt ON fn.keyword_id = dt.keyword_id
    GROUP BY dd.year, dd.month, dt.category
),
RankedCategories AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY year, month 
            ORDER BY conteo DESC
        ) as rn
    FROM CategoryCounts
)
SELECT 
    year, 
    month, 
    category, 
    conteo
FROM RankedCategories
WHERE rn <= 3
ORDER BY year DESC, month DESC, conteo DESC;

--Fuentes más influyentes (top 10)
SELECT TOP 10
    ds.news_site,
    COUNT(fn.id) AS conteo
FROM fact_news fn
LEFT JOIN dim_source ds ON fn.source_id = ds.source_id
GROUP BY ds.news_site
ORDER BY conteo DESC;
