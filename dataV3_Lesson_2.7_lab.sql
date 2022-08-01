
USE Sakila;

-- How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.

-- Tables to use:
SELECT * FROM film_category;
SELECT * FROM category;
-- Common column: category_id
SELECT name as category, count(film_id) as number_of_films_per_category FROM film_category as f
JOIN category as c
ON f.category_id = c.category_id
GROUP BY name;

-- Display the total amount rung up by each staff member in August of 2005.

-- Tables to use:
SELECT * FROM staff;
SELECT * FROM payment;
-- Common column: staff_id

SELECT last_name as Staff_Surname, first_name as Staff_Name, sum(amount) as Amount_rung_up_by_staff_in_August_2005 FROM payment as p
LEFT JOIN staff as s
ON p.staff_id = s.staff_id
WHERE payment_date regexp "2005-08"
GROUP BY last_name, first_name;

-- Which actor has appeared in the most films?

-- Tables to use:
SELECT * FROM film_actor;
SELECT * FROM actor;
-- Common column: actor_id

SELECT last_name, first_name, count(film_id) as Number_of_films FROM film_actor as f
LEFT JOIN actor as a
ON f.actor_id = a.actor_id
GROUP BY last_name, first_name
ORDER BY count(film_id) desc
LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)

-- Tables to use:
SELECT * FROM customer;
SELECT * FROM rental;
-- Common column: customer_id

SELECT last_name, first_name, count(rental_id) as Number_of_rentals FROM rental as r
LEFT JOIN customer as c
ON r.customer_id = c.customer_id
GROUP BY last_name, first_name
ORDER BY count(rental_id) desc
LIMIT 1;

-- Display the first and last names, as well as the address, of each staff member.

-- Tables to use:
SELECT * FROM staff;
SELECT * FROM address;
-- Common column: address_id

SELECT first_name, last_name, address FROM staff as s
JOIN address as a
ON s.address_id = a.address_id;

-- List each film and the number of actors who are listed for that film.

-- Tables to use:
SELECT * FROM film_actor;
SELECT * FROM film;
-- Common column: film_id

SELECT title, count(actor_id) FROM film_actor as a
LEFT JOIN film as f
ON a.film_id = f.film_id
GROUP BY title
ORDER BY count(actor_id) desc;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
-- Tables to use:
SELECT * FROM payment;
SELECT * FROM customer;
-- Common column: customer_id

SELECT last_name, first_name, sum(amount) as payment FROM payment as p
LEFT JOIN customer as c
ON p.customer_id = c.customer_id
GROUP BY last_name, first_name
ORDER BY last_name asc;

-- List number of films per category.

-- Tables to use:
SELECT * FROM film_category;
SELECT * FROM category;
-- Common column: category_id
SELECT name as category, count(film_id) as number_of_films_per_category FROM film_category as f
JOIN category as c
ON f.category_id = c.category_id
GROUP BY name;
