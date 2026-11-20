Feature: Procedencia y fecha de registro clínico
  Como médico
  Quiero identificar el hospital de origen y la fecha de cada dato clínico
  Para evaluar su vigencia y confiabilidad

  Scenario: Fuente verificable
    Given RED-MED recupera registros con datos de procedencia
      | dato                 | hospital             | fecha      |
      | Alergia a penicilina | Hospital Dos de Mayo | 2025-07-21 |
      | Glucosa en ayunas    | Hospital Loayza      | 2026-10-28 |
    When el médico visualiza cada registro
    Then RED-MED muestra su hospital de origen y su fecha de registro

  Scenario: Metadatos ausentes
    Given la HCE de origen no informa la fecha de un registro
    When RED-MED presenta ese dato clínico
    Then indica que la fecha no está registrada
    And no atribuye fechas ni fuentes no comprobadas
