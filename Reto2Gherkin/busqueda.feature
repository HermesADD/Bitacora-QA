Feature: Búsqueda de archivos y carpetas en la unidad

  Scenario Outline: Búsqueda de archivos con distintos criterios y casos de borde
    Given que el usuario se encuentra en la vista principal de sus archivos
    When el usuario escribe "<termino_busqueda>" en la barra de búsqueda central
    And presiona la tecla "Enter"
    Then el sistema debe mostrar "<resultado_esperado>"

    Examples:
      | termino_busqueda | resultado_esperado                                         |
      | Documento_Final  | una lista con los archivos que coinciden con el nombre     |
      | .pdf             | únicamente los archivos que tengan formato PDF             |
      | asdfghjkl        | el mensaje visual "No se encontraron resultados"           |
      |                  | una advertencia indicando "Ingrese un término de búsqueda" |
      | !@#$%^&*()       | el mensaje visual "No se encontraron resultados"           |
