# Auditoría de Inventario de Laboratorio — Power BI + SQL

## Problema
Un laboratorio necesitaba visibilidad sobre su inventario de reactivos químicos: qué tipos de sustancias maneja, cómo está distribuido físicamente, y si existen combinaciones de reactivos almacenados juntos que representen un riesgo real de incompatibilidad química.

## Qué hice
Este proyecto combina dos herramientas para resolver un problema real en dos niveles:

1. **Power BI** — para explorar y visualizar el inventario completo (155 reactivos)
2. **SQL** — para auditar la clasificación química, detectar riesgos de incompatibilidad por cajón, y verificar matemáticamente que las soluciones propuestas funcionan

## Página 1 — Panorama general del inventario
- **Reactivos por clasificación química** — distribución de 155 reactivos según su categoría
- **Distribución sólidos vs líquidos** — 58.71% líquidos, 41.29% sólidos
- **Top 10 ubicaciones con más inventario** — identifica qué mesas/cajones concentran mayor cantidad de reactivos
- **Tabla de trazabilidad de etiquetado** — reactivos con problemas de etiquetado, su ubicación exacta y la naturaleza del problema

## Página 2 — Auditoría de compatibilidad química (SQL)

### Proceso
1. **Limpieza y verificación de datos**: se auditó la clasificación química de los 155 reactivos contra el sistema oficial de 41 Grupos Reactivos RESPEL, corrigiendo 6 errores de clasificación encontrados (ej. Ácido bórico estaba agrupado como álcali, Ácido fosfórico como hidrocarburo).
2. **Construcción de una matriz de compatibilidad** en SQL, basada en la matriz de reactividad RESPEL (ver Fuentes).
3. **Consulta SQL con self-join** que cruza cada par de reactivos que comparten un mismo cajón contra la matriz de compatibilidad, detectando automáticamente combinaciones de riesgo.
4. **Identificación del reactivo "conflictivo"** en cada cajón: el que causa más incompatibilidades por sí solo.
5. **Verificación de la solución**: una segunda consulta SQL confirmó que, reubicando 6 reactivos específicos, el riesgo detectado se reduce de 80 a 0 combinaciones.

### Hallazgos
- Se detectaron **80 combinaciones de riesgo** distribuidas en **5 cajones** del laboratorio.
- El cajón más crítico (Mesa 6, cajón 4) concentraba 28 riesgos, causados por dos oxidantes fuertes (Dicromato de potasio y Nitrato de sodio) almacenados junto a un grupo de proteínas y enzimas.
- Con la reubicación de 6 reactivos puntuales, se verificó mediante SQL que el 100% del riesgo detectado se elimina, sin necesidad de reorganizar todo el inventario.

### Recomendaciones verificadas

| Reactivo | Cajón actual | Riesgos que causa | Tipo de riesgo | Cajón recomendado |
|---|---|---|---|---|
| Ácido bórico | Mesa 1, cajón 2 | 12 | Generación de calor | Mesa 3, cajón 1 |
| Urea | Mesa 2, cajón 4 | 10 | Riesgo posible, sin evidencia confirmada | Mesa 1, cajón 4 |
| Anhídrido acético | Mesa 5, cajón 3 | 14 | No debe mezclarse con ninguna sustancia (reactivo al agua) | Mesa 3, cajón 1 |
| Ácido fosfórico | Mesa 6, cajón 3 | 16 | Gases inflamables/tóxicos + calor + solubilización de tóxicos | Mesa 1, cajón 4 |
| Dicromato de potasio | Mesa 6, cajón 4 | 14 | Calor + fuego + gases tóxicos | Mesa 3, cajón 1 |
| Nitrato de sodio | Mesa 6, cajón 4 | 14 | Calor + fuego + gases tóxicos | Mesa 3, cajón 1 |

## Herramientas y técnicas usadas
- **Power BI Desktop** — modelado de datos, visualizaciones interactivas, filtrado cruzado
- **SQL (SQLite / DB Browser)** — CREATE TABLE, INSERT, JOIN, self-join, subconsultas con NOT EXISTS, CTE (WITH), CASE WHEN, GROUP BY, agregaciones

## Fuentes
Matriz de incompatibilidad química con base en la reactividad de grupos funcionales para sustancias y residuos peligrosos (RESPEL) — Programa de Investigación sobre Residuos (PROIR), Universidad Nacional de Colombia, Sede Bogotá. Elaboración propia a partir de: Corbitt, R.A. *Standard Handbook of Environmental Engineering*, Cap. 9 "Hazardous Waste". McGraw-Hill, 2004.

## Próximos pasos posibles
- Conectar el dashboard a una fuente de datos en vivo para actualización automática del inventario.
- Ampliar la matriz de compatibilidad a los grupos RESPEL restantes no cubiertos en esta primera versión.
- Agregar un indicador de fecha de última auditoría por ubicación.# Auditoría de Inventario de Laboratorio — Power BI + SQL

## Problema
Un laboratorio necesitaba visibilidad sobre su inventario de reactivos químicos: qué tipos de sustancias maneja, cómo está distribuido físicamente, y si existen combinaciones de reactivos almacenados juntos que representen un riesgo real de incompatibilidad química.

## Qué hice
Este proyecto combina dos herramientas para resolver un problema real en dos niveles:

1. **Power BI** — para explorar y visualizar el inventario completo (155 reactivos)
2. **SQL** — para auditar la clasificación química, detectar riesgos de incompatibilidad por cajón, y verificar matemáticamente que las soluciones propuestas funcionan

## Página 1 — Panorama general del inventario
- **Reactivos por clasificación química** — distribución de 155 reactivos según su categoría
- **Distribución sólidos vs líquidos** — 58.71% líquidos, 41.29% sólidos
- **Top 10 ubicaciones con más inventario** — identifica qué mesas/cajones concentran mayor cantidad de reactivos
- **Tabla de trazabilidad de etiquetado** — reactivos con problemas de etiquetado, su ubicación exacta y la naturaleza del problema

## Página 2 — Auditoría de compatibilidad química (SQL)

### Proceso
1. **Limpieza y verificación de datos**: se auditó la clasificación química de los 155 reactivos contra el sistema oficial de 41 Grupos Reactivos RESPEL, corrigiendo 6 errores de clasificación encontrados (ej. Ácido bórico estaba agrupado como álcali, Ácido fosfórico como hidrocarburo).
2. **Construcción de una matriz de compatibilidad** en SQL, basada en la matriz de reactividad RESPEL (ver Fuentes).
3. **Consulta SQL con self-join** que cruza cada par de reactivos que comparten un mismo cajón contra la matriz de compatibilidad, detectando automáticamente combinaciones de riesgo.
4. **Identificación del reactivo "conflictivo"** en cada cajón: el que causa más incompatibilidades por sí solo.
5. **Verificación de la solución**: una segunda consulta SQL confirmó que, reubicando 6 reactivos específicos, el riesgo detectado se reduce de 80 a 0 combinaciones.

### Hallazgos
- Se detectaron **80 combinaciones de riesgo** distribuidas en **5 cajones** del laboratorio.
- El cajón más crítico (Mesa 6, cajón 4) concentraba 28 riesgos, causados por dos oxidantes fuertes (Dicromato de potasio y Nitrato de sodio) almacenados junto a un grupo de proteínas y enzimas.
- Con la reubicación de 6 reactivos puntuales, se verificó mediante SQL que el 100% del riesgo detectado se elimina, sin necesidad de reorganizar todo el inventario.

### Recomendaciones verificadas

| Reactivo | Cajón actual | Riesgos que causa | Tipo de riesgo | Cajón recomendado |
|---|---|---|---|---|
| Ácido bórico | Mesa 1, cajón 2 | 12 | Generación de calor | Mesa 3, cajón 1 |
| Urea | Mesa 2, cajón 4 | 10 | Riesgo posible, sin evidencia confirmada | Mesa 1, cajón 4 |
| Anhídrido acético | Mesa 5, cajón 3 | 14 | No debe mezclarse con ninguna sustancia (reactivo al agua) | Mesa 3, cajón 1 |
| Ácido fosfórico | Mesa 6, cajón 3 | 16 | Gases inflamables/tóxicos + calor + solubilización de tóxicos | Mesa 1, cajón 4 |
| Dicromato de potasio | Mesa 6, cajón 4 | 14 | Calor + fuego + gases tóxicos | Mesa 3, cajón 1 |
| Nitrato de sodio | Mesa 6, cajón 4 | 14 | Calor + fuego + gases tóxicos | Mesa 3, cajón 1 |

## Herramientas y técnicas usadas
- **Power BI Desktop** — modelado de datos, visualizaciones interactivas, filtrado cruzado
- **SQL (SQLite / DB Browser)** — CREATE TABLE, INSERT, JOIN, self-join, subconsultas con NOT EXISTS, CTE (WITH), CASE WHEN, GROUP BY, agregaciones

## Fuentes
Matriz de incompatibilidad química con base en la reactividad de grupos funcionales para sustancias y residuos peligrosos (RESPEL) — Programa de Investigación sobre Residuos (PROIR), Universidad Nacional de Colombia, Sede Bogotá. Elaboración propia a partir de: Corbitt, R.A. *Standard Handbook of Environmental Engineering*, Cap. 9 "Hazardous Waste". McGraw-Hill, 2004.

## Próximos pasos posibles
- Conectar el dashboard a una fuente de datos en vivo para actualización automática del inventario.
- Ampliar la matriz de compatibilidad a los grupos RESPEL restantes no cubiertos en esta primera versión.
- Agregar un indicador de fecha de última auditoría por ubicación.
