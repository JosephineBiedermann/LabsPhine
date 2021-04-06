#LAB SQL 2.5

#1.Select all the actors with the first name ‘Scarlett’.
select a.actor_id, first_name
from sakila.actor a
where a.first_name = 'Scarlett';
#2 actors

#2.How many films (movies) are available for rent and how many films have been rented?
select count(f.title)
from sakila.film f;
select count(distinct(f.title))
from sakila.film f;
#1000 films available

# how many have been rented???
select *
from sakila.inventory i;

select count(distinct(i.film_id))
from sakila.inventory i;

#3.What are the shortest and longest movie duration? Return the results as columns with the names  max_duration and min_duration.
select max(f.length) as max_duration, min(f.length) as min_duration
from sakila.film f;

#4.What's the average movie duration expressed in format (hours, minutes) Return the result as columns with the names hours and minutes?
SELECT time_format(avg(length),'%H %i %s'), time_format(avg(length), '%i') as hours, time_format(avg(length), '%s') as minutes
FROM sakila.film f;
#1hour and 15min

#5.How many distinct (different) actors' last names are there?
select count(distinct(first_name))
from sakila.actor a;
#128

#6.Since how many days has the company been operating (check the DATEDIFF() function)? Hint: rental table
SELECT *
FROM rental;

SELECT r.rental_date
FROM sakila.rental r
order by r.rental_date DESC;

SELECT Datediff(Max(r.rental_date),Min(r.rental_date))
FROM sakila.rental r;
#266 days

#7.Show all rental information with additional columns month and weekday. (hint: DATE_FORMAT() ). Get 20 results.
SELECT *, date_format(rental_date, '%M') as month, date_format(rental_date, '%a') as weekday
FROM sakila.rental r
limit 20;

#8.Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN date_format(r.rental_date, '%a') in('Mon','Tue','Wed','Thu','Fry') then 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental r;

#9.How many rentals were made in the last month of renting activity?
select date_format(max(r.rental_date), '%M %Y')
from sakila.rental r;
#havnig a look what the last month of renting activity is

select count(r.rental_id)
from sakila.rental r
where date_format(r.rental_date, '%M %Y') = 'February 2006';
#182