# 📋 Prueba PetStore API usando Karate DSL
La ATM de este repositorio realizar una prueba de creacion de una mascota y posteriormente confirma que haya sido creada.
El caso de prueba esta expresado en Gherkin y la ATM se esta desarrollando con el framework Karate DSL.



## 📋 Requisitos
* Java 17  
* Maven

## Pipeline en Github Actions.   
Los pasos que realiza son los siguientes:  
Instala maven y java  
Descarga y ejecuta el repositorio de las APIs, se asegura que las APIs queden disponibles en http://localhost:8080/  
Ejecuta la prueba con maven.  
Exporta el informe de Karate 
Genera un informe con Allure y lo exporta  
Los dos informes pueden ser descargados de Artifacts.  

El pipeline corre en sistema operativo Ubuntu ultima version. Sin embargo, la automatizacion podria usarse en entornos windows o cualquier otra distribucion Linux.

El archivo mascotas.csv tiene la informacion para la creacion de las mascotas y se encuentra en src/test/java/petstore


## 📋 Descarga y visualización de evidencias
Para poder Descargar el informe de Allure  desde Artifacts  y verlo en local:  
Se debe tener previamente descargado allure. Para Ubuntu 24, se descomprime y se mueve a la carpeta opt; una vez alli se crea un link:

(Se asume que el ubuntu ya tiene una version de java instalada y funcionando 17 o superior)  
wget https://github.com/allure-framework/allure2/releases/download/2.24.0/allure-2.24.0.tgz   
tar -zxvf allure-2.24.0.tgz  
sudo mv allure-2.24.0 /opt/allure  
sudo ln -s /opt/allure/bin/allure /usr/bin/allure  

se pasa a la carpeta donde fue descargado y descomprimido el informe y se ejecuta el siguiente comando:  
(Se asume que se tiene python 3 instalado y corriendo en el ubuntu local)
python3 -m http.server 8090  
** 8090 es el puerto que puede ser reemplazado por el que se desee.  

Para verlo se invoca la url y el puerto de la siguiente manera:  

http://localhost:8090/allure-html-report/#  


## 📋 Descarga y ejecución de la ATM en local

El robot tambien puede usarse de manera local: se puede clonar el repositorio y ejecutar la prueba de la siguiente manera:   
git clone https://github.com/recursosparatesting/PetStoreAPI_Karate.git   

Se ejecuta con el siguiente comando:    
mvn clean test -Dkarate.options="--tags @crearMascota"  

Para obtener el informe de Allure ejecute el siguiente comando, se abrira automaticamente el explorador con el informe:  
mvn io.qameta.allure:allure-maven:serve  


