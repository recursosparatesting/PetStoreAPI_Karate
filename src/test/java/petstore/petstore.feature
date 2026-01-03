Feature: Gestión de Mascotas en Petstore API

  Background:
    * url 'http://localhost:8080/api/v3'
    * def esquemaMascota = read('crearMascotaPostschema.json')
   

  @crearMascota
  Scenario Outline: Crear mascota llamada <name> (<status>)
    # El payload usa las variables del CSV: <name>,<id>, <idcategory>, <category>, <tagraza>, <tagcolor>, <status>
    * def requestPayload = 
    """
  {
  "name" : "#(name)",
  "photoUrls" : [ "string", "string" ],
  "id" : #(id),
  "category" : {
    "id" :#(idcategory),
    "name" : "#(category)"
  },
  "tags" : [ {
    "id" : 19,
    "name" : "#(tagraza)"
  }, {
    "id" : 11,
    "name" : "#(tagcolor)"
  } ],
  "status" : "#(status)"
}
    """
    # Paso 1: Crear la mascota (POST)
    Given path 'pet'
    And request requestPayload
    When method post
    Then status 200
    # Guardamos el ID generado por el servidor
    And def petId = response.id
    And print 'El ID creado es:', petId
    And match response == esquemaMascota

    # Paso 2: Consultar la mascota creada (GET)
    Given path 'pet', petId
    When method get
    Then status 200
    And match response.name == name
    And match response.status == status
    And match response.id == petId
    And print 'Mascota verificada con éxito:', name

    # Leemos el archivo CSV
    Examples:
      | read('mascotas.csv') |