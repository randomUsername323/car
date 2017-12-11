/* 1 */
SELECT 'Steady' AS CustomerType, firstname, lastname, birthdate, phonenumber, email FROM person INNER JOIN customer on
	person.personid = customer.person_personid RIGHT JOIN steady ON customer.CUSTOMERID = steady.CUSTOMER_CUSTOMERID
UNION ALL
SELECT 'Premier' AS CustomerType, firstname, lastname, birthdate, phonenumber, 'N/A' as email FROM person INNER JOIN customer on
	person.personid = customer.person_personid RIGHT JOIN premier on customer.CUSTOMERID = premier.CUSTOMER_CUSTOMERID;

/* 2 */
SELECT customer.customerid, serviceappointment_appdate  AS DateVisit, SUM(totalcostofservice) AS TotalCostForVisit FROM customer
	INNER JOIN serviceappointment ON customer.CUSTOMERID = serviceappointment.CUSTOMER_CUSTOMERID INNER JOIN maintenancevisitorder ON
	appdate = maintenancevisitorder.SERVICEAPPOINTMENT_APPDATE GROUP BY customer.customerid, SERVICEAPPOINTMENT_APPDATE;

/* 4 */
SELECT m.EMPLOYEE_EMPLOYEEID from mechanic m INNER JOIN certification c on m.EMPLOYEE_EMPLOYEEID = c.MECHANIC_EMPLOYEE_EMPLOYEEID
	INNER JOIN skill s on c.SKILL_SKILLNAME = s.SKILLNAME GROUP BY m.EMPLOYEE_EMPLOYEEID HAVING COUNT(s.SKILLNAME) > 2;

/* 6 */
SELECT sq.packagename, sq.TotalCost, m2.itemname FROM (SELECT packagename, packageid, SUM(cost) AS TotalCost FROM package INNER JOIN maintenanceitem ON
	package.PACKAGEID = maintenanceitem.PACKAGE_PACKAGEID GROUP BY packagename, packageid) AS sq INNER JOIN maintenanceitem m2
	ON m2.PACKAGE_PACKAGEID = sq.packageid;

/* 8 */
SELECT firstname, lastname, birthdate, customerid, loyaltypoints FROM person p INNER JOIN customer c
ON p.PERSONID = c.PERSON_PERSONID INNER JOIN steady s ON c.CUSTOMERID = s.CUSTOMER_CUSTOMERID ORDER BY loyaltypoints DESC;

/* 15 */
SELECT e.EMPLOYEEID, 'Technician' AS Occupation FROM employee e INNER JOIN technician t ON e.EMPLOYEEID = t.employee_employeeid
	WHERE e.EMPLOYEEID IN (SELECT e.EMPLOYEEID FROM employee e INNER JOIN technician t ON e.EMPLOYEEID = t.EMPLOYEE_EMPLOYEEID)
UNION ALL
SELECT e.EMPLOYEEID, 'Mechanic' AS Occupation FROM employee e INNER JOIN mechanic m ON e.EMPLOYEEID = m.employee_employeeid
	WHERE e.EMPLOYEEID IN (SELECT e.EMPLOYEEID FROM employee e INNER JOIN mechanic m ON e.EMPLOYEEID = m.EMPLOYEE_EMPLOYEEID);
	
/* 17 */
SELECT itemname FROM maintenanceitem WHERE package_packageid IS NULL;

/* 18 */
	-- A mechanic can have a list of certifications
	SELECT employee_employeeid, skillname, dateearned FROM mechanic m INNER JOIN certification c ON
    	m.EMPLOYEE_EMPLOYEEID = c.MECHANIC_EMPLOYEE_EMPLOYEEID INNER JOIN skill s ON s.SKILLNAME = c.SKILL_SKILLNAME;

	-- Technicians receive a Salary, Mechanics get paid on an hourly basis
	SELECT e.EMPLOYEEID, 'Salary' AS TypeOfPayment FROM employee e inner join technician t ON
    	e.EMPLOYEEID = t.EMPLOYEE_EMPLOYEEID
	UNION
	SELECT e.EMPLOYEEID, 'Hourly Rate' AS TypeOfPayment FROM employee e inner join mechanic m ON
    	e.EMPLOYEEID = m.EMPLOYEE_EMPLOYEEID;
    
	-- Estimated Yearly Mileage must be 18 year-olds or older
	SELECT estimatedmileage FROM vehicle;

