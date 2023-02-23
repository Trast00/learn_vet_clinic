/* */

insert into animals 
values (DEFAULT, 'Agumon', '2020-02-03', 0, true, 10.23);
insert into animals 
values (DEFAULT, 'Gabumon', '2018-10-15', 2, true, 8);
insert into animals 
values (DEFAULT, 'Pikachu', '2021-01-07', 0, false, 15.04);
insert into animals 
values (DEFAULT, 'Devimon', '2017-05-12', 0, true, 11);


/* Populate database with sample data. */

insert into animals 
values (DEFAULT, 'Charmander', '2020-02-08', 0, false, -11);
insert into animals 
values (DEFAULT, 'Plantmon', '2021-11-15', 2, true, -5.7);
insert into animals 
values (DEFAULT, 'Squirtle', '1993-04-02', 3, false, -12.13);
insert into animals 
values (DEFAULT, 'Angemon', '2005-06-12', 1, true, -45);
insert into animals 
values (DEFAULT, 'Boarmon', '2005-06-07', 7, true, 20.4);
insert into animals 
values (DEFAULT, 'Blossom', '1998-10-13', 3, true, 17);
insert into animals 
values (DEFAULT, 'Ditto', '2022-05-14', 4, true, 22);


/* Project part 3 */
/* owner */
insert into owners values (DEFAULT, 'Sam Smith', 34);
insert into owners values (DEFAULT, 'Jennifer Orwell', 19);
insert into owners values (DEFAULT, 'Bob', 45);
insert into owners values (DEFAULT, 'Melody Pon', 77);
insert into owners values (DEFAULT, 'Dean Winchester', 14);
insert into owners values (DEFAULT, 'Jodie Whittaker', 38);

/* species */
insert into species values (DEFAULT, 'Pokemon');
insert into species values (DEFAULT, 'Digimon');


UPDATE animals SET species_id = 2 where name LIKE '%mon';
UPDATE animals SET species_id = 1 where species_id is NULL;

UPDATE animals SET owner_id = 1 where name = 'Agumon';
UPDATE animals SET owner_id = 2 where name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 where name = 'Plantmon';
UPDATE animals SET owner_id = 4 where name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 where name = 'Angemon' or name = 'Boarmon';

/* Project part 4 */

insert into vets values (DEFAULT, 'William Tatcher', 45, '2000-04-23');
insert into vets values (DEFAULT, 'Maisy Smith', 26, '2019-01-17');
insert into vets values (DEFAULT, 'Stephanie Mendez', 64, '1981-05-17');
insert into vets values (DEFAULT, 'Jack Harkness', 38, '2008-06-08');

insert into specializations values (1, 1);
insert into specializations values (3, 1);
insert into specializations values (3, 2);
insert into specializations values (4, 2);

/* vet_id - animals_id, date */
insert into visits values (1, 3, '2020-05-24');
insert into visits values (1, 1, '2020-07-22');
insert into visits values (2, 4, '2021-02-02');
insert into visits values (3, 2, '2020-01-05');
insert into visits values (3, 2, '2020-03-08');
insert into visits values (3, 2, '2020-05-14');
insert into visits values (4, 3, '2021-05-04');
insert into visits values (5, 4, '2021-02-24');
insert into visits values (6, 2, '2019-12-21');
insert into visits values (6, 1, '2020-08-10');
insert into visits values (6, 2, '2021-04-07');
insert into visits values (7, 3, '2019-09-29');
insert into visits values (8, 4, '2020-10-03'); 
insert into visits values (8, 4, '2020-11-04');
insert into visits values (9, 2, '2019-01-24');
insert into visits values (9, 2, '2019-05-15');
insert into visits values (9, 2, '2020-02-27');
insert into visits values (9, 2, '2020-08-03');
insert into visits values (10, 3, '2020-05-24');
insert into visits values (10, 1, '2021-01-11');

