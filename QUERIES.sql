/* 1 */
SELECT 'Steady' AS CustomerType, firstname, lastname, birthdate, phonenumber, email FROM person INNER JOIN customer on
	person.personid = customer.person_personid RIGHT JOIN steady ON customer.CUSTOMERID = steady.CUSTOMER_CUSTOMERID
UNION ALL
SELECT 'Premier' AS CustomerType, firstname, lastname, birthdate, phonenumber, 'N/A' as email FROM person INNER JOIN customer on
	person.personid = customer.person_personid RIGHT JOIN premier on customer.CUSTOMERID = premier.CUSTOMER_CUSTOMERID
UNION ALL
SELECT 'Prospective' AS CustomerType, firstname, lastname, birthdate, phonenumber, ProsEmail FROM person INNER JOIN customer on
	person.personid = customer.person_personid RIGHT JOIN prospective on customer.CUSTOMERID = prospective.CUSTOMER_CUSTOMERID;




/* 2 */
SELECT customer.customerid, serviceappointment_appdate  AS DateVisit, SUM(totalcostofservice) AS TotalCostForVisit FROM customer
	INNER JOIN serviceappointment ON customer.CUSTOMERID = serviceappointment.CUSTOMER_CUSTOMERID
	INNER JOIN maintenancevisitorder ON appdate = maintenancevisitorder.SERVICEAPPOINTMENT_APPDATE
    	AND maintenancevisitorder.`ServiceAppointment_Customer_customerID` = serviceappointment.`Customer_customerID`
    	AND maintenancevisitorder.`ServiceAppointment_Vehicle_VIN` = serviceappointment.`Vehicle_VIN`
	GROUP BY customer.customerid, SERVICEAPPOINTMENT_APPDATE;

OR

SELECT CUSTOMERID, ServiceAppointment_appDate AS DayOf, SUM(totalcostofservice) AS TotalCost
FROM Customer
INNER JOIN MaintenanceVisitOrder
    ON Customer.customerID = MaintenanceVisitOrder.ServiceAppointment_Customer_customerID
GROUP BY CUSTOMERID,ServiceAppointment_appDate;




/* 3 */
SELECT customerID, (SELECT FirstName FROM Person WHERE Person.personID = Customer.Person_PersonID) AS FIRSTNAME,
(SELECT LastName FROM Person WHERE Person.personID = Customer.Person_PersonID) AS LASTNAME,
(SELECT SUM(totalcostofservice)FROM MaintenanceVisitOrder WHERE MaintenanceVisitOrder.ServiceAppointment_Customer_customerID = Customer.CUSTOMERID AND YEAR(serviceappointment_appdate) > (YEAR(CURRENT_DATE)-2)) 
AS TOTAL
FROM Customer
WHERE (SELECT SUM(totalcostofservice)FROM MaintenanceVisitOrder WHERE MaintenanceVisitOrder.ServiceAppointment_Customer_customerID = Customer.CUSTOMERID AND YEAR(serviceappointment_appdate) > (YEAR(CURRENT_DATE)-2)) IS NOT NULL
ORDER BY TOTAL DESC
LIMIT 3;

/*Another way of doing 3*/
SELECT customer.customerid, person.`FirstName`, person.`LastName`, SUM(totalcostofservice) AS TotalCostForVisit FROM customer
	INNER JOIN serviceappointment ON customer.CUSTOMERID = serviceappointment.CUSTOMER_CUSTOMERID
	INNER JOIN PERSON ON customer.`Person_PersonID` = person.`PersonID`
	INNER JOIN maintenancevisitorder ON appdate = maintenancevisitorder.SERVICEAPPOINTMENT_APPDATE
    	AND maintenancevisitorder.`ServiceAppointment_Customer_customerID` = serviceappointment.`Customer_customerID`
    	AND maintenancevisitorder.`ServiceAppointment_Vehicle_VIN` = serviceappointment.`Vehicle_VIN`
	WHERE SERVICEAPPOINTMENT_APPDATE BETWEEN DATE_SUB(NOW(), INTERVAL 2 YEAR) and NOW()
	GROUP BY customer.customerid, person.`FirstName`, person.`LastName`
	ORDER BY TotalCostForVisit DESC
	LIMIT 3;




/* 4 */
SELECT Mechanic_Employee_EmployeeID as 'EmployeeID', p.FirstName, p.LastName, COUNT(Skill_skillName) AS SkillCount
FROM certification cert
INNER JOIN Employee e 
ON cert.Mechanic_Employee_EmployeeID = e.EmployeeID
INNER JOIN Person p
ON p.PersonID = e.Person_PersonID
GROUP BY e.EmployeeID HAVING COUNT(Skill_skillName) > 2;






/* 5 */
SELECT a.Mechanic_Employee_EmployeeID as 'Employee_1_ID', p1.FirstName as 'EMP_1_First Name', p1.LastName as 'EMP_1_Last Name',
b.Mechanic_Employee_EmployeeID as 'Employee_2_ID', p2.FirstName as 'EMP_2_First Name', p2.LastName as 'EMP_2_Last Name', COUNT(a.Skill_skillName = b.Skill_skillName) as 'SkillsInCommon' 
FROM certification a INNER JOIN certification b
ON a.Skill_skillName = b.Skill_skillName INNER JOIN Employee e
ON e.EmployeeID = a.Mechanic_Employee_EmployeeID INNER JOIN Person p1
ON p1.PersonID = e.Person_PersonID INNER JOIN Employee e2
ON e2.EmployeeID = b.Mechanic_Employee_EmployeeID INNER JOIN Person p2
ON p2.PersonID = e2.Person_PersonID 
WHERE a.Mechanic_Employee_EmployeeID > b.Mechanic_Employee_EmployeeID
GROUP BY b.Mechanic_Employee_EmployeeID, a.Mechanic_Employee_EmployeeID  HAVING COUNT(a.Skill_skillName = b.Skill_skillName) > 2;





/* 6 */
SELECT sq.packagename, sq.TotalCost, m2.itemname FROM (SELECT packagename, packageid, SUM(cost) AS TotalCost FROM package INNER JOIN maintenanceitem ON
	package.PACKAGEID = maintenanceitem.PACKAGE_PACKAGEID GROUP BY packagename, packageid) AS sq INNER JOIN maintenanceitem m2
	ON m2.PACKAGE_PACKAGEID = sq.packageid;


/* 7 */
SELECT DISTINCT m.`Employee_EmployeeID`, p.`FirstName`, p.`LastName` FROM mechanic m
	INNER JOIN Person p ON m.`Employee_EmployeeID` = p.`PersonID`
	INNER JOIN MaintenanceVisitOrder mvo ON m.`Employee_EmployeeID` = mvo.`Mechanic_Employee_EmployeeID`
	INNER JOIN MaintenanceItem mi ON mvo.`MaintenanceItem_maintID` = mi.`maintID`
	LEFT OUTER JOIN certification c ON c.`Skill_skillName` = mi.`Skill_skillRequired`
	WHERE c.`Mechanic_Employee_EmployeeID` = m.`Employee_EmployeeID` and c.`Skill_skillName` is NULL;



/* 8 */
SELECT firstname, lastname, birthdate, customerid, loyaltypoints FROM person p INNER JOIN customer c
ON p.PERSONID = c.PERSON_PERSONID INNER JOIN steady s ON c.CUSTOMERID = s.CUSTOMER_CUSTOMERID ORDER BY loyaltypoints DESC;


/* 9 */
SELECT c.`customerID`, p.`FirstName`, p.`LastName`, SUM(mp.`paymentAmount`) - SUM(ServicesUsed.TotalCostOfService) as PaymentMinusServiceUsed FROM customer c
	INNER JOIN person p ON c.`Person_PersonID` = p.`PersonID`
	INNER JOIN premier pr ON c.`customerID` = pr.`Customer_customerID`
	LEFT JOIN (SELECT c2.`customerID`, m2.`TotalCostOfService` FROM customer c2
    	INNER JOIN person p2 ON c2.`Person_PersonID` = p2.`PersonID`
    	INNER JOIN premier pr2 ON c2.`customerID` = pr2.`Customer_customerID`
    	INNER JOIN serviceappointment s2 ON c2.`customerID` = s2.`Customer_customerID`
    	INNER JOIN maintenancevisitorder m2 ON s2.`Customer_customerID` = m2.`ServiceAppointment_Customer_customerID`
        	AND s2.`appDate` = m2.`ServiceAppointment_appDate` AND s2.`Vehicle_VIN` = m2.`ServiceAppointment_Vehicle_VIN`
    	WHERE s2.`appDate` BETWEEN  DATE_SUB(NOW(), INTERVAL 3 YEAR) AND NOW()
	) as ServicesUsed ON c.`customerID` = ServicesUsed.customerID
	LEFT OUTER JOIN MonthlyPayment mp ON pr.`Customer_customerID` = mp.`Premier_Customer_customerID`
	WHERE mp.`paymentDate` BETWEEN  DATE_SUB(NOW(), INTERVAL 3 YEAR) AND NOW()
	GROUP BY c.`customerID`, p.`FirstName`, p.`LastName`
	ORDER BY SUM(mp.`paymentAmount`) - SUM(ServicesUsed.TotalCostOfService) DESC;



/* 10  #10 is about Net Profit. Instead of net profit, just calculate the total amount of money spent */
SELECT c.`customerID`, SUM(m.`TotalCostOfService`) SpendingTotal
	FROM customer c INNER JOIN serviceappointment s ON c.`customerID` = s.`Customer_customerID`
	INNER JOIN maintenancevisitorder m ON s.`Customer_customerID` = m.`ServiceAppointment_Customer_customerID`
	AND s.`appDate` = m.`ServiceAppointment_appDate` AND s.`Vehicle_VIN` = m.`ServiceAppointment_Vehicle_VIN`
	INNER JOIN maintenanceitem mt ON m.`MaintenanceItem_maintID` = mt.`maintID` WHERE c.`customerID` IN
	(SELECT c.`customerID` FROM customer c INNER JOIN steady s ON c.`customerID` = s.`Customer_customerID`
	WHERE m.`ServiceAppointment_appDate` >= '2016-01-01' AND m.`ServiceAppointment_appDate` <= '2016-12-31'
	GROUP BY c.`customerID`);



/*11*/
SELECT distinct Premier_Customer_customerID, (paymentAmount*12) AS SUM_PAYMENTS FROM MonthlyPayment
ORDER BY SUM_PAYMENTS;


/* 12 */
SELECT VisitCount.make, VisitCount.model, VisitCount.`vehicleYear`, (VisitCount.visits / VehicleCount.total) as visit_average
FROM
( SELECT v.make, v.model, v.`vehicleYear`, COUNT(sa.`appDate`) as visits FROM Vehicle v
	INNER JOIN ServiceAppointment sa ON v.`VIN` = sa.`Vehicle_VIN`
	WHERE sa.`appDate` BETWEEN DATE_SUB(NOW(), INTERVAL 3 YEAR) AND NOW()
	GROUP BY v.make, v.model, v.vehicleYear ) AS VisitCount
INNER JOIN
( SELECT v2.make, v2.model, v2.`vehicleYear`, COUNT(*) as total FROM Vehicle v2
	GROUP BY v2.make, v2.model, v2.vehicleYear ) as VehicleCount
	ON VisitCount.make = VehicleCount.make and VisitCount.model = VehicleCount.model
   	and VisitCount.vehicleYear = VehicleCount.vehicleYear
ORDER BY visit_average DESC
LIMIT 5;



/* 13 */
SELECT mn.`MentorID` AS MentorWithMostMentee, mn.`Skill_skillName` AS SkillsPassingAlong
	FROM mechanic mc INNER JOIN mentoring mn ON mc.`Employee_EmployeeID` = mn.`MentorID`
	INNER JOIN
	(SELECT MentorWithMenteeCount.MentorID, MAX(MentorWithMenteeCount.MenteeCount) FROM
    	(SELECT mn2.`MentorID`, COUNT(mn2.`MenteeID`) AS MenteeCount FROM mechanic mc2
        	INNER JOIN mentoring mn2 ON mc2.`Employee_EmployeeID` = mn2.`MentorID`
        	GROUP BY mn2.`MentorID`) as MentorWithMenteeCount) AS MentorWithMaxMentee
	ON mn.`MentorID` = MentorWithMaxMentee.MentorID;

/* 14 */
SELECT Skill_skillname, COUNT(Mechanic_Employee_EmployeeID) as Numb  FROM Certification 
GROUP BY Skill_skillname
ORDER BY COUNT(Mechanic_Employee_EmployeeID) ASC
LIMIT 3;



/* 15 */
SELECT e.EMPLOYEEID, 'Technician' AS Occupation FROM employee e INNER JOIN technician t ON e.EMPLOYEEID = t.employee_employeeid
	WHERE e.EMPLOYEEID IN (SELECT e.EMPLOYEEID FROM employee e INNER JOIN technician t ON e.EMPLOYEEID = t.EMPLOYEE_EMPLOYEEID)
UNION ALL
SELECT e.EMPLOYEEID, 'Mechanic' AS Occupation FROM employee e INNER JOIN mechanic m ON e.EMPLOYEEID = m.employee_employeeid
	WHERE e.EMPLOYEEID IN (SELECT e.EMPLOYEEID FROM employee e INNER JOIN mechanic m ON e.EMPLOYEEID = m.EMPLOYEE_EMPLOYEEID);



/* 16 */
SELECT s.`intervalMile`, s.`Package_PackageID` FROM vehicle v INNER JOIN serviceinterval s ON v.`VIN` = s.`Vehicle_VIN` INNER JOIN
	package p ON p.`PackageID` = s.`Package_PackageID`;
	




/* 17 */
SELECT itemname FROM maintenanceitem WHERE package_packageid IS NULL;






/* 18 */
 -- A mechanic can have a list of certifications
	SELECT employee_employeeid, p.firstName, p.lastName, skillname, dateearned FROM mechanic m INNER JOIN certification c ON
    	m.EMPLOYEE_EMPLOYEEID = c.MECHANIC_EMPLOYEE_EMPLOYEEID INNER JOIN skill s ON s.SKILLNAME = c.SKILL_SKILLNAME 
        INNER JOIN employee e on e.employeeid = m.EMPLOYEE_EMPLOYEEID INNER JOIN person p on p.PersonId = e.Person_PersonId;




-- Technicians receive a Salary, Mechanics get paid on an hourly basis
	SELECT e.EMPLOYEEID, p.FirstName, p.LastName, 'Salary' AS TypeOfPayment FROM employee e inner join technician t ON
    	e.EMPLOYEEID = t.EMPLOYEE_EMPLOYEEID inner join person p ON
        p.PersonID = e.Person_PersonID
	UNION
	SELECT e.EMPLOYEEID, p2.FirstName, p2.LastName, 'Hourly Rate' AS TypeOfPayment FROM employee e inner join mechanic m ON
    	e.EMPLOYEEID = m.EMPLOYEE_EMPLOYEEID inner join person p2 on
        p2.PersonID = e.Person_PersonID;


    
  	  -- Estimated Yearly Mileage must be greater than 100 miles
	SELECT estimatedMileagePerYear FROM vehicle;




        --4) A mechanic's hourly rate cannot be less than $10.00 
        SELECT e.EmployeeID, p.FirstName, p.LastName, mechanic.hourlyRate from mechanic inner join employee e ON e.EmployeeID = mechanic.Employee_EmployeeID 
        inner join person p ON p.PersonID = e.Person_PersonID where hourlyRate >= 10.00;




