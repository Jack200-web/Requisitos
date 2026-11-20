Feature: Respuesta ante falla parcial de hospitales
  Como médico de emergencias
  Quiero saber si un hospital no respondió y ver solo los datos recuperados
  Para no confundir una falla de red con ausencia de información

  Scenario: Respuesta parcial
    Given los hospitales del piloto tienen este estado
      | hospital             | estado        |
      | Hospital Dos de Mayo | Sin respuesta |
      | Hospital Loayza      | Disponible    |
    When el médico consulta el DNI "45781236"
    Then RED-MED muestra solo los datos del Hospital Loayza
    And identifica al Hospital Dos de Mayo como hospital sin respuesta

  Scenario: Ninguna fuente disponible
    Given el único hospital con registros del paciente no responde
    When el médico consulta el DNI
    Then RED-MED muestra "Información temporalmente no disponible"
    And no muestra "Sin registros en la red"
