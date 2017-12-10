insert into Person (PersonID, FirstName, LastName, Birthdate) values
  ('PSN000','John', 'Doe', '1975-12-30'),
  ('PSN001','Carlos','Lomeli','1995-12-29'),
  ('PSN002','John','Davis','1975-12-30'),
  ('PSN003','Ray','Chin','1805-12-29'),
  ('PSN004','Dave','Brown','2000-12-29'),
  ('PSN005','Luke','Skywalker','2005-12-29'),
  ('PSN006','Turk','Bryant','1995-7-29'),
  ('PSN007','Lebron','James','2004-12-29'),
  ('PSN008','Jimmy','Neutron','1987-12-29'),
  ('PSN009','Tom','James','2004-12-30'),
  ('PSN010','Tom','Nguyen','2016-12-29'),
  ('PSN011','Jill','Nguyen','2000-8-29'),
  ('PSN012','Karen','Lopez','1996-12-19'),
  ('PSN013','Marisol','Garcia','2000-12-27'),
  ('PSN014','Sarah','Waller','2016-12-29'),
  ('PSN015','John','Dorian','1966-12-29'),
  ('PSN016','Chris','Turk','1995-3-29'),
  ('PSN017','Carla','James','2004-12-12'),
  ('PSN018','Perry','Cox','1970-12-29'),
  ('PSN019','Bob','Kelso','1940-12-30'),
  ('PSN020','Elliot','Reid','1944-12-29'),
  ('PSN021','Matt','Fox','1802-8-29'),
  ('PSN022','Pete','Pikle','1966-12-19'),
  ('PSN023','Lou','Williams','1970-12-27'),
  ('PSN024','Patrick','Ly', '1990-11-19');

insert into Employee(EmployeeID, Person_PersonID) values
  ('E000', 'PSN019'),
  ('E001', 'PSN018'),
  ('E002', 'PSN017'),
  ('E003', 'PSN008'),
  ('E004', 'PSN009'),
  ('E005', 'PSN010'),
  ('E006', 'PSN011'),
  ('E007', 'PSN012'),
  ('E008', 'PSN013'),
  ('E009', 'PSN014'),
  ('E010', 'PSN015'),
  ('E011', 'PSN016');
 



insert into Mechanic(Employee_EmployeeID, hourlyRate) values
  ('E000', '16.25'),
  ('E001', '12.89'),
  ('E003', '13.22'),
  ('E004', '21.57'),
  ('E005', '11.63'),
  ('E006', '10.25'),
  ('E007', '15.22');



insert into Skill(skillName) values
  ('air conditioning'),
  ('brakes'),
  ('engine'),
  ('front end'),
  ('oil change'),
  ('smog'),
  ('suspension'),
  ('transmission');

insert into Mentoring(Skill_skillName, MentorID, MenteeID, startDate, endDate) values
  ('air conditioning', 'E000', 'E001', '2015-07-29', '2016-04-11');

insert into Certification (dateEarned, Skill_skillName, Mechanic_Employee_EmployeeID) values
  ('2014-03-19', 'air conditioning', 'E000'),
  ('2016-05-11', 'air conditioning', 'E001');

insert into Customer
(customerID, phoneNumber, yearJoined, Person_PersonID) values
  ('C000', '652-734-2345', 2003, 'PSN000'),
  ('C001', '942-434-4345', 2003, 'PSN001'),
  ('C002', '352-734-9345', 2005, 'PSN002'),
  ('C003', '631-835-7345', 2003, 'PSN003'),
  ('C004', '928-734-5345', 2005, 'PSN004'),
  ('C005', '326-536-4345', 2006, 'PSN005'),
  ('C006', '252-111-2335', 2003, 'PSN006'),
  ('C007', '156-234-2344', 2007, 'PSN007'),
  ('C008', '156-234-2344', 2007, 'PSN020'),
  ('C009', '156-234-2344', 2008, 'PSN021'),
  ('C010', '156-234-2344', 2010, 'PSN024');


insert into Technician (Employee_EmployeeID, specialty, salary) values
  ('E002', 'wheels', '50000'),
  ('E008', 'engines ', '89,000'),
  ('E009', 'hvac ', '66,420 '),
  ('E010', 'windows ', '44,410 '),
  ('E011', 'electronics ', '99,900 ');

insert into Package(PackageID, PackageName) values
  ('PKG000', 'Air Systems'),
  ('PKG001', 'Engine'),
  ('PKG002', 'Lower External'),
  ('PKG003', 'Routine'),
  ('PKG004', 'Suspension');

insert into Vehicle
  (VIN, make, model, year, estimatedMileage, Customer_customerID, Package_PackageID) values
  ('V0000', 'Toyota', 'Prius', '2011', '50,000', 'C000', 'PKG000'),
  ('V0001', 'Ford', 'Focus', '2009', '80,000', 'C001', 'PKG001');

insert into ServiceAppointment
  (appDate, Customer_customerID, Vehicle_VIN, Technician_EmployeeID, appTime, currentMileage, CouponDiscountAmount ) values
  ('2015-4-13', 'C000', 'V0000', 'E002', '04:30 PM', '39000', '2.25');

insert into MaintenanceItem(maintID, cost, itemName, Package_PackageID,Skill_skillRequired) values
  ('MTN000', 20.50, 'A/C unit', 'PKG000', 'air conditioning'),
  ('MTN001', 30.00, 'Oil Change', 'PKG000', 'oil change');

insert into MaintenanceVisitOrder
  (Mechanic_Employee_EmployeeID,MaintenanceItem_maintID, ServiceAppointment_Customer_customerID,
  ServiceAppointment_appDate, ServiceAppointment_Vehicle_VIN, TotalCostOfService, MileageForNextService) values
  ('E000', 'MTN000', 'C000', '2015-4-13', 'V0000', 20.50, '100,000'),
  ('E001', 'MTN001', 'C000', '2015-4-13', 'V0000', 30.00, '101,000');

insert into Premier (calculatedAnnualFee, Customer_customerID) values
  ('4000.00', 'C001');

insert into Prospective
  (prospectiveID,ProsCellPhoneNumber, ProsEmail, isDeadProspect, Customer_customerID, Person_PersonID) values
  ('PRSP000', '404-124-4444','louWillie@gmail.com', 0, 'C000', 'PSN023'),
  ('PRSP001', '463-234-9345','petePikle@yahoo.com', 0, 'C001', 'PSN022');

insert into Corporation
  (Customer_customerID, mailing, billing, vehiclePickup, vehicleDelivery) values
  ('C006','999 Park St Wiilow,CA 90734','897 Bumpy Road Bell,Ca 67899','677 Loopy St Compton,CA 90766','456 ADC lane Rift,CA 90756'),
  ('C007','444 Park St Wiilow,CA 90734','345 Bumpy Road Bell,Ca 67899','666 Loopy St Compton,CA 90766','789 ADC lane Rift,CA 90756');

insert into Individual(homeAddress, Customer_customerID) values
  ('345 Acer Rd Lakewood, CA 90445', 'C005'),
  ('778 Bellflower Ave Long Beach, CA 90444', 'C004');

insert into MonthlyPayment (Premier_Customer_customerID,paymentDate, paymentAmount) values
  ('C001', '2012-3-23', '50'),
  ('C001', '2012-4-23', '50');

insert into Outreach (Date, Type, Prospective_prospectiveID) values
  ('2017-11-1', 'Prospective', 'PRSP000'),
  ('2017-12-1', 'Steady', 'PRSP001');

insert into Steady (Customer_customerID, loyaltyPoints, email) values
  ('C000', 340, 'johndoe@gmail.com');

