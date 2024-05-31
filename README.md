# Test Analytics Engineering
Deacero Analytics Engineering Test

## Ejercicio DBT

Este ejercicio utiliza datos de una campaña de marketing por correo electrónico disponible en el [UCI Machine Learning Repository](https://archive.ics.uci.edu/). Los datos contienen información sobre diversas campañas de marketing directo de una institución bancaria.

**Objetivo del Ejercicio:**

El objetivo es evaluar el dominio de la herramienta DBT (Data Build Tool) del candidato, su capacidad para incorporar pruebas unitarias, mantener la calidad de los datos y desplegar modelos de datos en BigQuery. El objetivo de negocio es crear un Data Mart que permita al equipo de marketing analizar la efectividad de sus campañas, enfocándose en KPIs como la tasa de conversión, el número de contactos exitosos y la segmentación de clientes.

### Instrucciones del Ejercicio:

1.  **Configuración del Proyecto DBT:**
    
    -   Crea un nuevo proyecto de DBT.
    -   Conéctalo a BigQuery.
    
2.  **Obtención de Datos:**
    
    -   Descarga los datos del [Bank Marketing dataset](https://archive.ics.uci.edu/dataset/222/bank+marketing).
    -   Carga los datos en una tabla en BigQuery llamada `raw_bank_marketing`.

3.  **Modelado:**
    
    -   Crea un modelo `staging_bank_marketing.sql` para transformar los datos iniciales:
    - Crea un modelo `kpi_bank_marketing.sql` para agregar los KPIs de marketing:

4. **Pruebas Unitarias:**
	- Agrega pruebas unitarias en el archivo `schema.yml`:
	
5.  **Despliegue y Calidad:**
    
    -   Configura un pipeline CI/CD para desplegar los modelos DBT usando herramientas como GitHub Actions, GitLab CI, o CircleCI.
    -   Configura alertas para pruebas fallidas y realiza auditorías periódicas de calidad de datos.
