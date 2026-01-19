CREATE DATABASE CinemaMarinho;
USE CinemaMarinho;

CREATE TABLE filme (
    id             INT           AUTO_INCREMENT  PRIMARY KEY,
    titulo         VARCHAR(100)  NOT NULL,
    genero         VARCHAR(50),
    duracao_min    INT,
    classificacao  VARCHAR(10)
);

CREATE TABLE sala (
    id          INT           AUTO_INCREMENT  PRIMARY KEY,
    nome        VARCHAR(50),
    capacidade  INT           NOT NULL
);

CREATE TABLE sessao (
    id        INT           AUTO_INCREMENT  PRIMARY KEY,
    filme_id INT           NOT NULL,
    sala_id  INT           NOT NULL,
    horario  DATETIME      NOT NULL,
    preco    DECIMAL(6,2)  NOT NULL,
    FOREIGN KEY (filme_id) REFERENCES filme(id),
    FOREIGN KEY (sala_id)  REFERENCES sala(id)
);

CREATE TABLE cliente (
    id     INT           AUTO_INCREMENT  PRIMARY KEY,
    nome   VARCHAR(100)  NOT NULL,
    email  VARCHAR(100)  NOT NULL
);

CREATE TABLE ingresso (
    id           INT       AUTO_INCREMENT  PRIMARY KEY,
    sessao_id    INT       NOT NULL,
    cliente_id   INT       NOT NULL,
    assento      VARCHAR(5) NOT NULL,
    data_compra  DATETIME  NOT NULL,
    FOREIGN KEY (sessao_id)  REFERENCES sessao(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);
