REM   Script: ejercicio-repaso-primero-ASGBD
REM   Ejercicio de repaso de 2º ASIR ASGBD
Contenidos del primer curso

DROP TABLE SUCURSAL CASCADE CONSTRAINTS;

DROP TABLE TURISTA CASCADE CONSTRAINTS;

DROP TABLE HOTEL CASCADE CONSTRAINTS;

DROP TABLE VUELO CASCADE CONSTRAINTS;

DROP TABLE HOSPEDAR CASCADE CONSTRAINTS;

DROP TABLE VOLAR CASCADE CONSTRAINTS;

CREATE TABLE SUCURSAL ( 
    id_sucursal		INTEGER, 
    direccion		VARCHAR2(50), 
    tlfno			CHAR(9), 
    PRIMARY KEY (id_sucursal) 
);

DROP TABLE SUCURSAL CASCADE CONSTRAINTS;

DROP TABLE TURISTA CASCADE CONSTRAINTS;

DROP TABLE HOTEL CASCADE CONSTRAINTS;

DROP TABLE VUELO CASCADE CONSTRAINTS;

DROP TABLE HOSPEDAR CASCADE CONSTRAINTS;

DROP TABLE VOLAR CASCADE CONSTRAINTS;

CREATE TABLE sucursal ( 
    id_sucursal INTEGER NOT NULL, 
    direccion   VARCHAR2(50 CHAR) NOT NULL, 
    tlfno       CHAR(9 CHAR) NOT NULL 
);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( id_sucursal );

CREATE TABLE turista ( 
    id_turista           INTEGER NOT NULL, 
    nombre               VARCHAR2(25 CHAR) NOT NULL, 
    apellidos            VARCHAR2(50 CHAR) NOT NULL, 
    direccion            VARCHAR2(100 CHAR), 
    tlfno                CHAR(9 CHAR), 
    sucursal_id_sucursal INTEGER 
);

ALTER TABLE turista ADD CONSTRAINT turista_pk PRIMARY KEY ( id_turista );

ALTER TABLE turista 
    ADD CONSTRAINT turista_sucursal_fk FOREIGN KEY ( sucursal_id_sucursal ) 
        REFERENCES sucursal ( id_sucursal );

CREATE TABLE hotel ( 
    id_hotel  INTEGER NOT NULL, 
    nombre    VARCHAR2(50 CHAR) NOT NULL, 
    direccion VARCHAR2(100 CHAR), 
    ciudad    VARCHAR2(25 CHAR), 
    tlfno     CHAR(9 CHAR), 
    plazas    INTEGER NOT NULL 
);

ALTER TABLE hotel ADD CONSTRAINT hotel_pk PRIMARY KEY ( id_hotel );

CREATE TABLE vuelo ( 
    num_vuelo  INTEGER NOT NULL, 
    fecha      DATE NOT NULL, 
    hora       DATE NOT NULL, 
    origen     VARCHAR2(25 CHAR) NOT NULL, 
    destino    VARCHAR2(25 CHAR) NOT NULL, 
    plazas_tur INTEGER 
);

ALTER TABLE vuelo ADD CONSTRAINT vuelo_pk PRIMARY KEY ( num_vuelo );

CREATE TABLE hospedar ( 
    hotel_id_hotel     INTEGER NOT NULL, 
    turista_id_turista INTEGER NOT NULL, 
    regimen            CHAR(1 CHAR) NOT NULL, 
    fecha_llegada      DATE NOT NULL, 
    fecha_salida       DATE NOT NULL 
);

ALTER TABLE hospedar ADD CONSTRAINT hospedar_pk PRIMARY KEY ( hotel_id_hotel, 
                                                              turista_id_turista );

ALTER TABLE hospedar 
    ADD CONSTRAINT hospedar_hotel_fk FOREIGN KEY ( hotel_id_hotel ) 
        REFERENCES hotel ( id_hotel );

ALTER TABLE hospedar 
    ADD CONSTRAINT hospedar_turista_fk FOREIGN KEY ( turista_id_turista ) 
        REFERENCES turista ( id_turista );

CREATE TABLE volar ( 
    vuelo_num_vuelo    INTEGER NOT NULL, 
    turista_id_turista INTEGER NOT NULL, 
    clase              CHAR(1 CHAR) NOT NULL 
);

ALTER TABLE volar ADD CONSTRAINT volar_pk PRIMARY KEY ( vuelo_num_vuelo, 
                                                        turista_id_turista );

ALTER TABLE volar 
    ADD CONSTRAINT volar_turista_fk FOREIGN KEY ( turista_id_turista ) 
        REFERENCES turista ( id_turista );

ALTER TABLE volar 
    ADD CONSTRAINT volar_vuelo_fk FOREIGN KEY ( vuelo_num_vuelo ) 
        REFERENCES vuelo ( num_vuelo );

COMMIT;

