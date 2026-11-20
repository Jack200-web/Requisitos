Feature: Validación de DNI antes de la búsqueda
  Como profesional de salud
  Quiero que RED-MED valide el DNI ingresado antes de consultar los hospitales
  Para evitar búsquedas incorrectas y demoras en la atención

  Scenario: DNI válido
    Given el profesional está autenticado en el módulo de búsqueda
    When ingresa el DNI "45781236"
    Then RED-MED habilita la consulta sin pedir otro documento

  Scenario: DNI inválido o vacío
    Given el profesional está en el buscador de pacientes
    When intenta buscar con alguno de estos valores
      | valor     | caso               |
      | 4578A236  | contiene letras    |
      | 4578123   | menos de 8 dígitos |
      | 457812369 | más de 8 dígitos   |
      |           | campo vacío        |
    Then RED-MED muestra un mensaje de validación
    And no envía la consulta a los hospitales
