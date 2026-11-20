Feature: Consulta de exámenes de los últimos seis meses
  Como médico
  Quiero consultar exámenes registrados en los últimos seis meses en otro hospital
  Para valorar información previa antes de solicitar nuevos exámenes

  Scenario: Listado de exámenes
    Given existen estos exámenes del paciente dentro del periodo
      | fecha      | tipo                 | resultado          |
      | 2026-10-28 | Glucosa en ayunas    | 126 mg/dL          |
      | 2026-08-14 | Radiografía de tórax | Informe disponible |
    When el médico consulta la sección de exámenes
    Then RED-MED los muestra del más reciente al más antiguo
    And cada registro muestra fecha, tipo y resultado

  Scenario: Sin resultados en el periodo
    Given no existen exámenes del paciente en los últimos seis meses
    When el médico consulta la sección de exámenes
    Then RED-MED muestra "Sin exámenes disponibles en el periodo"
