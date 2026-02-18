# Spaceflight News Analytics

Pipeline de datos end-to-end para análisis de tendencias en la industria espacial usando la API de Spaceflight News.

## 🚀 Descripción

Sistema automatizado que extrae, procesa y analiza artículos, blogs y reportes de noticias espaciales para identificar tendencias, fuentes más activas y temas emergentes en la industria.

## 🏗️ Arquitectura

**Plataforma:** Microsoft Fabric (Azure)  
**Modelo:** Medallion Architecture (Bronze → Silver → Gold)

- **Bronze:** Datos crudos de la API en formato Delta
- **Silver:** Datos enriquecidos con NLP (keywords, entidades, clasificación por temas)
- **Gold:** Modelo dimensional para análisis (Data Warehouse)


## 📂 Estructura del Proyecto
```
spacenews_project/
├── notebooks/          # Notebooks de Spark para ETL
├── docs/              # Documentación y diagramas
├── sql/               # Queries de análisis
├── pipeline/          # Definición del pipeline de orquestación
└── README.md
```

## 🔧 Tecnologías

- **Microsoft Fabric:** Lakehouse, Spark, Data Factory, Warehouse
- **Delta Lake:** Storage transaccional con time travel
- **Python:** Extracción y procesamiento
- **PySpark:** Transformaciones distribuidas
- **spaCy:** NER para extracción de entidades

## 📊 Características

- ✅ Extracción diaria con manejo de rate limits y reintentos
- ✅ Deduplicación automática
- ✅ Clasificación de artículos por temas (lanzamientos, exploración, satélites, etc.)
- ✅ Extracción de entidades (organizaciones, personas, lugares)
- ✅ Análisis de tendencias temporales
- ✅ Carga incremental (solo procesa datos nuevos)
- ✅ Particionamiento por año/mes para optimización de queries

## 🚦 Ejecución

### 1. Ingesta (Bronze)
```bash
# Notebook: notebooks/2.1_extract_data.ipynb
# Extrae datos de la API y los guarda en tablas bronze
```

### 2.1. Procesamiento (Silver)
```bash
# Notebook: notebooks/2.1_processing_data.ipynb
# Enriquece datos con NLP y clasificación
```

### 2.1. Unit tests (Silver)
```bash
# Notebook: notebooks/2.1_unit_tests.ipynb
# Pruebas unitarias
```

### 2.2. Análisis (Silver)
```bash
# Notebook: notebooks/2.2_trend_analysis.ipynb
# Análisis de tendencias y fuentes
```

### 3. Data Warehouse (Gold)
```bash
# Notebook: notebooks/3.1_data_model.ipynb
# Construye modelo dimensional
```

## 📈 Análisis Disponibles

- Tendencias de temas por mes
- Fuentes de noticias más activas
- Frecuencia de keywords
- Evolución temporal de categorías

## 👤 Autor

Juan Mesa - Prueba Técnica Ingeniero de Datos Senior

## 📄 Licencia

Proyecto académico - Inetum
