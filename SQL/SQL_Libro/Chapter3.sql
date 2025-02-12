USE sakila;
-- Exercise 3-1
SELECT actor_id,first_name,last_name from actor
ORDER BY last_name asc,first_name asc;
-- Exercise 3-2
SELECT actor_id,first_name,last_name from actor
where last_name='WILLIAM' or last_name='DAVIS';
-- Exercise 3-3
SELECT customer_id 
from rental
WHERE (DATE(rental_date))='2005-07-05';
-- Exercise 3-4
SELECT * FROM rental;

-- Excercise 3-4
SELECT c.email, r.return_date
 FROM customer c
 INNER JOIN rental as r
 ON c.customer_id = r.customer_id
 WHERE date(r.rental_date) = '2005-06-14'
 ORDER BY 2 asc, 1 desc;