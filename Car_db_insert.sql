-- Inserting data into SALESPERSON
INSERT INTO SALESPERSON(SALESPERSON_ID, FIRST_NAME, LAST_NAME, PHONE, EMAIL)
VALUES ('00301','John', 'Doe', '1234567890', 'john.doe@gmail.com'),
       ('00302','Jane', 'Doe', '0987654321', 'jane.doe@gmail.com'),
       ('00303','Jim', 'Brown', '1122334455', 'jim.brown@outlook.com'),
       ('00304','Jill', 'Smith', '5566778899', 'jill.smith@outlook.com');

-- select * from salesperson;
     
-- Inserting data into MECHANIC table
INSERT INTO MECHANIC(MECH_ID, FIRST_NAME, LAST_NAME, PHONE)
VALUES ('00234','Mike', 'Johnson', '2233445566'),
       ('00235', 'Michelle', 'Williams', '3344556677'),
       ('00236', 'Mick', 'Jones', '4455667788'),
       ('00237', 'Minnie', 'Davis', '5566778899');

--select * from mechanic;

-- Inserting data into PARTS
INSERT INTO PARTS(PART_NAME, SELLING_PRICE)
VALUES ('Brake Pads', 45.99),
       ('Oil Filter', 10.99),
       ('Air Filter', 15.99),
       ('Spark Plugs', 22.99);
      
--SELECT * FROM PARTS;     

-- Inserting data into CUSTOMER
INSERT INTO CUSTOMER(FIRST_NAME, LAST_NAME, PHONE, EMAIL)
VALUES ('Chris', 'Miller', '6677889900', 'chris.miller@gmail.com'),
       ('Christine', 'Taylor', '7788990011', 'christine.taylor@gmail.com'),
       ('Carlos', 'Martin', '8899001122', 'carlos.martin@gmail.com'),
       ('Cindy', 'Anderson', '9900112233', 'cindy.anderson@outlook.com');

select * from customer;

-- Inserting data into JOB
INSERT INTO JOB(DESCRIPTION, HOURS, MECH_ID, PART_ID)
VALUES ('Oil Change', 1.5, 00234, 2),
       ('Brake Replacement', 3.0, 00235, 1),
       ('Air Filter Replacement', 1.5, 00236, 3),
       ('Spark Plug Replacement', 2.0, 00237, 4);
    
SELECT * FROM JOB;


-- Inserting data into CARS
INSERT INTO CARS(MODEL, MAKE, YEAR, SALESPERSON_ID, CUSTOMER_ID, SELLING_PRICE)
VALUES ('Model S', 'Tesla', 2024, 00302, 1, 79990.00),
       ('Elantra', 'Hyundai', 2020, 00302, 2, 48990.00),
       ('civic', 'Honda', 2022, 00303, 3, 39990.00),
       ('GLC 300', 'Mercedes-Benz', 2024, 00301, 4, 73990.00);
      
SELECT * FROM CARS;

-- Inserting data into INVOICE
INSERT INTO INVOICE(SALESPERSON_ID, CUSTOMER_ID, CAR_ID, DATE, TOTAL_COST)
VALUES (00302, 1, 1, CURRENT_DATE, 79990.00),
       (00302, 2, 2, CURRENT_DATE, 48990.00),
       (00303, 3, 3, CURRENT_DATE, 39990.00),
       (00301, 4, 4, CURRENT_DATE, 73990.00);
      
SELECT * FROM INVOICE;

-- Inserting data into TICKET
INSERT INTO TICKET(DATE, ISSUE, CUSTOMER_ID, CAR_ID)
VALUES (CURRENT_TIMESTAMP, 'Oil Change', 1, 1),
       (CURRENT_TIMESTAMP, 'Brake Replacement', 2, 2),
       (CURRENT_TIMESTAMP, 'Air Filter Replacement', 3, 3),
       (CURRENT_TIMESTAMP, 'Spark Plug Replacement', 4, 4);
      
SELECT * FROM TICKET;
      
-- Inserting data into HISTORY
INSERT INTO HISTORY(CAR_ID, TICKET_ID)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4);

SELECT * FROM HISTORY;

-- Inserting data into SERVICE_LOG
INSERT INTO SERVICE_LOG(DATE, COST, CAR_ID, MECH_ID, PART_ID)
VALUES (CURRENT_TIMESTAMP, 50.00, 1, 00234, 2),
       (CURRENT_TIMESTAMP, 200.00, 2, 00236, 1),
       (CURRENT_TIMESTAMP, 30.00, 3, 00235, 3),
       (CURRENT_TIMESTAMP, 100.00, 4, 00236, 4);

SELECT * FROM SERVICE_LOG;