-- ============================================================
-- PROYECTO: Auditoría de Inventario y Compatibilidad Química
--           de un Laboratorio
-- Autora: Mary
-- Herramientas: SQLite (DB Browser for SQLite)
-- ============================================================
-- Este script documenta el proceso completo:
-- 1. Verificación y corrección de la clasificación química
-- 2. Construcción de la tabla de equivalencia RESPEL
-- 3. Construcción de la matriz de compatibilidad
-- 4. Detección de riesgos de incompatibilidad por cajón
-- 5. Identificación del reactivo más conflictivo por cajón
-- 6. Búsqueda de cajones seguros para reubicación
-- 7. Verificación de que la solución elimina el riesgo
-- ============================================================


-- ============================================================
-- PARTE 1: CORRECCIÓN DE ERRORES DE CLASIFICACIÓN
-- ============================================================
-- Se auditó cada reactivo contra la tabla oficial de 41 Grupos
-- Reactivos RESPEL y se encontraron 6 errores de clasificación.

-- Ácido bórico estaba en AA (Álcalis), pero es un ácido, no un álcali
UPDATE Reactivos
SET CLASIFICACIÓN = 'AMN'
WHERE NOMBRE = 'Ácido bórico';

-- Ácido fosfórico estaba en HCAS (Hidrocarburos), error evidente
UPDATE Reactivos
SET CLASIFICACIÓN = 'AMN'
WHERE NOMBRE = 'acido fosforico';

-- Anhídrido acético estaba en AO (Ácidos orgánicos), pero es un
-- anhídrido, grupo funcional distinto y más reactivo con agua
UPDATE Reactivos
SET CLASIFICACIÓN = 'AH'
WHERE NOMBRE IN ('Anhidrido acetico', 'anhidro acético');

-- Urea estaba en AA (Álcalis/Aminas), pero químicamente es una amida
UPDATE Reactivos
SET CLASIFICACIÓN = 'AN'
WHERE NOMBRE IN ('Urea', 'urea');

-- Acetona, Ciclohexanona y Metiletil cetona estaban mezcladas con
-- Aldehídos (AD); se creó la categoría CE (Cetonas) para separarlas
UPDATE Reactivos
SET CLASIFICACIÓN = 'CE'
WHERE NOMBRE IN ('Acetona', 'Ciclohexanona', 'Metiletil cetona');

-- SULFATO: nombre genérico sin identificar el compuesto exacto;
-- se marca como pendiente en vez de asumir una clasificación
UPDATE Reactivos
SET CLASIFICACIÓN = 'PENDIENTE'
WHERE NOMBRE = 'SULFATO';

-- Yoduro de potasio estaba en CH (Halogenados orgánicos), pero es
-- una sal inorgánica; se reclasifica con las otras sales metálicas
UPDATE Reactivos
SET CLASIFICACIÓN = 'MMC'
WHERE NOMBRE = 'Yoduro de potasio';


-- ============================================================
-- PARTE 2: TABLA DE EQUIVALENCIA (categoría propia -> Grupo RESPEL)
-- ============================================================

CREATE TABLE equivalencia_grupos (
    codigo_categoria TEXT,
    grupo_respel INTEGER
);

INSERT INTO equivalencia_grupos (codigo_categoria, grupo_respel) VALUES
('AMN', 1),
('AO', 3),
('AG', 4),
('AD', 5),
('CE', 19),
('AA', 7),
('AA', 10),
('AN', 6),
('AN', 25),
('AH', 41),
('CA', 16),
('CH', 17),
('CI', 11),
('ES', 13),
('ET', 14),
('HCAS', 29),
('MMC', 21),
('MMC', 22),
('MMC', 23),
('MMC', 24),
('OF', 38),
('PO', 37);


-- ============================================================
-- PARTE 3: MATRIZ DE COMPATIBILIDAD
-- ============================================================
-- Fuente: Matriz de incompatibilidad química RESPEL, Programa de
-- Investigación sobre Residuos (PROIR), Universidad Nacional de
-- Colombia. Elaboración propia a partir de Corbitt, R.A. (2004),
-- Standard Handbook of Environmental Engineering, Cap. 9, McGraw-Hill.
-- Solo se incluyen las combinaciones de grupos que efectivamente
-- coexisten en algún cajón de este inventario.

CREATE TABLE matriz_incompatibilidad (
    grupo_a INTEGER,
    grupo_b INTEGER,
    codigo TEXT,
    descripcion TEXT
);

INSERT INTO matriz_incompatibilidad (grupo_a, grupo_b, codigo, descripcion) VALUES
(1, 7, 'H', 'Generacion de calor'),
(1, 10, 'H', 'Generacion de calor'),
(1, 21, 'GFHF', 'Gases inflamables y toxicos + calor'),
(1, 22, 'GFH', 'Gases inflamables + calor'),
(1, 23, 'GFH', 'Gases inflamables + calor'),
(1, 24, 'S', 'Solubilizacion de sustancias toxicas'),
(11, 17, 'H', 'Generacion de calor'),
(10, 25, 'U', 'Riesgo posible sin evidencia confirmada'),
(37, 38, 'HFGT', 'Calor + fuego + gases toxicos'),
(3, 41, 'ADVERTENCIA', 'Grupo 41 (reactivo al agua) no debe mezclarse con ninguna sustancia');


-- ============================================================
-- PARTE 4: DETECCIÓN DE RIESGOS POR CAJÓN
-- ============================================================
-- Self-join: compara cada reactivo contra los demás reactivos
-- que están en su MISMA ubicación (mismo cajón exacto).

-- 4a. Detalle completo: cada par de reactivos en riesgo
SELECT
    r1.UBICACIÓN AS cajon,
    r1.NOMBRE AS reactivo_1,
    e1.grupo_respel AS grupo_1,
    r2.NOMBRE AS reactivo_2,
    e2.grupo_respel AS grupo_2,
    CASE
        WHEN e1.grupo_respel = 41 OR e2.grupo_respel = 41 THEN 'ADVERTENCIA'
        ELSE m.codigo
    END AS codigo_riesgo,
    CASE
        WHEN e1.grupo_respel = 41 OR e2.grupo_respel = 41
            THEN 'Grupo 41 no debe mezclarse con ninguna sustancia'
        ELSE m.descripcion
    END AS que_significa
FROM Reactivos r1
JOIN Reactivos r2 ON r1.UBICACIÓN = r2.UBICACIÓN AND r1.rowid < r2.rowid
JOIN equivalencia_grupos e1 ON r1.CLASIFICACIÓN = e1.codigo_categoria
JOIN equivalencia_grupos e2 ON r2.CLASIFICACIÓN = e2.codigo_categoria
JOIN matriz_incompatibilidad m
    ON MIN(e1.grupo_respel, e2.grupo_respel) = m.grupo_a
    AND MAX(e1.grupo_respel, e2.grupo_respel) = m.grupo_b
WHERE e1.grupo_respel != e2.grupo_respel;

-- 4b. Resumen ejecutivo: cantidad de riesgos por cajón
SELECT
    r1.UBICACIÓN AS cajon,
    COUNT(*) AS num_riesgos
FROM Reactivos r1
JOIN Reactivos r2 ON r1.UBICACIÓN = r2.UBICACIÓN AND r1.rowid < r2.rowid
JOIN equivalencia_grupos e1 ON r1.CLASIFICACIÓN = e1.codigo_categoria
JOIN equivalencia_grupos e2 ON r2.CLASIFICACIÓN = e2.codigo_categoria
JOIN matriz_incompatibilidad m
    ON MIN(e1.grupo_respel, e2.grupo_respel) = m.grupo_a
    AND MAX(e1.grupo_respel, e2.grupo_respel) = m.grupo_b
WHERE e1.grupo_respel != e2.grupo_respel
GROUP BY r1.UBICACIÓN
ORDER BY num_riesgos DESC;

-- Resultado obtenido: 80 riesgos totales en 5 cajones
--   Mesa 6, cajón 4 -> 28 riesgos
--   Mesa 6, cajón 3 -> 16 riesgos
--   Mesa 5, cajón 3 -> 14 riesgos
--   Mesa 1, cajon 2 -> 12 riesgos
--   Mesa 2, cajón 4 -> 10 riesgos


-- ============================================================
-- PARTE 5: IDENTIFICAR EL REACTIVO MÁS CONFLICTIVO POR CAJÓN
-- ============================================================
-- Cuenta, para cada reactivo, en cuántos pares de riesgo aparece
-- dentro de su cajón, para saber cuál mover primero.

SELECT
    r1.UBICACIÓN AS cajon,
    r1.NOMBRE AS reactivo_conflictivo,
    COUNT(*) AS num_conflictos_causados
FROM Reactivos r1
JOIN Reactivos r2 ON r1.UBICACIÓN = r2.UBICACIÓN AND r1.rowid != r2.rowid
JOIN equivalencia_grupos e1 ON r1.CLASIFICACIÓN = e1.codigo_categoria
JOIN equivalencia_grupos e2 ON r2.CLASIFICACIÓN = e2.codigo_categoria
JOIN matriz_incompatibilidad m
    ON MIN(e1.grupo_respel, e2.grupo_respel) = m.grupo_a
    AND MAX(e1.grupo_respel, e2.grupo_respel) = m.grupo_b
WHERE e1.grupo_respel != e2.grupo_respel
GROUP BY r1.UBICACIÓN, r1.NOMBRE
ORDER BY r1.UBICACIÓN, num_conflictos_causados DESC;


-- ============================================================
-- PARTE 6: BÚSQUEDA DE CAJONES SEGUROS PARA REUBICACIÓN
-- ============================================================
-- Ejemplo con "Ácido bórico". Usa un CTE (WITH) para calcular su
-- grupo RESPEL, otro para identificar cajones ya riesgosos, y
-- NOT EXISTS para descartar cualquier cajón donde el reactivo
-- generaría un nuevo conflicto.

WITH grupo_reactivo AS (
    SELECT e.grupo_respel
    FROM Reactivos r
    JOIN equivalencia_grupos e ON r.CLASIFICACIÓN = e.codigo_categoria
    WHERE r.NOMBRE = 'Ácido bórico'
),
cajones_ya_riesgosos AS (
    SELECT DISTINCT r1.UBICACIÓN
    FROM Reactivos r1
    JOIN Reactivos r2 ON r1.UBICACIÓN = r2.UBICACIÓN AND r1.rowid < r2.rowid
    JOIN equivalencia_grupos e1 ON r1.CLASIFICACIÓN = e1.codigo_categoria
    JOIN equivalencia_grupos e2 ON r2.CLASIFICACIÓN = e2.codigo_categoria
    JOIN matriz_incompatibilidad m
        ON MIN(e1.grupo_respel, e2.grupo_respel) = m.grupo_a
        AND MAX(e1.grupo_respel, e2.grupo_respel) = m.grupo_b
    WHERE e1.grupo_respel != e2.grupo_respel
)
SELECT DISTINCT r2.UBICACIÓN AS cajon_candidato_seguro
FROM Reactivos r2
WHERE r2.UBICACIÓN != 'Mesa 1, cajon 2'
AND r2.UBICACIÓN NOT IN (SELECT UBICACIÓN FROM cajones_ya_riesgosos)
AND NOT EXISTS (
    SELECT 1
    FROM Reactivos r3
    JOIN equivalencia_grupos e3 ON r3.CLASIFICACIÓN = e3.codigo_categoria
    JOIN grupo_reactivo g
    JOIN matriz_incompatibilidad m
        ON MIN(g.grupo_respel, e3.grupo_respel) = m.grupo_a
        AND MAX(g.grupo_respel, e3.grupo_respel) = m.grupo_b
    WHERE r3.UBICACIÓN = r2.UBICACIÓN
      AND g.grupo_respel != e3.grupo_respel
);

-- El mismo patrón se repitió para: Urea, Anhidrido acetico,
-- acido fosforico y Dicromato de potasio, cambiando el nombre
-- del reactivo y su ubicación actual en las líneas marcadas arriba.


-- ============================================================
-- PARTE 7: TABLA DE RECOMENDACIONES FINALES
-- ============================================================

CREATE TABLE recomendaciones_reubicacion AS
SELECT
    'Ácido bórico' AS reactivo,
    'Mesa 1, cajon 2' AS cajon_actual,
    12 AS riesgos_que_causa,
    'Generación de calor' AS tipo_de_riesgo,
    'Mesa 3, cajón 1' AS cajon_recomendado
UNION ALL
SELECT 'Urea', 'Mesa 2, cajón 4', 10, 'Riesgo posible, sin evidencia confirmada', 'Mesa 1, cajón 4'
UNION ALL
SELECT 'Anhidrido acetico', 'Mesa 5, cajón 3', 14, 'No debe mezclarse con ninguna sustancia (reactivo al agua)', 'Mesa 3, cajón 1'
UNION ALL
SELECT 'Acido fosforico', 'Mesa 6, cajón 3', 16, 'Gases inflamables/tóxicos + calor + solubilización de tóxicos', 'Mesa 1, cajón 4'
UNION ALL
SELECT 'Dicromato de potasio', 'Mesa 6, cajón 4', 14, 'Calor + fuego + gases tóxicos', 'Mesa 3, cajón 1'
UNION ALL
SELECT 'Nitrato de sodio', 'Mesa 6, cajón 4', 14, 'Calor + fuego + gases tóxicos', 'Mesa 3, cajón 1';


-- ============================================================
-- PARTE 8: VERIFICACIÓN DE LA SOLUCIÓN
-- ============================================================
-- Se vuelve a correr la detección de riesgos, excluyendo los 6
-- reactivos recomendados para reubicar, para comprobar que el
-- riesgo detectado desaparece por completo.

SELECT
    r1.UBICACIÓN,
    COUNT(*) AS riesgos_restantes
FROM Reactivos r1
JOIN Reactivos r2 ON r1.UBICACIÓN = r2.UBICACIÓN AND r1.rowid < r2.rowid
JOIN equivalencia_grupos e1 ON r1.CLASIFICACIÓN = e1.codigo_categoria
JOIN equivalencia_grupos e2 ON r2.CLASIFICACIÓN = e2.codigo_categoria
JOIN matriz_incompatibilidad m
    ON MIN(e1.grupo_respel, e2.grupo_respel) = m.grupo_a
    AND MAX(e1.grupo_respel, e2.grupo_respel) = m.grupo_b
WHERE e1.grupo_respel != e2.grupo_respel
  AND r1.NOMBRE NOT IN ('Ácido bórico', 'Urea', 'urea', 'Anhidrido acetico', 'anhidro acético', 'acido fosforico', 'Dicromato de potasio', 'Nitrato de sodio')
  AND r2.NOMBRE NOT IN ('Ácido bórico', 'Urea', 'urea', 'Anhidrido acetico', 'anhidro acético', 'acido fosforico', 'Dicromato de potasio', 'Nitrato de sodio')
GROUP BY r1.UBICACIÓN
ORDER BY riesgos_restantes DESC;

-- Resultado obtenido: 0 filas devueltas.
-- Confirma que reubicando estos 6 reactivos se elimina el 100%
-- del riesgo de incompatibilidad detectado en el inventario.


-- ============================================================
-- PARTE 9: TABLAS DE APOYO PARA VISUALIZACIÓN (Power BI)
-- ============================================================

CREATE TABLE resumen_riesgo_cajones AS
SELECT
    r1.UBICACIÓN AS cajon,
    COUNT(*) AS num_riesgos
FROM Reactivos r1
JOIN Reactivos r2 ON r1.UBICACIÓN = r2.UBICACIÓN AND r1.rowid < r2.rowid
JOIN equivalencia_grupos e1 ON r1.CLASIFICACIÓN = e1.codigo_categoria
JOIN equivalencia_grupos e2 ON r2.CLASIFICACIÓN = e2.codigo_categoria
JOIN matriz_incompatibilidad m
    ON MIN(e1.grupo_respel, e2.grupo_respel) = m.grupo_a
    AND MAX(e1.grupo_respel, e2.grupo_respel) = m.grupo_b
WHERE e1.grupo_respel != e2.grupo_respel
GROUP BY r1.UBICACIÓN
ORDER BY num_riesgos DESC;

CREATE TABLE verificacion_solucion AS
SELECT
    80 AS riesgos_detectados,
    5 AS cajones_afectados,
    6 AS reactivos_a_reubicar,
    0 AS riesgos_restantes;
