USE sakila;

### Instructions

-- 1. How many distinct (different) actors' last names are there?

SELECT DISTINCT last_name FROM sakila.actor;

-- 2. In how many different languages where the films originally produced? (Use the column `language_id` from the `film` table)

SELECT DISTINCT language_id FROM sakila.film;

-- 3. How many movies were released with `"PG-13"` rating?

SELECT COUNT(*) AS conteo
FROM sakila.film
WHERE rating = 'PG-13';


-- 4. Get 10 the longest movies from 2006.

SELECT * FROM sakila.film
WHERE release_year= '2006'
ORDER BY length DESC
LIMIT 10;


-- 5. How many days has been the company operating (check `DATEDIFF()` function)?

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS dias_abiertos
FROM rental;

-- Hago el supuesto de que la primer pelicula se rentó el primer dia.

SELECT * FROM rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.

SELECT rental_id, rental_date, MONTH(rental_date) AS rental_month, WEEKDAY(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

-- 7. Add an additional column `day_type` with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT rental_id, rental_date, 
       MONTH(rental_date) AS rental_month, 
       WEEKDAY(rental_date) AS rental_weekday,
       CASE 
           WHEN WEEKDAY(rental_date) IN (5, 6) THEN 'weekend'
           ELSE 'workday'
       END AS day_type
FROM rental;


-- 8. How many rentals were in the last month of activity?

SELECT COUNT(*) AS rental_count
FROM rental
WHERE rental_date = (SELECT MAX(rental_date) FROM rental);


