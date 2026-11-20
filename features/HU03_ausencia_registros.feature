Feature: Notificación de ausencia de registros en la red
  Como médico de emergencias
  Quiero saber cuándo no existen registros para el DNI consultado
  Para no confundir la ausencia de datos con una falla de conexión

  Scenario: Sin registros confirmados
    Given ambos hospitales responden sin información para el DNI "61234578"
      | hospital             | respuesta | registros |
      | Hospital Dos de Mayo | Exitosa   | 0         |
      | Hospital Loayza      | Exitosa   | 0         |
    When el médico confirma la búsqueda
    Then RED-MED muestra "Sin registros en la red" en un máximo de 5 segundos

  Scenario: Resultado no concluyente
    Given el Hospital Dos de Mayo no responde la consulta
    And el Hospital Loayza responde correctamente
    When RED-MED recibe la respuesta disponible
    Then muestra los datos recuperados, si los hay
    And muestra "Consulta incompleta, hospital sin respuesta"
