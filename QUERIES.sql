/* 1 */
SELECT 'Steady' AS CustomerType, firstname, lastname, birthdate, phonenumber, email FROM person INNER JOIN customer on
	person.personid = customer.person_personid RIGHT JOIN steady ON customer.CUSTOMERID = steady.CUSTOMER_CUSTOMERID
UNION ALL
SELECT 'Premier' AS CustomerType, firstname, lastname, birthdate, phonenumber, 'N/A' as email FROM person INNER JOIN customer on
	person.personid = customer.person_personid RIGHT JOIN premier on customer.CUSTOMERID = premier.CUSTOMER_CUSTOMERID;
