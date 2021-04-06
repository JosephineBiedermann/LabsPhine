#LAB SQL 2.6

#1.Get the unique release years
SELECT distinct(f.release_year)
FROM sakila.film f;
#aparently all from 2006?

#2.Get all films with ARMAGEDDON in the title.
SELECT f.film_id, f.title
FROM sakila.film f
WHERE f.title LIKE '%ARMAGEDDON%';
#6 films

#3.Get all films which title ends with APOLLO.
SELECT f.film_id, f.title
FROM sakila.film f
WHERE f.title LIKE '%APOLLO';
#5 films

#4.Get 10 the longest films.
SELECT f.film_id, f.title, f.length
FROM sakila.film f
ORDER BY f.length desc
LIMIT 10;

#5.How many films include Behind the Scenes content?
SELECT count(f.film_id)
FROM sakila.film f
WHERE f.special_features LIKE '%Behind the Scenes%';
#538

#6.Drop column picture from staff.
ALTER table sakila.staff
DROP column picture;

#7.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT c.customer_id, c.first_name, c.last_name
FROM sakila.customer c
WHERE c.first_name = 'TAMMY' AND c.last_name = 'SANDERS';
#her customer ID is 75

SELECT *
FROM sakila.customer c
WHERE c.customer_id = 75;
#having a look at her data

SELECT *
FROM sakila.staff c;

INSERT into sakila.staff
VALUES ('3','TAMMY','SANDERS','79','TAMMY.SANDERS@sakilastaff.org','2','1','Tammy','1234', '2021-04-06 15:53:00');

SELECT *
FROM sakila.staff c;

#8.Add a rental for movie "Academy Dinosaur" by the customer "Charlotte Hunter" from employee Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information in other tables. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
#Use similar method to get inventory_id, film_id, and staff_id.

#rental_id of Academy Dinosaur
SELECT r.rental_id
FROM sakila.rental r
Order by r.rental_id DESC;
#latest is 16049 so we should use 16050

#rental_date - current date
SELECT Curdate();

#inventory_id - newest
SELECT i.inventory_id
FROM sakila.inventory i
Order by i.inventory_id DESC;
#latest is 4581 so we should use 4582

#customer_id of Charlotte Hunter
SELECT c.customer_id
FROM sakila.customer c
WHERE first_name = 'Charlotte' AND last_name = 'Hunter';
#130

#return_date - open
SELECT f.title, f.rental_duration
FROM sakila.film f
WHERE f.title = 'Academy Dinosaur';

#rental duration 6days
SELECT date_add(day,6,curdate()) as return_date;
#dont know why this is not working, maybe curdate has not the right format to add days?


#staff_id of Mike Hill
SELECT s.staff_id
FROM sakila.staff s
WHERE first_name = 'Mike';
#1

#last_update - current date

INSERT into sakila.rental
VALUES ('16050','2021-04-06 17:09:00','4582','130','2021-04-12 00:00:00','1','2021-04-06 17:09:00');
#hm I get an error, I think it has something to do with the keys inventory and rental id
#i guess i have to link them somehow with a key

