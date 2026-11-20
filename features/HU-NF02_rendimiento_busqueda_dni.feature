Feature: Rendimiento de búsqueda por DNI
  Como médico de emergencias
  Quiero que la consulta por DNI responda rápidamente
  Para disponer de información clínica sin retrasos innecesarios

  Scenario: Consulta bajo carga
    Given se ejecuta una prueba controlada con estos parámetros
      | usuarios simultáneos | solicitudes | tiempo máximo |
      | 50                   | 500         | 5 segundos    |
    When se envían las consultas autorizadas por DNI
    Then al menos el 95 % responde en menos de 5 segundos
    And las caídas de hospitales externos se informan por separado
