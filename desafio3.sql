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
    usuario_id int,
    post_id int,
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

-- requerimiento 4
SELECT usuarios.email, posts.id, posts.titulo FROM usuarios JOIN posts ON usuarios.id = posts.usuario_id WHERE posts.usuario_id = 5;

-- requerimiento 5
select usuarios.email, comentarios.id, comentarios.texto from usuarios join comentarios on usuarios.id = comentarios.usuario_id where usuarios.email <> 'usuario06@hotmail.com';

-- requerimiento 6
select usuarios.id, usuarios.email, usuarios.name from usuarios left join posts on usuarios.id = posts.usuario_id where posts.usuario_id is null;

-- requerimiento 7
select posts.titulo, comentarios.texto from posts left join comentarios on posts.id = comentarios.post_id;

--requerimiento 8
select usuarios.id, usuarios.email, usuarios.name, posts.fecha as fecha_de_posteo_en_junio from usuarios join posts on usuarios.id = posts.usuario_id where posts.fecha >= '2020-06-01' and posts.fecha <= '2020-06-30';



