--alter table Customer
--I accidentally added inserted twice in my customer table, creating a duplicate of the data with my initial draft
--show data
select * from customer;

---delete duplicate
delete from Customer where Customer_id = '5';
delete from Customer where Customer_id = '6';
delete from Customer where Customer_id = '7';
delete from Customer where Customer_id = '8';

--update data to show final values
UPDATE CUSTOMER SET EMAIL = 'chris.miller@gmail.com' WHERE EMAIL = 'chris.miller@example.com';
UPDATE CUSTOMER SET EMAIL = 'christine.taylor@gmail.com' WHERE EMAIL = 'christine.taylor@example.com';
UPDATE CUSTOMER SET EMAIL = 'carlos.martin@gmail.com' WHERE EMAIL = 'carlos.martin@example.com';
UPDATE CUSTOMER SET EMAIL = 'cindy.anderson@outlook.com' WHERE EMAIL = 'cindy.anderson@example.com';



---INSERT DATA WITH STORED FUCTIONS
--CREATING FUNCTION FIRST_NAME, LAST_NAME, PHONE, EMAIL
CREATE OR REPLACE FUNCTION ADD_CUSTOMER(_FIRST_NAME VARCHAR, 
_LAST_NAME VARCHAR, _PHONE_ CHAR,_EMAIL_ VARCHAR, _LAST_UPDATE TIMESTAMP WITHOUT TIME ZONE)
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO CUSTOMER(FIRST_NAME, LAST_NAME, PHONE, EMAIL,_LAST_UPDATE)
	VALUES(FIRST_NAME, LAST_NAME, PHONE, EMAIL, _LAST_UPDATE);
END;
$MAIN$
LANGUAGE PLPGSQL; 

---INSERT DATA WITH STORED FUCTIONS
--CREATING FUNCTION ADD_CUSTOMER FOR CUSTOMER TABLE

CREATE OR REPLACE FUNCTION ADD_CUSTOMER(_FIRST_NAME VARCHAR, 
_LAST_NAME VARCHAR, _PHONE_ CHAR,_EMAIL_ VARCHAR) 
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO CUSTOMER(FIRST_NAME, LAST_NAME, PHONE, EMAIL) 
	VALUES(_FIRST_NAME, _LAST_NAME, _PHONE_, _EMAIL_);  
END;
$MAIN$
LANGUAGE PLPGSQL; 

--run function Add_customer to ensure that it is successfully created

--CALL FUNCTION.. using func to add customers Annie and Dimitrio to the table
--Annie and Dimitrio were at the shop for inspection only.. no part change
SELECT 
ADD_CUSTOMER('Annie','Benaval','3122578799','benaval23@gmail.com');  
SELECT 
ADD_CUSTOMER('Dimitrio','Moralez','7732578709', 'dimit4@gmail.com'); 


---TO VERIFY THAT NEW DATA HAS BEEN ADDED
SELECT * FROM CUSTOMER
WHERE CUSTOMER_ID = 9;

SELECT * FROM CUSTOMER 
WHERE CUSTOMER_ID = 10;

select * from customer;

-- FUNCTION 2 --> Inserting data into JOB.. editing job values to include 'car inspection'
--JOB(DESCRIPTION, HOURS, MECH_ID, PART_ID)
CREATE OR REPLACE FUNCTION ADD_JOB(_DESCRIPTION VARCHAR, _HOURS FLOAT, _MECH_ID INTEGER, _PART_ID INTEGER) 
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO JOB(DESCRIPTION, HOURS, MECH_ID, PART_ID)
	VALUES(_DESCRIPTION, _HOURS, _MECH_ID, _PART_ID);  
END;
$MAIN$
LANGUAGE PLPGSQL; 

--Call function to add car inspection
SELECT ADD_JOB('CAR INSPECTION', 2, 00236, NULL);

SELECT * FROM JOB;


-- FUNCTION 3 --> function for add_invoice
CREATE OR REPLACE FUNCTION ADD_INVOICE(_SALESPERSON_ID INTEGER, _CUSTOMER_ID INTEGER, _CAR_ID INTEGER, _DATE TIMESTAMP, _TOTAL_COST NUMERIC) 
RETURNS VOID
AS $MAIN$
BEGIN
	INSERT INTO INVOICE(SALESPERSON_ID, CUSTOMER_ID, CAR_ID, DATE, TOTAL_COST)
	VALUES(_SALESPERSON_ID, _CUSTOMER_ID, _CAR_ID, _DATE, _TOTAL_COST);  
END;
$MAIN$
LANGUAGE PLPGSQL; 


---CALL FUNCTION
select ADD_INVOICE(00302, 10, 4, CURRENT_DATE, 5000.00);
select ADD_INVOICE(00304, 9, 2, CURRENT_DATE, 2000.00);

select * from invoice;
