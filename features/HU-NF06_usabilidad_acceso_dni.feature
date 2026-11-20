Feature: Usabilidad de acceso a información clínica por DNI
  Como enfermera de triaje
  Quiero localizar rápidamente la información clínica usando el DNI
  Para integrar la consulta a mi atención habitual

  Scenario: Prueba de tarea completa
    Given cinco enfermeras participan en una prueba con cuentas y DNI de prueba
    When cada una registra el DNI y el motivo y abre la ficha clínica
    Then se obtienen estos resultados
      | participante | tiempo | clics |
      | Enfermera 1  | 0:58   | 3     |
      | Enfermera 2  | 1:12   | 3     |
      | Enfermera 3  | 1:05   | 2     |
      | Enfermera 4  | 1:31   | 3     |
      | Enfermera 5  | 0:49   | 3     |
    And todas lo logran en menos de 2 minutos y con un máximo de 3 clics
