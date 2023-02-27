/*Queries that provide answers to the questions from all projects.*/

/* end with 'moon' */
SELECT * from animals WHERE name LIKE '%mon';
SELECT * from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* PART 2 */
BEGIN;
  UPDATE animals SET species = 'unspecified';
  SELECT * FROM animals;
ROLLBACK;

BEGIN;
  UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
  UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
  DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
  DELETE FROM animals WHERE date_of_birth > '2022-01-01';
  SAVEPOINT dittoDeleted;
  UPDATE animals SET weight_kg = weight_kg * (-1);
  ROLLBACK TO dittoDeleted;
  UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

/* How many animals are there? answer: 6 */
SELECT COUNT(*) FROM animals;
/* How many animals have never tried to escape? answer: 1 */
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
/* What is the average weight of animals? answer: 18.5383333 */
SELECT AVG(weight_kg) FROM animals;
/* Who escapes the most, neutered or not neutered animals? answers: neutred ones (with avg = 22.025) */
SELECT neutered, AVG(weight_kg) FROM animals GROUP BY neutered;
/* What is the minimum and maximum weight of each type of animal? 
  answer: pokemons(11kg-17kg); digimon(5.7kg-45kg) */
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000?? answer: 3.0000 */
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


/* Project part 3 */
/* What animals belong to Melody Pond? */
SELECT * from animals join owners on animals.owner_id = owners.id
where full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon). */
SELECT * from animals join species on animals.species_id = species.id
where species.name = 'Pokemon';

/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT * from owners left join animals on owners.id = animals.owner_id;

/* How many animals are there per species? */
SELECT species.name, COUNT(*) from species 
left join animals on species.id = animals.species_id
group by species.name;

/* List all Digimon owned by Jennifer Orwell */
SELECT * from owners 
join animals on owners.id = animals.owner_id
join species on species.id = animals.species_id
where owners.full_name = 'Jennifer Orwell';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT * from owners 
join animals on owners.id = animals.owner_id
where owners.full_name = 'Dean Winchester'
AND animals.escape_attempts = 0;

/* Who own the most animals ? answer: Melody Pond with 3 animals */
SELECT owners.full_name, COUNT(*) from owners 
left join animals on owners.id = animals.owner_id
group by owners.full_name;


/* Project part 4 */

/* Who was the last animal seen by William Tatcher? answer: Blossom */
select visits.date_of_visit, animals.name, vets.name from visits
join animals on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
where vets.name = 'William Tatcher'
order by visits.date_of_visit;

/* How many different animals did Stephanie Mendez see? answer: 4*/
select animals.id, vets.name, animals.name from visits
join animals on visits.animal_id = animals.id
left join vets on visits.vet_id = vets.id
where vets.name = 'Stephanie Mendez';

/* List all vets and their specialties, including vets with no specialties */
select vets.name as vet_name, species.name as specialization from specializations
join species on specializations.species_id = species.id
right join vets on specializations.vet_id = vets.id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020 */
select animals.id, vets.name, animals.name, date_of_visit from visits
join vets on visits.vet_id = vets.id
join animals on visits.animal_id = animals.id
where vets.name = 'Stephanie Mendez' 
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/* What animal has the most visits to vets? answers: Boadmon with 4 visits */
select animal_id, animals.name, COUNT(animal_id) from visits
join animals on visits.animal_id = animals.id
group by animal_id, animals.name
order by COUNT(animal_id);

/* Who was Maisy Smith's first visit? answers: boarmon in 2019-01-24 */
select animal_id, animals.name, vets.name as vet_name, date_of_visit from visits
join animals on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
where vets.name = 'Maisy Smith'
order by date_of_visit;

/* Details for most recent visit: animal information, vet information, and date of visit. 
2021-05-04|4|Devimon|2017-05-12|0|t|11|2||3|Stephanie Mendez|64| 1981-05-17*/
select date_of_visit, animals.*, vets.* as max_visit from visits
join animals on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
order by date_of_visit desc;


/* How many visits were with a vet that did not specialize in that animal's species? answers: 12 */
select vets.id as vet_id, specializations.species_id as specialization_id,
species.name as species_name, species.id as animal_species_id from visits
left join vets on visits.vet_id = vets.id /* left join to make sure vets with no specialities stay */
left join animals on visits.animal_id = animals.id
left join species on animals.species_id = species.id
left join specializations on vets.id = specializations.vet_id
where vets.id != 3 /* because vet 3 is specialized in both */
AND specializations.species_id != species.id 
OR specializations.species_id is NULL
order by vets.id;

/* What specialty should Maisy Smith consider getting? Look for the species she gets the most? answer: speacies 2 so Digimon */
select vets.name, species.id as animal_species_id, species.name as animal_species_name, count(species.id) from visits
left join vets on visits.vet_id = vets.id /* left join to keep vets with no specilities like Maisy Smith */
left join animals on visits.animal_id = animals.id
left join species on animals.species_id = species.id
where vets.name = 'Maisy Smith'
group by vets.name, species.id;


/* Project part 5: increase speed  */
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
