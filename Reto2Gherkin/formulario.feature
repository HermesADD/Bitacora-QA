Feature: Validación de formulario de contacto y registro

  Scenario Outline: Intento de envío del formulario con diferentes combinaciones de datos
    Given que el usuario se encuentra en la página del formulario de contacto
    When el usuario ingresa el nombre "<nombre>"
    And ingresa el correo electrónico "<email>"
    And hace clic en el botón de "Registrar"
    Then el sistema debe responder con la notificación "<mensaje_sistema>"

    Examples:
      | nombre        | email                  | mensaje_sistema                               |
      | Juan Herrera  | Juan.h@dominio.com     | Registro exitoso, bienvenido                  |
      | Esther        | Esther_sin_arroba.com  | Error: Ingrese un correo electrónico válido   |
      |               |                        | Error: Todos los campos son obligatorios      |
