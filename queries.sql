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


