#1.In the actor table, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT *
FROM sakila.actor a;

SELECT a.last_name, count(a.last_name)
FROM sakila.actor a
GROUP BY a.last_name
HAVING count(a.last_name) = 1
ORDER BY a.last_name;
#66

#2.Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once.
SELECT a.last_name, count(a.last_name)
FROM sakila.actor a
GROUP BY a.last_name
HAVING count(a.last_name) > 1
ORDER BY a.last_name;
#55

#3.Using the rental table, find out how many rentals were processed by each employee.
SELECT *
FROM sakila.rental r;

SELECT r.staff_id, count(r.rental_id) as amount_processed_rentals
FROM sakila.rental r
GROUP BY r.staff_id
ORDER BY r.staff_id;
#8041 by 1, 8004 by 2

#4.Using the film table, find out how many films were released each year
SELECT *
FROM sakila.film f;

SELECT distinct(f.release_year)
FROM sakila.film f;

SELECT f.release_year, count(f.film_id) as amount_releases
FROM sakila.film f
GROUP BY f.release_year
ORDER BY f.release_year;
#1000 in 2006

#5.Using the film table, find out for each rating how many films were there.
SELECT f.rating, count(f.film_id) as amount_films
FROM sakila.film f
GROUP BY f.rating
ORDER BY f.rating;
#G 178, PG 194, PG-13 223, R 195, NC-17 210

#6.What is the average length of films for each rating? Round off the average lengths to two decimal places.
SELECT f.rating, round(avg(f.length),2) as avg_length
FROM sakila.film f
GROUP BY f.rating
ORDER BY f.rating;
#G 111.05, PG 112.01, PG-13 120.44, R 118.66, NC-17 113.23

#7.Which kind of movies (based on rating) have an average duration of two hours or more?
SELECT f.rating, round(avg(f.length),2) as avg_length
FROM sakila.film f
GROUP BY f.rating
HAVING avg(f.length) >= 120
ORDER BY avg(f.length);
#only the PG-13 movies