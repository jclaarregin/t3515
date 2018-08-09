USE ganaderia;

-- ----------------------------------------------------------
-- Cargamos la tabla de rol_usuarios
-- ----------------------------------------------------------
insert into `rol_usuarios` (`desc_rol`) values ('ADMINISTRADOR');
insert into `rol_usuarios` (`desc_rol`) values ('SUPER USUARIO');
insert into `rol_usuarios` (`desc_rol`) values ('USUARIO COMUN');


-- ----------------------------------------------------------
-- Cargamos la tabla de estados
-- ----------------------------------------------------------
insert into `estados` (`desc_estado`) values ('ACTIVO');
insert into `estados` (`desc_estado`) values ('INACTIVO');


-- ----------------------------------------------------------
-- Cargamos la tabla de usuarios
-- ----------------------------------------------------------
insert into `pesadores` (`nro_dni`,`nom_pesador`,`ap_pesador`,`contrasenia`,`correo`,`cod_rol`,`estado_pesador`) 
values (32795750,'CARLOS','ARREGIN',123,'CARLOS@GMAIL',1,1);



-- ----------------------------------------------------------
-- Cargamos la tabla de potreros
-- ----------------------------------------------------------
insert into `potreros` (`desc_potrero`,`estado_potrero`) values ('POTRERO 1',1);


-- ----------------------------------------------------------
-- Cargamos la tabla de tatuajes
-- ----------------------------------------------------------
insert into `tatuajes` (`desc_tatuaje`, `caravana`, `estado_tatuaje`, `colocacion_caravana`) 
values ('T2','C7',1,'2018-07-31');
insert into `tatuajes` (`desc_tatuaje`, `caravana`, `estado_tatuaje`, `colocacion_caravana`) 
values ('T3','C3',1,'2018-07-31');
insert into `tatuajes` (`desc_tatuaje`, `caravana`, `estado_tatuaje`, `colocacion_caravana`) 
values ('T4','C4',1,'2018-07-31'); 