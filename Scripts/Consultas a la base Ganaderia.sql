-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABLA PESADORES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Obtengo todos los datos del pesador

SELECT p.nro_dni,p.nom_pesador,p.ap_pesador,p.contrasenia,p.correo,p.cod_rol,r.desc_rol,p.estado_pesador,e.desc_estado
 FROM pesadores p 
INNER JOIN rol_usuarios r ON p.cod_rol=r.cod_rol
INNER JOIN estados e ON p.estado_pesador=e.cod_estado
WHERE p.nro_dni=3;



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABLA ESTADOS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Obtengo todos los estados
SELECT * FROM estados;



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABLA LOTES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Obtengo todos los datos de los lotes y su estado

SELECT l.cod_lote, l.desc_lote, l.estado_lote, e.desc_estado
FROM lotes l
INNER JOIN estados e ON l.estado_lote=e.cod_estado;




-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABLA POTREROS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Obtengo todos los datos de los potreros
SELECT p.cod_potrero, p.desc_potrero , p.hectareas, p.estado_potrero,e.desc_estado 
FROM potreros p 
INNER JOIN estados e 
ON p.estado_potrero=e.cod_estado
WHERE p.cod_potrero=1;



-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABLA RAZAS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Obtengo todos los datos de razas y su estado

SELECT r.cod_raza, r.desc_raza, r.estado_raza, e.desc_estado
FROM razas r
INNER JOIN estados e ON r.estado_raza=e.cod_estado;




-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABLA CATEGORIAS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Obtengo todas las categorias y su estado

SELECT c.cod_categoria, c.desc_categoria, c.estado_categoria, e.desc_estado
FROM categorias c
INNER JOIN estados e ON c.estado_categoria=e.cod_estado;




-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TABLA TATUAJES >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- Obtengo todos los tatuajes y sus estados

SELECT t.cod_tatuaje, t.desc_tatuaje, t.caravana, t.estado_tatuaje, e.desc_estado, t.colocacion_caravana, t.observacion
FROM tatuajes t
INNER JOIN estados e ON t.estado_tatuaje=e.cod_estado;



-- Traigo la ultima caravana asociada a un tatuaje en particular

SELECT MAX(t.cod_tatuaje), t.desc_tatuaje, t.caravana, t.estado_tatuaje, e.desc_estado, t.colocacion_caravana, t.observacion
FROM tatuajes t
INNER JOIN estados e ON t.estado_tatuaje=e.cod_estado
WHERE t.caravana LIKE '%c3%';