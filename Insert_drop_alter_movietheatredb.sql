ALTER TABLE TICKET
RENAME COLUMN PURCHARE_TIME TO PURCHASE_TIME;

--NB: In sql data is stored in a structured format, 
--and the amount column in concession table/ other tables too is stored as numeric 
--to allow accurate calculations
-- SQL does not support storing currency symbols in numeric fields.

SELECT CONCAT('$', CAST(AMOUNT AS TEXT)) AS AMOUNT
FROM CONCESSION;

--my customer table has a column phone to store phone numbers,
--I realize that the numbers are stored like eg. 234567899 -> 234,456,788
--I want to drop this column and insert a new phone column that takes the numbers as 234-345-5566
 
SELECT * FROM CUSTOMER;

--TO DROP COLUMN PHONE;
ALTER TABLE CUSTOMER
DROP COLUMN PHONE; 

select * from CUSTOMER;

--TO ADD NEW PHONE COLUMN
ALTER TABLE CUSTOMER
ADD COLUMN PHONE CHAR(12);


--INSERT VALUES UNDER PHONE
--INSERT INTO CUSTOMER(PHONE)
--VALUES('2343457899'),('7734562345'),('3123456879');

--to insert data into phone for exiting rows I can use update
UPDATE CUSTOMER
SET PHONE = '234-456-7899'
WHERE CUSTOMER_ID = 1;


UPDATE CUSTOMER
SET PHONE = '312-456-7890'
WHERE CUSTOMER_ID = 2;

UPDATE CUSTOMER
SET PHONE = '773-006-2399'
WHERE CUSTOMER_ID = 3;

SELECT * FROM CUSTOMER;