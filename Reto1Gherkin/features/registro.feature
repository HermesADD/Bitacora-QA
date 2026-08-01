Feature: Registro de usuario nuevo mediante correo electrónico

  Scenario: Registro exitoso con campos válidos
    Given que me encuentro en el formulario de registro por correo de Claro Drive
    When ingreso un correo electrónico válido que no ha sido registrado
    And ingreso una contraseña que cumple con los requisitos de seguridad
    And hago clic en el botón de "Crear cuenta"
    Then el sistema debe registrar mi cuenta exitosamente
    And me debe redirigir a la vista principal de mi unidad de almacenamiento

  Scenario: Registro fallido por correo electrónico ya existente
    Given que me encuentro en el formulario de registro por correo de Claro Drive
    When ingreso un correo electrónico que ya se encuentra vinculado a una cuenta activa
    And ingreso una contraseña válida
    And hago clic en el botón de "Crear cuenta"
    Then el sistema debe mostrar un mensaje de error indicando que el correo ya está en uso
    And el registro debe ser bloqueado manteniéndome en el formulario actual

  Scenario: Registro fallido por campos vacíos
    Given que me encuentro en el formulario de registro por correo de Claro Drive
    When dejo los campos de correo electrónico y contraseña en blanco
    And hago clic en el botón de "Crear cuenta"
    Then el sistema debe resaltar los campos obligatorios en rojo
    And debe mostrar una alerta indicando que se requiere completar toda la información
