select * from ADDRESS;
select * from CUSTOMER;


--1. Lisitng all the customers who live in texas
SELECT CUSTOMER.CUSTOMER_ID, FIRST_NAME, LAST_NAME, ADDRESS.address_id, ADDRESS.DISTRICT
FROM CUSTOMER
JOIN ADDRESS ON address.address_id  = customer.address_id 
WHERE ADDRESS.DISTRICT LIKE 'Texas%'


-- Get all payments above $6.99 with the Customer's Full Name
select * from CUSTOMER;
select * from PAYMENT;


SELECT CUSTOMER.CUSTOMER_ID, LAST_NAME, FIRST_NAME, AMOUNT
FROM PAYMENT
JOIN CUSTOMER ON CUSTOMER.customer_id = PAYMENT.customer_id
WHERE AMOUNT > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)

select * from payment ;
select * from customer ;

select CUSTOMER_ID, FIRST_NAME, LAST_NAME
from customer 
where CUSTOMER_ID in (
	select CUSTOMER_ID
	from PAYMENT
	group by customer_id 
	having SUM(AMOUNT) > 175
	order by SUM(AMOUNT) DESC
)

group by customer_id, first_name, LAST_NAME;


-- 4. List all customers that live in Nepal (use the city table
-- coutry_id for Nepal is 66
--to find country_id:

select * from CITY; 
select * from COUNTRY; 
select * from customer;
select * from address;

SELECT CUS.FIRST_NAME, CUS.LAST_NAME
FROM CUSTOMER AS CUS
JOIN ADDRESS AS ADDR ON CUS.ADDRESS_ID = ADDR.ADDRESS_ID
JOIN CITY AS CI ON ADDR.CITY_ID = CI.CITY_ID
JOIN COUNTRY AS CON ON CI.COUNTRY_ID = CON.COUNTRY_ID
WHERE CON.COUNTRY_ID = 66;

--5. Which staff member had the most transactions
-- Joining payment and staff
-- then count Rental_id, Group be Staff_id then order by Ascending order

select * from payment
SELECT PAYMENT.STAFF_ID, STAFF.first_name, STAFF.last_name, COUNT(PAYMENT.rental_id) AS rental_count
FROM PAYMENT 
FULL JOIN STAFF 
ON PAYMENT.STAFF_ID = STAFF.STAFF_ID 
GROUP BY PAYMENT.STAFF_ID, STAFF.first_name, STAFF.last_name
ORDER BY rental_count DESC;

-- 6. How many movies of each rating are there?

select * from FILM
SELECT RATING, COUNT(*) AS MOVIE_COUNT
FROM FILM
GROUP BY RATING;

--7. Show all customers who have made a single payment of  6.99 (use subqueries)
--select names of cutomers
--where the customer_id in payment, is 6.99 
SELECT first_name , last_name 
FROM CUSTOMER
WHERE CUSTOMER_ID IN (
    SELECT CUSTOMER_ID
    FROM PAYMENT
    GROUP BY CUSTOMER_ID
    HAVING COUNT(*) = 1 AND MAX(AMOUNT) > 6.99
);

--8. talk about freebies! How many free rentals did our store give away?
select COUNT(AMOUNT) as FREE_RENTAL
from PAYMENT
where AMOUNT = 0.00;
