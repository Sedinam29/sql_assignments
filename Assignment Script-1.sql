--1. Query for number of people with last_name 'Wahlberg' in the actor table
select * from actor;
select last_name
from actor
where last_name = 'Wahlberg';

select COUNT(last_name)
from actor
where last_name like 'Wahlberg';

--2 Query to display how many payments made beteen $3.99 and $5.99
select * from payment;

select COUNT(amount)
from payment
where amount BETWEEN 3.99 and 5.99;

--3 Query to display film the store have the most of?
select * from inventory;

select film_id, count(inventory_id) as most_films
from inventory
group by film_id 
order by most_films desc
limit 1;


--4 Query to display number of customers with last_name William
select * from customer;

select Count(last_name)
from customer
where last_name = 'William';

--5. Query to display store employee (id) that sold the most rentals
select * from rental;

select staff_id, count(inventory_id) as most_rental
from rental
group by staff_id
order by most_rental desc 
limit 1;

--6 Query that displays count of unique district names
select * from address;

select Count(distinct district)
from address; 

--7. Query to display films wih the most actors
select * from film_actor;

SELECT film_id, COUNT(actor_id) AS actors
FROM film_actor
GROUP BY film_id
ORDER BY actors DESC
limit 1;

--8 display count of customers with names ending with 'es'
SELECT * FROM customer;

select store_id, count(last_name)
from customer
where last_name like '%es'
group by store_id
order by count(last_name) desc
limit 1;

--9 Query to display count of amounts (4.99, 5.99, etc.) had a number of rentals above 250 
--for customers with ids between 380 and 430?
select * from payment;

select amount, count(rental_id)
from payment
where customer_id between 380 and 480
group by amount 
having count(rental_id) > 250;

--10 Query to display how many rating categories there are.
-- And what rating has the most movies total?
select * from film;

select count(distinct rating)
from film;

select rating, sum(film_id)
from film
group by rating
order by sum(film_id) desc
limit 1;