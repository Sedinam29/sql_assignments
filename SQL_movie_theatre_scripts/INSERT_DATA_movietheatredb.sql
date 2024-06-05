--inserting rows into tables (3 rows each)
--Language table, primary key is SERIAL (will increase from 1 to --)
INSERT INTO LANGUAGE(LANGUAGE_NAME)
VALUES('ENGLISH'),('SPANISH'), ('FRENCH');

--movie table
INSERT INTO MOVIE(TITLE, DIRECTOR, GENRE, LANGUAGE_ID, RELEASE_YEAR, LENGTH, RATING)
VALUES ('Inception', 'Christopher Nolan', 'Sci-Fi', 1, 2010, '02:28:00','PG-13'),
       ('Coco', 'Lee Unkrich', 'Animation', 2, 2017, '01:45:00', 'PG'),
	   ('Amélie', 'Jean-Pierre Jeunet', 'Romance', 3, 2001, '02:02:00', 'R');

--staff table
--STAFF_ID is SERIAL (will increase ..)
INSERT INTO STAFF (FIRST_NAME, LAST_NAME, POSITION, HIRE_DATE, SALARY)
VALUES ('Jonny', 'James', 'Manager', '2022-01-01', 50000.00),
       ('Jane', 'Maddison', 'Cashier', '2023-03-15', 30000.00),
       ('Bob', 'Johnson', 'Cleaner', '2024-06-01', 25000.00);

--Customer table
--Customer_id is Serial      
INSERT INTO CUSTOMER (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Alice', 'Williams', 'alice23@gmail.com', 2334567890),
       ('Charlie', 'Brown', 'charlieb@gmail.com', 77345678901),
       ('David', 'Davis', 'davidd@outlook.com', 31256789012);

--select * from customer;
--Ticket table
INSERT INTO TICKET(STAFF_ID, MOVIE_ID, CUSTOMER_ID, PURCHASE_TIME, SEAT_NUMBER)
VALUES (1, 3, 1, '2024-06-01 19:00:00', 23),
       (2, 2, 2, '2024-06-02 20:00:00', 50),
       (3, 3, 3, '2024-06-03 21:00:00', 73);

--CONCESSION TABLE
INSERT INTO CONCESSION(ITEM_NAME, AMOUNT)
VALUES ('Popcorn', 5.00), ('Soda', 3.00), ('Candy', 2.50);

--Sales table
INSERT INTO SALES(CONCESSION_ID, CUSTOMER_ID, TICKET_ID, SALE_TIME, PAYMENT_ID, AMOUNT)
VALUES (1, 1, 1, '2024-06-01 18:30:00', 234, 5.00),
       (2, 2, 2, '2024-06-02 19:30:00', 456, 3.00),
       (3, 3, 3, '2024-06-03 20:30:00', 789, 2.50);

--Inventory table
INSERT INTO INVENTORY (CONCESSION_ID, QUANTITY_IN_STOCK)
VALUES (1, 100), (2, 200), (3, 150);



