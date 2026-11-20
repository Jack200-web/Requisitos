Feature: Consulta de información clínica mediante DNI
  Como enfermera de triaje del Hospital Loayza
  Quiero consultar por DNI los antecedentes clínicos registrados en el Hospital Dos de Mayo
  Para atender al paciente sin depender únicamente de su memoria

  Scenario: Consulta exitosa
    Given la enfermera inició sesión y tiene permiso de consulta clínica
    And existe información clínica del paciente en el Hospital Dos de Mayo
      | dni      | motivo                 |
      | 45781236 | Atención de emergencia |
      | 70214589 | Evaluación en triaje   |
    When ingresa el DNI, registra el motivo y confirma la búsqueda
    Then RED-MED muestra la información clínica y el hospital de origen
    And la respuesta llega en un máximo de 5 segundos

  Scenario: Motivo de consulta obligatorio
    Given la enfermera ingresó el DNI "45781236"
    And no registró el motivo de consulta
    When intenta confirmar la búsqueda
    Then RED-MED solicita registrar el motivo
    And no muestra datos clínicos del paciente
