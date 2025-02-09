# **ELT para el Curso de MLOps - ITBA**

Este proyecto forma parte del curso de **MLOps** impartido por el **Instituto Tecnológico de Buenos Aires (ITBA)**. Su objetivo es demostrar la integración eficiente de herramientas modernas de ELT (Extract, Load, Transform) como **Airbyte** y **DBT**, utilizando **PostgreSQL** como base de datos central. El flujo de trabajo incluye la extracción y carga de datos con Airbyte, seguido de transformaciones estructuradas y modulares con DBT, resultando en un pipeline de datos robusto, escalable y fácil de mantener.

---

## **Descripción del Proyecto**

El proyecto está diseñado para implementar un pipeline de datos que integra **Airbyte** para la extracción y carga de datos desde diversas fuentes hacia una base de datos **PostgreSQL**. Posteriormente, se utiliza **DBT (Data Build Tool)** para realizar transformaciones de datos de manera modular, reproducible y optimizada. Este enfoque permite gestionar flujos de datos complejos de manera eficiente, asegurando la calidad, consistencia y escalabilidad de los datos.

---

## **Tecnologías Utilizadas**

- **Airbyte**: Plataforma de integración de datos para la extracción y carga (EL).
- **DBT (Data Build Tool)**: Herramienta de transformación de datos que permite trabajar con SQL modular y versionado.
- **PostgreSQL**: Base de datos relacional utilizada para almacenar los datos extraídos y transformados.
- **Docker**: Para la ejecución de contenedores que simplifican la configuración y despliegue de las herramientas.
- **Python 3.8+**: Lenguaje utilizado para la configuración y ejecución de DBT.

---

## **Requisitos Previos**

Antes de comenzar, asegúrate de tener instalados los siguientes componentes:

1. **Docker**: Para ejecutar Airbyte y DBT en contenedores.
   - [Instrucciones de instalación de Docker](https://docs.docker.com/get-docker/)
2. **PostgreSQL**: Base de datos relacional para almacenar los datos.
   - [Instrucciones de instalación de PostgreSQL](https://www.postgresql.org/download/)
3. **Python 3.8+**: Necesario para ejecutar DBT.
   - [Instrucciones de instalación de Python](https://www.python.org/downloads/)
4. **Airbyte**: Plataforma de integración de datos.
   - [Instrucciones de instalación de Airbyte](https://docs.airbyte.com/deploying-airbyte/local-deployment/)
5. **DBT**: Herramienta de transformación de datos.
   - [Instrucciones de instalación de DBT](https://docs.getdbt.com/docs/get-started/installation)

---

## **Configuración del Proyecto**

### **1. Configuración de Airbyte**

1. **Desplegar Airbyte**:
   - Clona el repositorio de Airbyte y ejecuta los contenedores Docker:
     ```bash
     git clone https://github.com/airbytehq/airbyte.git
     cd airbyte
     docker-compose up
     ```
   - Accede a la interfaz de Airbyte en `http://localhost:8000`.

2. **Configurar Conexiones**:
   - Crea una conexión en Airbyte para extraer datos desde una fuente (por ejemplo, una API, archivo CSV o base de datos) y cargarlos en PostgreSQL.

3. **Configurar Destino PostgreSQL**:
   - Asegúrate de que PostgreSQL esté correctamente configurado como destino en Airbyte.

---

### **2. Configuración de DBT**

1. **Instalar DBT**:
   - Instala DBT utilizando pip:
     ```bash
     pip install dbt
     ```

2. **Inicializar Proyecto DBT**:
   - Crea un nuevo proyecto DBT:
     ```bash
     dbt init mi_proyecto_dbt
     cd mi_proyecto_dbt
     ```

3. **Configurar Perfil de DBT**:
   - Edita el archivo `~/.dbt/profiles.yml` para configurar la conexión a PostgreSQL:
     ```yaml
     db_postgres:
       outputs:
         dev:
           dbname: mlops
           host: "localhost"
           pass: airbyte
           port: 5432
           schema: target
           threads: 1
           type: postgres
           user: joseph0001@gmail.com
       target: dev
     ```

4. **Definir Modelos en DBT**:
   - Crea modelos SQL en la carpeta `models` para transformar los datos cargados en PostgreSQL.

---

### **3. Ejecución del Pipeline**

1. **Extraer y Cargar Datos con Airbyte**:
   - Ejecuta la conexión en Airbyte para extraer y cargar datos en PostgreSQL.

2. **Transformar Datos con DBT**:
   - Ejecuta las transformaciones con DBT:
     ```bash
     dbt run
     ```

3. **Verificar Resultados**:
   - Verifica los datos transformados en PostgreSQL.

---

## **Contribuciones**

Si deseas contribuir a este proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama para tu contribución (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz commit (`git commit -m 'Añadir nueva funcionalidad'`).
4. Haz push a la rama (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.

---

## **Contacto**

Si tienes alguna pregunta o sugerencia, no dudes en contactarme:

- **Nombre**: [José F. Ramos]
- **Email**: [joseph0001@gmail.com]
- **LinkedIn**: [www.linkedin.com/in/jose-florentino-ramos-aaaab3169]

---

¡Gracias por revisar mi portafolio de ELT! Espero que este proyecto sea útil para entender cómo integrar Airbyte, DBT y PostgreSQL en un flujo de trabajo de MLOps.