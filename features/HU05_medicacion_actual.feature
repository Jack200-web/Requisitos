Feature: Consulta de medicación y tratamientos actuales
  Como médico de emergencias
  Quiero revisar los medicamentos y tratamientos registrados del paciente
  Para considerar posibles interacciones y apoyar mis decisiones clínicas

  Scenario: Medicaciones disponibles
    Given la HCE de origen devuelve estos medicamentos
      | medicamento | dosis  | frecuencia    | inicio     |
      | Metformina  | 850 mg | Cada 12 horas | 2026-03-10 |
      | Enalapril   | 10 mg  | Cada 24 horas | 2025-11-02 |
    When el médico abre la sección de medicación
    Then RED-MED muestra nombre, dosis, frecuencia y fecha de inicio

  Scenario: Datos incompletos o inexistentes
    Given la HCE de origen no registra la frecuencia ni la fecha de inicio
    When el médico abre la sección de medicación
    Then RED-MED muestra "No registrado" en los campos faltantes
    And no completa los campos con datos inventados
