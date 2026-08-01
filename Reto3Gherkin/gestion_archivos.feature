# Este feature evalúa las funciones principales de gestión de archivos en la plataforma web de Claro Drive,
# asegurando que los usuarios puedan subir contenido y generar enlaces de forma segura.

Feature: Gestión y uso compartido de archivos en la nube

  Background:
    Given que el usuario ha iniciado sesión en la plataforma web con credenciales válidas
    And se encuentra en el panel principal de la sección "Archivos"

  @humo
  Scenario: Carga exitosa de un archivo multimedia
    When el usuario arrastra el archivo "Formula_of_Love_Cover.jpg" al área de carga
    And espera a que la barra de progreso de subida alcance el 100%
    Then el sistema debe mostrar el mensaje de confirmación "Archivo subido correctamente"
    And el archivo debe aparecer listado en la carpeta actual de la interfaz

  @regresion
  Scenario: Eliminación de un documento hacia la papelera
    Given que el usuario tiene un documento de texto guardado en su unidad
    When el usuario hace clic derecho sobre el documento
    And selecciona la opción "Mover a la papelera" en el menú desplegable
    Then el documento debe desaparecer de la vista principal de archivos
    And el sistema debe trasladarlo a la sección de "Papelera"

  @critico
  Scenario Outline: Generación de enlaces para compartir con diferentes niveles de acceso y seguridad
    When el usuario selecciona un archivo de su unidad
    And hace clic en la opción de "Compartir enlace"
    And configura el permiso de acceso como "<nivel_acceso>"
    And aplica la configuración de seguridad "<configuracion_seguridad>"
    And presiona el botón "Generar enlace"
    Then el sistema debe crear un enlace web copiable
    And al intentar abrir el enlace, el comportamiento del sistema debe ser "<resultado_esperado>"

    Examples:
      | nivel_acceso     | configuracion_seguridad        | resultado_esperado                                                                                                 |
      | Solo ver         | Ninguna                        | permitir visualizar el documento en el navegador sin poder alterarlo                                               |
      | Solo ver         | Con contraseña                 | solicitar la introducción de una clave correcta antes de mostrar el documento                                      |
      | Solo ver         | Con fecha de vigencia          | mostrar un error de enlace caducado si se intenta acceder después de la fecha límite                               |
      | Solo ver         | Contraseña y fecha de vigencia | solicitar la clave correcta, pero bloquear el acceso si la fecha de vigencia ya expiró                             |
      | Editar           | Ninguna                        | permitir modificar y guardar los cambios directamente en el documento                                              |
      | Editar           | Con contraseña                 | solicitar la clave correcta y, una vez ingresada, permitir modificar el documento                                  |
      | Editar           | Con fecha de vigencia          | permitir modificar el documento solo si la fecha límite no ha pasado, de lo contrario mostrar error de caducidad   |
      | Editar           | Contraseña y fecha de vigencia | solicitar la clave y permitir modificar el documento siempre que la fecha de vigencia no haya expirado             |
      | Editar y cargar  | Ninguna                        | permitir modificar el archivo original y subir nuevos documentos al mismo directorio                               |
      | Editar y cargar  | Con contraseña                 | solicitar la clave y, tras validarla, permitir modificar el archivo y subir nuevos documentos                      |
      | Editar y cargar  | Con fecha de vigencia          | permitir modificar y subir archivos únicamente si se accede antes de la fecha de caducidad                         |
      | Editar y cargar  | Contraseña y fecha de vigencia | requerir la clave correcta para acceder a la edición y carga, bloqueando el sistema si la fecha de vigencia expiró |
