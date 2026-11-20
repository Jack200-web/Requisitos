Feature: Visualización prioritaria de alergias y grupo sanguíneo
  Como médico de emergencias
  Quiero visualizar de inmediato las alergias y el grupo sanguíneo del paciente
  Para identificar información clínica relevante durante la atención

  Scenario: Datos prioritarios
    Given la HCE de origen registra estos datos del paciente
      | dni      | grupo | alergias          |
      | 45781236 | O+    | Penicilina        |
      | 70214589 | A-    | Ibuprofeno, Látex |
    When el médico abre la ficha clínica
    Then RED-MED muestra ambos campos en la parte superior sin desplazamiento
    And las alergias se destacan como advertencia

  Scenario: Datos no disponibles
    Given el hospital de origen no envía el campo de alergias
    When el médico abre la ficha clínica
    Then RED-MED muestra "No registrado" en ese campo
    And no lo interpreta como ausencia de alergias
