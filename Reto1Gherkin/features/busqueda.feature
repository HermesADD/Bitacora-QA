Feature: Búsqueda de archivos y carpetas en la unidad

  Scenario: Búsqueda exitosa que retorna resultados
    Given que me encuentro en la vista principal de mis archivos
    When escribo el nombre exacto de un documento existente en la barra de búsqueda
    And presiono la tecla "Enter"
    Then el sistema debe desplegar una lista con los archivos que coinciden con el nombre

  Scenario: Búsqueda sin resultados
    Given que me encuentro en la vista principal de mis archivos
    When escribo un término aleatorio que no coincide con ningún archivo de mi unidad
    And presiono la tecla "Enter"
    Then el sistema debe mostrar el mensaje visual "No se encontraron resultados"

  Scenario: Búsqueda exitosa filtrando por extensión de archivo
    Given que me encuentro en la vista principal de mis archivos
    And tengo múltiples documentos de texto e imágenes almacenados
    When escribo ".pdf" en la barra de búsqueda central
    And presiono la tecla "Enter"
    Then el sistema debe mostrar únicamente los archivos que tengan formato PDF
    And la interfaz debe resaltar el término de búsqueda en los nombres listados
