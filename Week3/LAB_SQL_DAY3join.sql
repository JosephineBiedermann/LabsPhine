#0.Inspect the database structure and find the best-fitting table to analyse for the next task
#jep, done

#1.Using the tables address and staff and the JOIN command, display the first names, last names, and address of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff as s
JOIN sakila.address as a
ON s.address_id = a.address_id;

#2.Using the tables staff and payment and the JOIN command, display the total payment amount by staff member in August of 2005.
SELECT s.staff_id, sum(p.amount) as total_payment_amount
FROM sakila.staff as s
JOIN sakila.payment as p
ON s.staff_id = p.staff_id
WHERE payment_date LIKE '2005-08-%'
GROUP BY s.staff_id
ORDER BY sum(p.amount);

#3.Using the tables film and film_actor and the JOIN command, list each film and the number of actors who are listed for that film.
SELECT f.title, count(fa.actor_id) as number_actors
FROM sakila.film as f
JOIN sakila.film_actor as fa
ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY count(fa.actor_id) DESC;

#4.Using the tables payment and customer and the JOIN command, list the total paid by each customer. Order the customers by last name and alphabetically.
SELECT c.last_name, sum(p.amount)
FROM sakila.customer as c
JOIN sakila.payment as p
ON c.customer_id = p.customer_id
GROUP BY c.last_name
ORDER BY c.last_name;