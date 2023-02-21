/* Database schema to keep the structure of entire database. */

create table animals(   
id int generated always as identity,
name varchar NOT NULL,
date_of_birth date NOT NULL,
escape_attempts int,
neutered boolean, 
weight_kg decimal,
PRIMARY KEY (id)
);
