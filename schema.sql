/* Database schema to keep the structure of entire database. */

create table animals(   
id int generated by default as identity,                         vet_clinic(# name varchar,
date_of_birth date,
escape_attempts int,
neutered boolean, 
weight_kg decimal,
PRIMARY KEY (id)
);