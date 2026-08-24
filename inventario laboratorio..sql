BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "CLASIFICACIONES" (
	"ABREVIATURA"	TEXT,
	"CLASIFICACIÓN"	TEXT
);
CREATE TABLE IF NOT EXISTS "Reactivos" (
	"NOMBRE"	TEXT,
	"CLASIFICACIÓN"	TEXT,
	"UNIDADES"	INTEGER,
	"UNIDAD_MEDIDA"	TEXT,
	"CANTIDAD"	INTEGER,
	"OBSERVACIONES"	TEXT,
	"UBICACIÓN"	TEXT
);
CREATE TABLE IF NOT EXISTS detalle_riesgos(
  cajon TEXT,
  reactivo_1 TEXT,
  grupo_1 INT,
  reactivo_2 TEXT,
  grupo_2 INT,
  codigo_riesgo,
  que_significa
);
CREATE TABLE IF NOT EXISTS equivalencia_grupos (
    codigo_categoria TEXT,
    grupo_respel INTEGER
);
CREATE TABLE IF NOT EXISTS matriz_incompatibilidad (
    grupo_a INTEGER,
    grupo_b INTEGER,
    codigo TEXT,
    descripcion TEXT
);
CREATE TABLE IF NOT EXISTS recomendaciones_reubicacion(
  reactivo,
  cajon_actual,
  riesgos_que_causa,
  tipo_de_riesgo,
  cajon_recomendado
);
CREATE TABLE IF NOT EXISTS resumen_riesgo_cajones(
  cajon TEXT,
  num_riesgos
);
CREATE TABLE IF NOT EXISTS verificacion_solucion(
  riesgos_detectados,
  cajones_afectados,
  reactivos_a_reubicar,
  riesgos_restantes
);
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AMN','ACIDOS MINERALES NO OXIDANTES');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AMO','ACIDOS MINERALES OXIDANTES');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AO','ACIDOS ORGANICOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AG','ALCOHOLES Y GLICOLES');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AD','ALDEHÍDOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AA','ALCALIS Y AMINAS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AN','AMIDAS Y NITRUROS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('AH','ANHIDRIDOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('CA','COMPUESTOS AROMÁTICOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('CH','COMPUESTOS HALÓGENADOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('CI','CIANUROS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('ES','ESTERES');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('ET','ETERES');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('HD','HIDRUROS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('HCAI','HIDROCARBUROS ALIFATICOS INSATURADOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('HCAS','HIDROCARBUROS ALIFATICOS SATURADOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('MMC','METALES, METALOIDES Y COMPUESTOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('NI','NITRILOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('OF','OXIDANTES FUERTES');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('PX','PEROXIDOS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('PO','POLÍMEROS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('SPS','SULFUROS Y POLISULFUROS');
INSERT INTO "CLASIFICACIONES" ("ABREVIATURA","CLASIFICACIÓN") VALUES ('N/A','NO APLICA GRUPOS REACTIVOS ESPECIFICOS');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('4-nitroanilina','AA',3,'g',60,NULL,'Mesa 1, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('4-nitroanilina','AA',4,'g',80,NULL,'Mesa 1, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Aceite de Oliva','AA',2,'mL',560,'Sin etiquetado correcto','Mesa 1, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ácido bórico','AMN',6,'g',3300,'Sin novedad','Mesa 1, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Amoniaco','AA',3,'mL',3000,NULL,'Mesa 1, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Anilina','AA',1,'mL',100,NULL,'Mesa 1, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Arginina','AA',5,'g',100,NULL,'Mesa 1, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Bicarbonato de potasio','AA',3,'g',300,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Bicarbonato de sodio','AA',8,'g',800,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Bismark Brown R','AA',1,'g',20,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Carbonato de sodio','AA',6,'g',600,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Caseina','AA',1,'g',100,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloruro de amonio','AA',3,'g',300,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Fenilhidrazina','AA',1,'mL',100,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Fosfato de sodio di básico','AA',9,'g',900,NULL,'Mesa 1, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Galactosa','AA',5,'g',250,'Sin etiquetado correcto','Mesa 1, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Glicina','AA',5,'g',500,NULL,'Mesa 1, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Hidroxido de bario','AA',1,'g',100,NULL,'Mesa 1, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Hidróxido de potasio','AA',2,'g',200,NULL,'Mesa 1, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('L valina','AA',4,'g',400,NULL,'Mesa 1, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Leucina','AA',8,'g',800,NULL,'Mesa 2, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Lisina','AA',1,'g',100,NULL,'Mesa 2, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Metilamina','AA',1,'mL',100,NULL,'Mesa 2, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('o - toluidina','AA',3,'mL',3000,NULL,'Mesa 2, cajon 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Oxalato de amonio mono hidratado','AA',4,'g',400,NULL,'Mesa 2, cajon 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Piridina','AA',8,'mL',8000,NULL,'Mesa 2, cajon 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('p-nitroanilina','AA',1,'g',100,NULL,'Mesa 2, cajon 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Reactivo fenol folin','AA',2,'mL',200,NULL,'Mesa 2, cajon 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Sucinato de sodio','AA',1,'g',100,NULL,'Mesa 2, cajon 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Sulfato de amonio','AA',2,'g',200,NULL,'Mesa 2, cajon 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tetraborato de sodio','AA',5,'g',1900,'Producto columna 3, fila 1 y mal etiquetado','Mesa 2, cajon 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tetrametiletilendiamina','AA',1,'mL',100,NULL,'Mesa 2, cajon 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tiosulfato de sodio','AA',3,'g',600,'Producto fila 2 y 3 mal etiquetados','Mesa 2, cajon 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tirosina','AA',1,'g',100,NULL,'Mesa 2, cajon 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tris(hidroximetil)aminometano','AA',2,'g',550,'Sin etiquetado correcto','Mesa 2, cajon 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('urea','AN',1,'g',100,NULL,'Mesa 2, cajon 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Urea','AN',4,'g',400,NULL,'Mesa 2, cajon 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Acetona','CE',4,'mL',4000,NULL,'Mesa 3, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ciclohexanona','CE',1,'mL',1000,NULL,'Mesa 3, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Formol','AD',4,'mL',4000,NULL,'Mesa 3, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Glutaraldehido','AD',1,'mL',1000,NULL,'Mesa 3, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Glutaraldehido','AD',1,'mL',100,NULL,'Mesa 3, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Metiletil cetona','CE',1,'mL',1000,NULL,'Mesa 3, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('2 metil 2 propanol','AG',1,'mL',1000,NULL,'Mesa 3, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('3metil 1 butanol','AG',2,'mL',2000,NULL,'Mesa 3, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alcohol alílico','AG',1,'mL',1000,NULL,'Mesa 3, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alcohol amilico','AG',2,'mL',2000,NULL,'Mesa 3, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alcohol etílico','AG',1,'mL',1000,NULL,'Mesa 3, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alcohol etílico','AG',1,'mL',1000,NULL,'Mesa 3, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alcohol isoamilitico','AG',7,'mL',7000,NULL,'Mesa 3, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alcohol isobutilico','AG',3,'mL',3000,NULL,'Mesa 3, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alcohol isopropílico','AG',2,'mL',2000,NULL,'Mesa 3, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Butanol','AG',4,'mL',4000,NULL,'Mesa 4, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('D-Sorbitol','AG',4,'g',4000,'Sin etiquetado correcto','Mesa 4, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Etilenglicol','AG',4,'mL',4000,NULL,'Mesa 4, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Glicerina','AG',2,'mL',2000,NULL,'Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('catecol','AG',2,'g',200,NULL,'Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Glucosa','AG',1,'g',100,'Sin etiquetado correcto','Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Metanol','AG',3,'mL',3000,NULL,'Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Metoxietanol','AG',1,'mL',1000,NULL,'Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Propanol','AG',1,'mL',1000,NULL,'Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Propanol','AG',1,'mL',1000,NULL,'Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Propilenglicol','AG',2,'mL',2000,NULL,'Mesa 4, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Nitrito de sodio','AMN',4,'g',400,NULL,'Mesa 5, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tiosulfato de sodio pentahidratado','AMN',2,'g',1300,'Sin etiquetado correcto','Mesa 5, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('2-Hydroxy-3,5-dinitrobenzoic acid hidratado','AO',3,'g',1100,'Sin etiquetado correcto','Mesa 5, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Acetato de sodio','AO',3,'g',300,NULL,'Mesa 5, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ácido 3.5 dinitrosalicilico','AO',9,'g',740,'Producto columna 4, fila 1 y 3 mal etiquetado','Mesa 5, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Acido acetico','AO',1,'mL',1000,NULL,'Mesa 5, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ácido acético','AO',1,'mL',1000,NULL,'Mesa 5, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ácido cítrico','AO',2,'g',200,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ácido láctico','AO',1,'mL',1000,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ácido oléico','AO',4,'mL',4000,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Acido poligalacturónico','AO',2,'g',200,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('ascorbato','AO',1,'g',100,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('ácidos ascórbico','AO',4,'g',400,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Anhidrido acetico','AH',2,'mL',2000,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('anhidro acético','AH',1,'mL',1000,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Citrato de sodio','AO',2,'g',200,NULL,'Mesa 5, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Fructosa','AO',1,'g',200,'Sin etiquetado correcto','Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ftalato ácido de potasio','AO',1,'g',300,'Sin etiquetado correcto','Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Galacturonico monohidrato','AO',4,'g',400,NULL,'Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Lactosa','AO',8,'g',1900,'Sin etiquetado correcto','Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Maltosa','AO',6,'g',1500,'Sin etiquetado correcto','Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Oxalato de sodio','AO',5,'g',2900,'Sin etiquetado correcto fila 2 a 5','Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Sacarosa','AO',4,'g',400,NULL,'Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tartrato de potasio y sodio','AO',3,'g',300,NULL,'Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tartrato de sodio','AO',4,'g',400,NULL,'Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Vinagre','AO',1,'mL',100,'Sin etiquetado correcto','Mesa 5, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('2-nitroalinina','CA',15,'g',150,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('4-Nitrofenol','CA',1,'g',10,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Azul de metileno','CA',5,'g',410,'Producto del 3 a 5 mal etiquetado','Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Benceno','CA',1,'mL',10,'Sin etiquetado correcto','Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Benceno','CA',1,'mL',1000,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Carmín','CA',2,'g',20,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloresterol','CA',1,'g',10,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Dihidroxi benceno','CA',1,'g',10,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Gallocyanine','CA',2,'g',20,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Nitrofenol','CA',2,'g',200,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Resorcinol','CA',1,'g',100,'Sin etiquetado correcto','Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Xileno','CA',1,'mL',100,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Bromo','CH',1,'mL',200,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Bromo fenol azul','CH',11,'g',11,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Dicloro metano','CH',1,'mL',1000,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tetracloruro de carbono','CH',3,'mL',3000,NULL,'Mesa 5, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Yoduro de potasio','MMC',4,'g',2500,'Sin etiquetado correcto','Mesa 6, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Nitroprusiato de sodio','CI',2,'g',200,NULL,'Mesa 6, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Acetato de etilo','ES',1,'mL',1000,NULL,'Mesa 6, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Acetato de isoamilo','ES',3,'mL',3000,NULL,'Mesa 6, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Acetato de isopentilo','ES',1,'mL',1000,NULL,'Mesa 6, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Dietileter','ET',3,'mL',3000,NULL,'Mesa 6, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Bencina de petroleo','HCAS',2,'mL',2000,NULL,'Mesa 6, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ciclohexano','HCAS',2,'mL',2000,NULL,'Mesa 6, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('acido fosforico','AMN',2,'mL',2000,NULL,'Mesa 6, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloruro de cadmio','MMC',4,'g',400,NULL,'Mesa 6, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloruro de calcio','MMC',1,'g',100,NULL,'Mesa 6, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloruro de magnesio hecahidratado','MMC',1,'g',600,'Sin etiquetado correcto','Mesa 6, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Sulfato cúprico','MMC',1,'g',400,'Sin etiquetado correcto','Mesa 6, cajón 3');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Dicromato de potasio','OF',1,'g',100,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Nitrato de sodio','OF',1,'g',100,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Albúmina de huevo','PO',1,'g',100,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alfa amilasa','PO',1,'g',10,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Bovine hemoglobin','PO',2,'g',20,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Caseína hidrolizada','PO',2,'g',20,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Catalasa 300','PO',1,'g',10,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Celulosa','PO',1,'g',100,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Enzyme Pectolytique liquide','PO',1,'mL',10,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Goma arábiga','PO',1,'g',1000,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Hemoglobina de sangre bobina','PO',1,'g',10,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Mezcla de sales biliares','PO',4,'g',40,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('papaina','PO',1,'g',100,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Papaina','PO',1,'g',100,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Pectina','PO',3,'g',300,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Pectinex','PO',1,'mL',100,NULL,'Mesa 6, cajón 4');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Pepsina','PO',7,'g',700,NULL,'Mesa 6, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('SULFATO','PENDIENTE',1,'g',100,NULL,'Mesa 6, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Sílica gel','PO',2,'g',1500,'Sin etiquetado correcto y un producto en bolsa','Mesa 6, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tripsina','PO',1,'g',10,NULL,'Mesa 6, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tripsina pancreas porcino','PO',1,'g',10,NULL,'Mesa 6, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tritón X-100','PO',2,'mL',320,'Sin etiquetado correcto','Mesa 6, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Tween 20','PO',1,'mL',250,'Sin novedad','Mesa 6, cajón 5');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Alginato de sodio','N/A',1,'g',100,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Arena de mar','N/A',1,'g',1000,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloruro de potasio','N/A',1,'g',1000,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloruro de potasio','N/A',1,'mL',20,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Cloruro de potasio','N/A',5,'mL',3400,'Producto columna 2, fila 1 mal etiquetado  [VERIFICAR - Sin unidad explícita en celda original; asumido mL por consistencia con las otras dos filas]','Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Dimetilsulfóxido','N/A',1,'mL',1000,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('EGTA','N/A',1,'g',10,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Ninhidrina','AD',9,'g',25,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Sal sódica dihidrato','AO',3,'g',300,NULL,'Mesa 7, cajón 2');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Solución Buffer pH 10','N/A',3,'mL',2600,'Sin etiquetado correcto','Mesa 3, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Solución Buffer pH 4','N/A',2,'mL',740,'Sin etiquetado correcto','Mesa 3, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Solución Buffer pH 7','N/A',2,'mL',710,'Sin etiquetado correcto','Mesa 3, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('Solución de limpieza de electrodos','N/A',1,'mL',1000,'Sin etiquetado correcto','Mesa 3, cajón 1');
INSERT INTO "Reactivos" ("NOMBRE","CLASIFICACIÓN","UNIDADES","UNIDAD_MEDIDA","CANTIDAD","OBSERVACIONES","UBICACIÓN") VALUES ('wasserstandard 5000ppm','N/A',1,'mL',1000,NULL,'Mesa 3, cajón 1');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','4-nitroanilina',7,'Ácido bórico',1,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','4-nitroanilina',10,'Ácido bórico',1,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','4-nitroanilina',7,'Ácido bórico',1,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','4-nitroanilina',10,'Ácido bórico',1,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Aceite de Oliva',7,'Ácido bórico',1,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Aceite de Oliva',10,'Ácido bórico',1,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Ácido bórico',1,'Amoniaco',7,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Ácido bórico',1,'Amoniaco',10,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Ácido bórico',1,'Anilina',7,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Ácido bórico',1,'Anilina',10,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Ácido bórico',1,'Arginina',7,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 1, cajon 2','Ácido bórico',1,'Arginina',10,'H','Generacion de calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tetraborato de sodio',10,'Urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tetraborato de sodio',10,'urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tetrametiletilendiamina',10,'Urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tetrametiletilendiamina',10,'urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tiosulfato de sodio',10,'Urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tiosulfato de sodio',10,'urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tirosina',10,'Urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tirosina',10,'urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tris(hidroximetil)aminometano',10,'Urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 2, cajon 4','Tris(hidroximetil)aminometano',10,'urea',25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Ácido cítrico',3,'Anhidrido acetico',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Ácido cítrico',3,'anhidro acético',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Ácido láctico',3,'Anhidrido acetico',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Ácido láctico',3,'anhidro acético',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Ácido oléico',3,'Anhidrido acetico',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Ácido oléico',3,'anhidro acético',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Acido poligalacturónico',3,'Anhidrido acetico',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Acido poligalacturónico',3,'anhidro acético',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','ascorbato',3,'Anhidrido acetico',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','ascorbato',3,'anhidro acético',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','ácidos ascórbico',3,'Anhidrido acetico',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','ácidos ascórbico',3,'anhidro acético',41,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','Anhidrido acetico',41,'Citrato de sodio',3,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 5, cajón 3','anhidro acético',41,'Citrato de sodio',3,'ADVERTENCIA','Grupo 41 no debe mezclarse con ninguna sustancia');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de cadmio',21,'GFHF','Gases inflamables y toxicos + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de cadmio',22,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de cadmio',23,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de cadmio',24,'S','Solubilizacion de sustancias toxicas');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de calcio',21,'GFHF','Gases inflamables y toxicos + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de calcio',22,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de calcio',23,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de calcio',24,'S','Solubilizacion de sustancias toxicas');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de magnesio hecahidratado',21,'GFHF','Gases inflamables y toxicos + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de magnesio hecahidratado',22,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de magnesio hecahidratado',23,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Cloruro de magnesio hecahidratado',24,'S','Solubilizacion de sustancias toxicas');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Sulfato cúprico',21,'GFHF','Gases inflamables y toxicos + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Sulfato cúprico',22,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Sulfato cúprico',23,'GFH','Gases inflamables + calor');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 3','acido fosforico',1,'Sulfato cúprico',24,'S','Solubilizacion de sustancias toxicas');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Albúmina de huevo',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Alfa amilasa',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Bovine hemoglobin',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Caseína hidrolizada',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Catalasa 300',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Celulosa',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Enzyme Pectolytique liquide',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Goma arábiga',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Hemoglobina de sangre bobina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Mezcla de sales biliares',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Papaina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Pectina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'Pectinex',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Dicromato de potasio',38,'papaina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Albúmina de huevo',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Alfa amilasa',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Bovine hemoglobin',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Caseína hidrolizada',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Catalasa 300',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Celulosa',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Enzyme Pectolytique liquide',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Goma arábiga',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Hemoglobina de sangre bobina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Mezcla de sales biliares',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Papaina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Pectina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'Pectinex',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "detalle_riesgos" ("cajon","reactivo_1","grupo_1","reactivo_2","grupo_2","codigo_riesgo","que_significa") VALUES ('Mesa 6, cajón 4','Nitrato de sodio',38,'papaina',37,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AMN',1);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AO',3);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AG',4);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AD',5);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('CE',19);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AA',7);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AA',10);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AN',6);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AN',25);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('AH',41);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('CA',16);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('CH',17);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('CI',11);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('ES',13);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('ET',14);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('HCAS',29);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('MMC',21);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('MMC',22);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('MMC',23);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('MMC',24);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('OF',38);
INSERT INTO "equivalencia_grupos" ("codigo_categoria","grupo_respel") VALUES ('PO',37);
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (1,7,'H','Generacion de calor');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (1,10,'H','Generacion de calor');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (1,21,'GFHF','Gases inflamables y toxicos + calor');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (1,22,'GFH','Gases inflamables + calor');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (1,23,'GFH','Gases inflamables + calor');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (1,24,'S','Solubilizacion de sustancias toxicas');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (11,17,'H','Generacion de calor');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (10,25,'U','Riesgo posible sin evidencia confirmada');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (37,38,'HFGT','Calor + fuego + gases toxicos');
INSERT INTO "matriz_incompatibilidad" ("grupo_a","grupo_b","codigo","descripcion") VALUES (3,41,'ADVERTENCIA','Grupo 41 (reactivo al agua) no debe mezclarse con ninguna sustancia');
INSERT INTO "recomendaciones_reubicacion" ("reactivo","cajon_actual","riesgos_que_causa","tipo_de_riesgo","cajon_recomendado") VALUES ('Ácido bórico','Mesa 1, cajon 2',12,'Generación de calor','Mesa 3, cajón 1');
INSERT INTO "recomendaciones_reubicacion" ("reactivo","cajon_actual","riesgos_que_causa","tipo_de_riesgo","cajon_recomendado") VALUES ('Urea','Mesa 2, cajón 4',10,'Riesgo posible, sin evidencia confirmada','Mesa 1, cajón 4');
INSERT INTO "recomendaciones_reubicacion" ("reactivo","cajon_actual","riesgos_que_causa","tipo_de_riesgo","cajon_recomendado") VALUES ('Anhidrido acetico','Mesa 5, cajón 3',14,'No debe mezclarse con ninguna sustancia (reactivo al agua)','Mesa 3, cajón 1');
INSERT INTO "recomendaciones_reubicacion" ("reactivo","cajon_actual","riesgos_que_causa","tipo_de_riesgo","cajon_recomendado") VALUES ('Acido fosforico','Mesa 6, cajón 3',16,'Gases inflamables/tóxicos + calor + solubilización de tóxicos','Mesa 1, cajón 4');
INSERT INTO "recomendaciones_reubicacion" ("reactivo","cajon_actual","riesgos_que_causa","tipo_de_riesgo","cajon_recomendado") VALUES ('Dicromato de potasio','Mesa 6, cajón 4',14,'Calor + fuego + gases tóxicos','Mesa 3, cajón 1');
INSERT INTO "recomendaciones_reubicacion" ("reactivo","cajon_actual","riesgos_que_causa","tipo_de_riesgo","cajon_recomendado") VALUES ('Nitrato de sodio','Mesa 6, cajón 4',14,'Calor + fuego + gases tóxicos','Mesa 3, cajón 1');
INSERT INTO "resumen_riesgo_cajones" ("cajon","num_riesgos") VALUES ('Mesa 6, cajón 4',28);
INSERT INTO "resumen_riesgo_cajones" ("cajon","num_riesgos") VALUES ('Mesa 6, cajón 3',16);
INSERT INTO "resumen_riesgo_cajones" ("cajon","num_riesgos") VALUES ('Mesa 5, cajón 3',14);
INSERT INTO "resumen_riesgo_cajones" ("cajon","num_riesgos") VALUES ('Mesa 1, cajon 2',12);
INSERT INTO "resumen_riesgo_cajones" ("cajon","num_riesgos") VALUES ('Mesa 2, cajon 4',10);
INSERT INTO "verificacion_solucion" ("riesgos_detectados","cajones_afectados","reactivos_a_reubicar","riesgos_restantes") VALUES (80,5,6,0);
COMMIT;
