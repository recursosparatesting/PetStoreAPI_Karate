# Prueba Login Concurrencia
Este repositorio contiene un plan de pruebas UI para la pagina https://www.demoblaze.com/
La prueba es No Funcional la cual dura 6 minutos. Envia 50 hilos durante el primer minuto y despues se sotiene por 5 minutos mas.
El artefacto de la prueba es un script de Jmeter utilizando el tipo de hilo Currency Thread Group.
El script cuenta con 3 listener: Resumen, Arbol de resultados y PerfMon Metrics Collector.  Este ultimo se encarga de colectar los datos del comportamiento de los recursos de la maquina en un formato legible por Nmon. 
Esto estilo de recoleccion de datos de Performance (comportamiento del host), solo es posible, debido a que el agente de pruebas es el mismo host de la aplicacion. Esto no es lo mas recomendable para una prueba, solo se realiza a modo de demostracion; en un escenario mas real, el host debe ser diferente del agente de pruebas. 


## 📋 Requisitos
* El script en Jmeter fue desarrollado para la version 5.6.3   
* Java 17  

## 🚀 Pipeline de Ejecucion en GibhubActions
Este pipeline corre en Github Actions.   
Los pasos que realiza son los siguientes:  
Instala maven y java  
Descarga Jmeter.   
Descarga e instala los plugins utilizados en el script.  
Descarga, configura y ejecuta PerfMon ServerAgent.  
Ejecuta la prueba y genera el reporte HTML.  
Exporta los reportes jtl y hmtl para que puedan ser descargados de Artifacts.  

El pipeline corre en sistema operativo Ubuntu 24.04. Sin embargo, la automatizaicon podria usarse en entornos windows o cualquier otra distribucion Linux.

Para usarse de manera local, se puede clonar el repositorio y ejecutar la prueba de la siguiente manera:  
git clone https://github.com/recursosparatesting/DemoblazerJmeter.git  
mkdir results  
mkdir results/html_report  
jmeter.sh -n -t DemoblazerConcurrencia.jmx -Jresults_path=results -l results/results.jtl  -e -o results/html_report   

El archivo datos.cvs tiene la informacion de usuario y contraseña para realizar el login. 
