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
  ('PSN024','Patrick','Ly', '1990-11-19'),
  ('PSN025','Pat','Chin', '1990-11-19'),
  ('PSN026','Carl','Lewis', '1990-11-19'),
  ('PSN027','John','Riddle', '1990-11-19'),
  ('PSN028','Tom','Voldemort', '1990-11-19');

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
  ('E002', '17.40'),
  ('E003', '13.22'),
  ('E004', '21.57'),
  ('E005', '11.63'),
  ('E006', '10.25'),
  ('E007', '15.22');

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
  ('C008', '156-234-2324', 2007, 'PSN020'),
  ('C009', '156-234-2944', 2008, 'PSN021'),
  ('C010', '156-234-2844', 2010, 'PSN024'),
  ('C011', '156-234-2844', 2009, 'PSN025'),
  ('C012', '156-334-2844', 2013, 'PSN026'),
  ('C013', '156-274-2844', 2015, 'PSN027'),
  ('C014', '156-294-2844', 2010, 'PSN028');

insert into Technician (Employee_EmployeeID, specialty, salary) values
  ('E002', 'wheels', '50000'),
  ('E008', 'engines ', '89,000'),
  ('E009', 'hvac ', '66,420 '),
  ('E010', 'windows ', '44,410 '),
  ('E011', 'electronics ', '99,900 ');

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
  ('air conditioning', 'E000', 'E001', '2015-07-29', '2016-04-11'),
  ('smog', 'E004', 'E005', '2015-06-29', '2016-03-11'),
  ('air conditioning', 'E007', 'E008', '2015-07-29', '2016-04-11'),
  ('brakes', 'E000', 'E002', '2015-07-29', '2016-04-11'),
  ('engine', 'E000', 'E010', '2015-07-29', '2016-04-11'),
  ('air conditioning', 'E000', 'E003', '2015-07-29', '2016-04-11');

insert into Certification (dateEarned, Skill_skillName, Mechanic_Employee_EmployeeID) values
  ('2014-03-19', 'air conditioning', 'E000'),
  ('2014-06-19', 'brakes', 'E000'),
  ('2014-04-19', 'engine', 'E000'),
  ('2016-05-11', 'air conditioning', 'E001'),
  ('2016-05-11', 'brakes', 'E001'),
  ('2016-05-11', 'engine', 'E001'),
  ('2016-05-11', 'air conditioning', 'E002'),
  ('2016-05-11', 'transmission', 'E003'),
  ('2016-05-11', 'smog', 'E004'),
  ('2016-05-11', 'air conditioning', 'E005'),
  ('2016-05-11', 'front end', 'E006'),
  ('2016-05-10', 'air conditioning', 'E006'),
  ('2016-05-11', 'oil change', 'E006'),
  ('2016-05-11', 'front end', 'E007'),
  ('2016-05-10', 'air conditioning', 'E007'),
  ('2016-04-11', 'oil change', 'E007'),
  ('2016-04-11', 'oil change', 'E008'),
  ('2015-04-11', 'brakes', 'E009'),
  ('2016-04-11', 'suspension', 'E010'),
  ('2016-04-11', 'oil change', 'E010');

insert into Package(PackageID, PackageName) values
  ('PKG000', 'Air Systems'),
  ('PKG001', 'Engine'),
  ('PKG002', 'Lower External'),
  ('PKG003', 'Routine'),
  ('PKG004', 'Suspension'),
  ('PKG005', 'Transmission'),
  ('PKG006', 'Tune-Up'),
  ('PKG007', 'Fluid Exchange'),
  ('PKG008', 'Oil Service'),
  ('PKG009', 'Brakes');

insert into Vehicle
  (VIN, make, model, vehicleYear, estimatedMileage, Customer_customerID, Package_PackageID) values
  ('V0000', 'Toyota', 'Prius', '2011', '50,000', 'C000', 'PKG000'),
  ('V0001', 'Ford', 'Focus', '2009', '80,000', 'C001', 'PKG001'),
  ('V0002', 'Nissan', 'Sentra', '1995', '76,000', 'C002', 'PKG001'),
  ('V0003', 'Nissan', 'Rogue', '2009', '80,000', 'C003', 'PKG001'),
  ('V0004', 'Honda', 'Civic', '2009', '77,111', 'C004', 'PKG005'),
  ('V0005', 'Chevy', 'Astro', '2009', '80,000', 'C005', 'PKG002'),
  ('V0006', 'Chevy', 'Cruze', '2017', '78,040', 'C006', 'PKG001'),
  ('V0007', 'Honda', 'Accord', '2009', '80,000', 'C007', 'PKG007'),
  ('V0008', 'Honda', 'Odyssey', '2009', '64,896', 'C008', 'PKG001'),
  ('V0009', 'Ford', 'F-150', '2000', '80,000', 'C009', 'PKG008'),
  ('V0010', 'Ford', 'Flex', '2009', '76,961', 'C010', 'PKG001'),
  ('V0011', 'Ford', 'Mustang', '2007', '80,000', 'C011', 'PKG004'),
  ('V0012', 'Ford', 'Explorer', '2012', '80,000', 'C012', 'PKG005'),
  ('V0013', 'Chevy', 'Malibu', '2009', '40,000', 'C013', 'PKG006'),
  ('V0014', 'Toyota', 'Corolla', '2014', '59,777', 'C014', 'PKG001');


insert into ServiceAppointment
  (appDate, Customer_customerID, Vehicle_VIN, Technician_EmployeeID, appTime, currentMileage, CouponDiscountAmount ) values
  ('2015-4-13', 'C000', 'V0000', 'E002', '04:30 PM', '39000', '2.25'),
  ('2016-4-30', 'C000', 'V0000', 'E009', '05:30 PM', '50000', '2.25'),
  ('2015-4-11', 'C001', 'V0001', 'E002', '04:30 PM', '54000', '2.25'),
  ('2016-4-13', 'C001', 'V0001', 'E008', '04:30 PM', '76000', '2.25'),
  ('2017-4-13', 'C001', 'V0001', 'E002', '04:30 PM', '80000', '2.25'),
  ('2016-4-13', 'C002', 'V0002', 'E010', '04:30 PM', '76000', '2.25'),
  ('2017-4-13', 'C003', 'V0003', 'E011', '04:30 PM', '80000', '2.25'),
  ('2016-12-13', 'C004', 'V0004', 'E002', '04:30 PM', '70000', '2.25'),
  ('2017-4-13', 'C004', 'V0004', 'E002', '04:30 PM', '77111', '2.25'),
  ('2015-4-13', 'C005', 'V0005', 'E008', '04:30 PM', '80000', '2.25'),
  ('2015-4-13', 'C006', 'V0006', 'E002', '04:30 PM', '70000', '2.25'),
  ('2016-4-13', 'C006', 'V0006', 'E002', '04:30 PM', '78040', '2.25'),
  ('2015-4-13', 'C007', 'V0007', 'E008', '04:30 PM', '80000', '2.25'),
  ('2017-4-13', 'C008', 'V0008', 'E009', '04:30 PM', '64896', '2.25'),
  ('2015-4-13', 'C009', 'V0009', 'E002', '04:30 PM', '80000', '2.25'),
  ('2015-4-13', 'C010', 'V0010', 'E008', '04:30 PM', '70000', '2.25'),
  ('2016-8-13', 'C010', 'V0010', 'E002', '04:30 PM', '76961', '2.25'),
  ('2017-4-13', 'C011', 'V0011', 'E008', '04:30 PM', '80000', '2.25'),
  ('2017-2-13', 'C012', 'V0012', 'E002', '04:30 PM', '80000', '2.25'),
  ('2016-4-13', 'C013', 'V0013', 'E011', '04:30 PM', '39000', '2.25'),
  ('2017-4-13', 'C013', 'V0013', 'E010', '04:30 PM', '40000', '2.25'),
  ('2015-4-13', 'C014', 'V0014', 'E002', '04:30 PM', '59777', '2.25');


insert into MaintenanceItem(maintID, cost, itemName, Package_PackageID,Skill_skillRequired) values
  ('MTN000', 20.50, 'A/C unit', 'PKG000', 'air conditioning'),
  ('MTN001', 30.00, 'Oil Change', 'PKG008', 'oil change'),
  ('MTN002', 35.00, 'Car Wash', 'null', 'oil change'),
  ('MTN003', 30.00, 'Brakes', 'PKG009', 'brakes'),
  ('MTN004', 50.00, 'Engine', 'PKG001', 'engine'),
  ('MTN005', 30.00, 'Shocks', 'PKG004', 'suspension'),
  ('MTN006', 40.00, 'Lucas Additive', 'PKG006', 'front end'),
  ('MTN007', 30.00, 'Transimisson Fluid Drain', 'PKG007', 'transmission'),
  ('MTN008', 35.00, 'Brake Fluid Change', 'null', 'oil change'),
  ('MTN009', 15.00, 'Tire Rotation', 'null', 'front end'),
  ('MTN010', 25.00, 'Axle Service', 'PKG004', 'suspension'),
  ('MTN011', 60.00, 'Tire Change', 'PKG002', 'suspension'),
  ('MTN012', 55.00, 'Check Up', 'PKG003', 'engine'),
  ('MTN013', 130.00, 'Power Train', 'PKG005', 'transmission'),
  ('MTN0014', 130.00, 'Drive Train', 'PKG005', 'transmisson'),
  ('MTN0015', 30.00, 'Rebuild Engine', 'PKG001', 'emgine');

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


