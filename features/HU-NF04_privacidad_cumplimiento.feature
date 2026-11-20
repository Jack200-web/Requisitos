Feature: Control de privacidad y cumplimiento aplicable
  Como responsable de seguridad
  Quiero controlar y auditar el acceso a la información clínica
  Para apoyar el cumplimiento de la Ley N.° 29733 y RENHICE

  Scenario: Acceso sin condiciones completas
    Given un usuario intenta consultar datos clínicos en estos casos
      | sesión   | rol        | motivo                 |
      | inválida | Médico     | Atención de emergencia |
      | válida   | Gestión    | Atención de emergencia |
      | válida   | Enfermería |                        |
    When envía la consulta
    Then RED-MED deniega la lectura de la información clínica

  Scenario: Trazabilidad de la consulta
    Given un médico autorizado registró el motivo de consulta
    When RED-MED le entrega la información clínica
    Then se registra el usuario, el paciente, el hospital, el motivo, la fecha y la hora
