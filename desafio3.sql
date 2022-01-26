CREATE DATABASE blog;

\c blog

CREATE TABLE usuarios (
    id serial,
    email varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE posts (
    id serial,
    usuario_id int,
    titulo varchar(255),
    fecha date,
    PRIMARY KEY (id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
    id serial,
    post_id int,
    usuario_id int,
    texto varchar(255),
    fecha date,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES posts (id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id)    
);

ALTER TABLE usuarios ADD NAME VARCHAR (255) NOT NULL;

\COPY usuarios FROM 'usuarios.csv' csv header;
\COPY posts FROM 'posts.csv' csv header;
\COPY comentarios FROM 'comentarios.csv' csv header;