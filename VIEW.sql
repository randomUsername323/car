/*1*/
CREATE OR REPLACE VIEW Customer_v AS
SELECT 'Steady' AS CustomerType, firstname, lastname, (YEAR(NOW()) - YEARJOINED) AS YEARS FROM Person INNER JOIN Customer on
	Person.personid = Customer.person_personid RIGHT JOIN Steady ON Customer.CUSTOMERID = Steady.CUSTOMER_CUSTOMERID
UNION ALL
SELECT 'Premier' AS CustomerType, firstname, lastname, (YEAR(NOW()) - YEARJOINED) AS YEARS FROM Person INNER JOIN Customer on
	Person.personid = Customer.person_personid RIGHT JOIN Premier on Customer.CUSTOMERID = Premier.CUSTOMER_CUSTOMERID
UNION ALL
SELECT 'Prospective' AS CustomerType, firstname, lastname, (YEAR(NOW()) - YEAR(NOW())) AS YEARS FROM Person INNER JOIN Prospective on
	Person.personid = Prospective.person_personid;

/*2*/
Create or replace view Cust_type_v AS
Select 'Individual' AS CustomerType, firstname,lastname,homeAddress as Mailing, '' as billing,'' as Vehicle_pickup,'' as Vdelivery From Person 
inner join Customer on Person.personID = Customer.person_personID Right Join Individual on Customer.customerID = Individual.customer_customerID
Union ALL
Select 'Corporation' AS CustomerType, firstname,lastname,mailing, billing, vehiclePickup, vehicleDelivery from Person
inner join Customer on Person.personID = Customer.person_personID Right Join Corporation on Customer.customerID = Corporation.customer_customerID;

/*3*/
Create or replace view Mentor_v AS
Select 'Mentor' AS Mentor_type, firstname as First_Name ,lastname as Last_Name From Person 
inner join Employee on Person.personID = Employee.Person_PersonID 
Right Join Mentoring on Employee.employeeID = Mentoring.mentorID
Union ALL
Select 'Mentee' AS Mentor_type, firstname,lastname From Person 
inner join Employee on Person.personID = Employee.Person_PersonID 
Right Join Mentoring on Employee.employeeID = Mentoring.menteeID
order by Mentor_type,first_name,last_name;



/*5 */ 

create view Prospective_resurrection_v as
select customerID, FirstName, LastName, year(now())- year(RefDate) as YearSinceContact, count(ContactDate) from outreach 
inner join prospective on Prospective_Customer_customerID = Prospective.Customer_customerID
inner join referral on Prospective.Referral_RefDate = Referral.RefDate
inner join customer on Prospective.Customer_customerID = Customer.customerID
inner join person on customer.Person_PersonID = Person.PersonID
group by customerId, FirstName, LastName, YearSinceContact
having count(ContactDate) > 2 and YearSinceContact > 0;

SELECT * FROM Prospective_resurrection_v;



