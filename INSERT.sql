insert into Person (PersonID, FirstName, LastName, Birthdate) values
  ('PSN000','John', 'Doe', '1975-12-30'),
  ('PSN001','Carlos','Lomeli', '1995-12-29'),
  ('PSN002','John','Davis', '1975-12-30'),
  ('PSN003','Ray','Chin', '1805-12-29'),
  ('PSN004','Dave','Brown', '2000-12-29'),
  ('PSN005','Luke','Skywalker', '2005-12-29'),
  ('PSN006','Turk','Bryant', '1995-7-29'),
  ('PSN007','Lebron','James', '2004-12-29'),
  ('PSN008','Jimmy','Neutron', '1987-12-29'),
  ('PSN009','Tom','James', '2004-12-30'),
  ('PSN010','Tom','Nguyen', '2016-12-29'),
  ('PSN011','Jill','Nguyen', '2000-8-29'),
  ('PSN012','Karen','Lopez', '1996-12-19'),
  ('PSN013','Marisol','Garcia', '2000-12-27'),
  ('PSN014','Sarah','Waller', '2016-12-29'),
  ('PSN015','John','Dorian', '1966-12-29'),
  ('PSN016','Chris','Turk', '1995-3-29'),
  ('PSN017','Carla','James', '2004-12-12'),
  ('PSN018','Perry','Cox', '1970-12-29'),
  ('PSN019','Bob','Kelso', '1940-12-30'),
  ('PSN020','Elliot','Reid', '1944-12-29'),
  ('PSN021','Matt','Fox', '1952-8-29'),
  ('PSN022','Pete','Pikle', '1966-12-19'),
  ('PSN023','Lou','Williams', '1970-12-27'),
  ('PSN024','Patrick','Ly','1990-11-19'),
  ('PSN025','Pat','Chin','1991-11-19'),
  ('PSN026','Carl','Lewis','1992-11-19'),
  ('PSN027','John','Riddle','1993-11-19'),
  ('PSN028','Tom','Voldemort', '1940-11-19');

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
  ('E000', '36.25'),
  ('E001', '12.89'),
  ('E002', '17.40'),
  ('E003', '13.22'),
  ('E004', '21.57'),
  ('E005', '11.63'),
  ('E006', '10.25'),
  ('E007', '15.22'),
  ('E010', '16.24');

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
  ('E002', 'wheels', '50,000'),
  ('E008', 'engines', '89,000'),
  ('E009', 'hvac', '66,420'),
  ('E010', 'windows', '44,410'),
  ('E011', 'electronics', '99,900');

insert into Skill(skillName) values
  ('air conditioning'),
  ('brakes'),
  ('clean'),
  ('engine'),
  ('fuel system'),
  ('front end'),
  ('head machining'),
  ('hoist operation'),
  ('oil change'),
  ('ring replacement'),
  ('smog'),
  ('suspension'),
  ('tire'),
  ('transmission');

insert into Mentoring(Skill_skillName, MentorID, MenteeID, startDate, endDate) values
  ('air conditioning', 'E000', 'E001', '2015-07-29', '2016-04-11'),
  ('smog', 'E004', 'E005', '2015-06-29', '2016-03-11'),
  ('air conditioning', 'E002', 'E004', '2015-07-29', '2016-04-11'),
  ('brakes', 'E000', 'E002', '2015-07-29', '2016-04-11'),
  ('engine', 'E000', 'E010', '2015-07-29', '2016-04-11'),
  ('air conditioning', 'E000', 'E003', '2015-07-29', '2016-04-11'),
  ('suspension', 'E010', 'E006', '2015-08-29', '2016-07-11'),
  ('suspension', 'E010', 'E005', '2015-08-29', '2016-08-11'),
  ('suspension', 'E010', 'E004', '2015-08-29', '2016-09-11'),
  ('suspension', 'E010', 'E003', '2015-08-29', '2016-10-11');


insert into Certification (dateEarned, Skill_skillName, Mechanic_Employee_EmployeeID) values
  ('2014-03-19', 'air conditioning', 'E000'),
  ('2014-06-19', 'brakes', 'E000'),
  ('2010-01-15', 'clean', 'E000'),
  ('2014-04-19', 'engine', 'E000'),
  ('2014-04-19' ,'fuel system', 'E000'),
  ('2014-04-19', 'front end', 'E000'),
  ('2013-04-19', 'head machining', 'E000'),
  ('2013-04-25', 'hoist operation', 'E000'),
  ('2013-05-19', 'ring replacement', 'E000'),
  ('2013-06-19', 'smog', 'E000'),
  ('2012-12-21', 'tire', 'E000'),
  ('2013-07-19', 'transmission', 'E000'),
  ('2016-05-11', 'air conditioning', 'E001'),
  ('2016-05-11', 'brakes', 'E001'),
  ('2010-01-15', 'clean', 'E001'),
  ('2016-05-11', 'engine', 'E001'),
  ('2016-05-11', 'air conditioning', 'E002'),
  ('2016-05-11', 'brakes', 'E002'),
  ('2010-01-15', 'clean', 'E002'),
  ('2016-05-11', 'air conditioning', 'E003'),
  ('2010-01-15', 'clean', 'E003'),
  ('2016-05-11', 'transmission', 'E003'),
  ('2010-01-15', 'clean', 'E004'),
  ('2016-05-11', 'smog', 'E004'),
  ('2016-05-11', 'air conditioning', 'E005'),
  ('2010-01-15', 'clean', 'E005'),
  ('2016-05-11', 'smog', 'E005'),
  ('2016-05-10', 'air conditioning', 'E006'),
  ('2010-01-15', 'clean', 'E006'),
  ('2016-05-11', 'front end', 'E006'),
  ('2016-05-11', 'oil change', 'E006'),
  ('2016-10-11', 'suspension', 'E006'),
  ('2010-01-15', 'clean', 'E010'),
  ('2016-04-11', 'engine', 'E010'),
  ('2016-04-11', 'oil change', 'E010'),
  ('2016-04-11', 'suspension', 'E010');

insert into Package(PackageID, PackageName) values
  ('BASIC', 'Basic'),
  ('BRONZE', 'Bronze'),
  ('SILVER', 'Silver'),
  ('GOLD', 'Gold'),
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
  (VIN, make, model, vehicleYear, estimatedMileagePerYear, Customer_customerID, Package_PackageID) values
  ('V0000', 'Toyota', 'Prius', '2011', '10,000', 'C000', 'PKG000'),
  ('V0001', 'Ford', 'Focus', '2009', '15,000', 'C001', 'SILVER'),
  ('V0002', 'Nissan', 'Sentra', '1999', '9,000', 'C002', 'PKG001'),
  ('V0003', 'Nissan', 'Rogue', '2009', '10,000', 'C003', 'PKG009'),
  ('V0004', 'Honda', 'Civic', '2009', '11,000', 'C004', 'PKG005'),
  ('V0005', 'Chevy', 'Astro', '2015', '12,000', 'C005', 'BRONZE'),
  ('V0006', 'Chevy', 'Cruze', '2016', '5,000', 'C006', 'BASIC'),
  ('V0007', 'Honda', 'Accord', '2009', '5,000', 'C007', 'PKG007'),
  ('V0008', 'Honda', 'Odyssey', '2009', '11,000', 'C008', 'PKG002'),
  ('V0009', 'Ford', 'F-150', '2000', '10,000', 'C009', 'PKG008'),
  ('V0010', 'Ford', 'Flex', '2009', '9,000', 'C010', 'PKG003'),
  ('V0011', 'Ford', 'Mustang', '2007', '10,000', 'C011', 'PKG004'),
  ('V0012', 'Ford', 'Explorer', '2012', '25,000', 'C012', 'PKG005'),
  ('V0013', 'Chevy', 'Malibu', '2009', '20,000', 'C013', 'GOLD'),
  ('V0014', 'Toyota', 'Corolla', '2014', '8,000', 'C014', null);


insert into ServiceAppointment
  (appDate, Customer_customerID, Vehicle_VIN, Technician_EmployeeID, appTime, currentMileage, CouponDiscountAmount) values
  ('2015-4-13', 'C000', 'V0000', 'E002', '04:30 PM', '39000', '2.25'),
  ('2016-4-30', 'C000', 'V0000', 'E009', '05:30 PM', '51000', '2.25'),

  ('2015-4-11', 'C001', 'V0001', 'E002', '04:30 PM', '44000', '2.25'),
  ('2016-4-13', 'C001', 'V0001', 'E008', '04:30 PM', '66000', '2.25'),
  ('2017-4-13', 'C001', 'V0001', 'E002', '04:30 PM', '78000', '2.25'),

  ('2016-4-12', 'C002', 'V0002', 'E010', '04:30 PM', '126000', '2.25'),

  ('2017-4-14', 'C003', 'V0003', 'E011', '04:30 PM', '40000', '2.25'),

  ('2016-12-13', 'C004', 'V0004', 'E002', '04:30 PM', '40000', '2.25'),
  ('2017-4-23', 'C004', 'V0004', 'E002', '04:30 PM', '55000', '2.25'),

  ('2015-4-13', 'C005', 'V0005', 'E008', '04:30 PM', '20000', '2.25'),

  ('2016-3-13', 'C006', 'V0006', 'E002', '04:30 PM', '4000', '2.25'),
  ('2017-5-13', 'C006', 'V0006', 'E002', '04:30 PM', '9500', '2.25'),

  ('2015-6-13', 'C007', 'V0007', 'E008', '04:30 PM', '25000', '2.25'),

  ('2017-4-13', 'C008', 'V0008', 'E009', '04:30 PM', '65000', '2.25'),

  ('2015-8-13', 'C009', 'V0009', 'E002', '04:30 PM', '110000', '2.25'),

  ('2015-7-13', 'C010', 'V0010', 'E008', '04:30 PM', '25000', '2.25'),
  ('2016-8-13', 'C010', 'V0010', 'E002', '04:30 PM', '35000', '2.25'),

  ('2017-1-13', 'C011', 'V0011', 'E008', '04:30 PM', '70000', '2.25'),

  ('2017-2-13', 'C012', 'V0012', 'E002', '04:30 PM', '80000', '2.25'),

  ('2016-9-13', 'C013', 'V0013', 'E011', '04:30 PM', '39000', '2.25'),
  ('2017-6-13', 'C013', 'V0013', 'E010', '04:30 PM', '60000', '2.25'),

  ('2015-4-2', 'C014', 'V0014', 'E002', '04:30 PM', '9000', '2.25');


insert into MaintenanceItem(maintID, cost, itemName, Package_PackageID,Skill_skillRequired) values
  ('MTNBSC000', 30.00, 'Oil Change', 'BASIC', 'oil change'),
  ('MTNBSC001', 40.00, 'Tire rotation', 'BASIC', 'tire'),
  ('MTNBRZ000', 35.00, 'Fuel System', 'BRONZE', 'fuel system'),
  ('MTNBRZ001', 40.00, 'Lucas Additive', 'BRONZE', 'front end'),
  ('MTNSIL000', 45.00, 'Axle Service', 'SILVER', 'suspension'),
  ('MTNSIL001', 30.00, 'Shocks', 'SILVER', 'suspension'),
  ('MTNGLD000', 60.00, 'Tire Change', 'GOLD', 'suspension'),
  ('MTNGLD001', 30.00, 'A/C unit', 'GOLD', 'air conditioning'),
  ('MTNGLD002', 80.00, 'Engine Ring Replacement', 'GOLD', 'ring replacement'),
  ('MTNGLD003', 15.00, 'Car Wash', 'GOLD', 'clean'),
  ('MTNGLD004', 30.00, 'Brakes', 'GOLD', 'brakes'),
  ('MTN000', 20.50, 'A/C unit', 'PKG000', 'air conditioning'),
  ('MTN001', 20.50, 'A/C recharge', 'PKG000', 'air conditioning'),
  ('MTN002', 50.00, 'Engine', 'PKG001', 'engine'),
  ('MTN003', 50.00, 'Engine Clean', 'PKG001', 'engine'),
  ('MTN004', 80.00, 'Engine Ring Replacement', 'PKG001', 'ring replacement'),
  ('MTN005a', 60.00, 'Tire Change', 'PKG002', 'suspension'),
  ('MTN005b', 15.00, 'Rim Clean', 'PKG002', 'clean'),
  ('MTN006', 55.00, 'CheckUp', 'PKG003', 'engine'),
  ('MTN007', 20.00, 'Wind Shield', 'PKG003', 'front end'),
  ('MTN008', 25.00, 'Axle Service', 'PKG004', 'suspension'),
  ('MTN009', 30.00, 'Shocks', 'PKG004', 'suspension'),
  ('MTN010', 30.00, 'Struts', 'PKG004', 'suspension'),
  ('MTN011', 130.00, 'Power Train', 'PKG005', 'transmission'),
  ('MTN012', 130.00, 'Drive Train', 'PKG005', 'transmisson'),
  ('MTN013', 40.00, 'Lucas Additive', 'PKG006', 'front end'),
  ('MTN014', 40.00, 'HeadLight Clean', 'PKG006', 'front end'),
  ('MTN015', 30.00, 'Transmission Fluid Drain', 'PKG007', 'transmission'),
  ('MTN016', 20.00, 'Transmission Fluid Filter', 'PKG007', 'transmission'),
  ('MTN017', 30.00, 'Oil Change', 'PKG008', 'oil change'),
  ('MTN018', 30.00, 'Oil Drain', 'PKG008', 'oil change'),
  ('MTN019', 30.00, 'Brakes', 'PKG009', 'brakes'),
  ('MTN020', 30.00, 'Brake pad change', 'PKG009', 'brakes'),
  ('MTN021', 30.00, 'Brake Fluid Drain', 'PKG009', 'transmission'),
  ('MTN022', 35.00, 'Drum Replacement', 'PKG009', 'brakes'),
  ('MTN023', 15.00, 'Car Wash', null, 'clean'),
  ('MTN024', 15.00, 'Car Wax', null, 'clean'),
  ('MTN025', 35.00, 'Brake Fluid Change', null, 'oil change'),
  ('MTN026', 30.00, 'Rebuild Engine', null, 'engine'),
  ('MTN027', 15.00, 'Tire Rotation', null, 'front end');

insert into MaintenanceVisitOrder
  (Mechanic_Employee_EmployeeID,MaintenanceItem_maintID, ServiceAppointment_Customer_customerID,
  ServiceAppointment_appDate, ServiceAppointment_Vehicle_VIN, TotalCostOfService, MileageForNextService) values
  ('E002', 'MTN000', 'C000', '2015-04-13', 'V0000', 20.50, '50000'), -- PKG000 
  ('E003', 'MTN001', 'C000', '2015-04-13', 'V0000', 20.50, '50000'),
  ('E004', 'MTN000', 'C000', '2015-04-30', 'V0000', 20.50, '65000'), -- PKG000
  ('E001', 'MTN001', 'C000', '2016-04-30', 'V0000', 20.50, '65000'), 
  ('E006', 'MTNSIL000', 'C001', '2015-04-11', 'V0001', 45.00, '50000'), -- SILVER 
  ('E005', 'MTNSIL001', 'C001', '2015-04-11', 'V0001', 30.00, '50000'), 
  ('E006', 'MTNSIL000', 'C001', '2016-04-13', 'V0001', 45.00, '65000'), -- SILVER 
  ('E003', 'MTNSIL001', 'C001', '2016-04-13', 'V0001', 30.00, '65000'), 
  ('E000', 'MTNSIL000', 'C001', '2017-04-13', 'V0001', 45.00, '80000'), -- SILVER 
  ('E007', 'MTNSIL001', 'C001', '2017-04-13', 'V0001', 30.00, '80000'), 

  ('E001', 'MTN002', 'C002', '2016-04-12', 'V0002', 50.00, '135000'), -- PKG001
  ('E000', 'MTN003', 'C002', '2016-04-12', 'V0002', 50.00, '135000'), 

  ('E001', 'MTN019', 'C003', '2017-04-14', 'V0003', 30.00, '55000'), -- PKG009
  ('E005', 'MTN020', 'C003', '2017-04-14', 'V0003', 30.00, '70000'), 

  ('E004', 'MTN011', 'C004', '2016-12-13', 'V0004', 130.00, '55000'), -- PKG005
  ('E003', 'MTN012', 'C004', '2016-12-13', 'V0004', 130.00, '55000'), 
  ('E000', 'MTN011', 'C004', '2017-04-23', 'V0004', 130.00, '70000'), -- PKG005
  ('E002', 'MTN012', 'C004', '2017-04-23', 'V0004', 130.00, '70000'), 

  ('E001', 'MTNBRZ000', 'C005', '2015-04-13', 'V0005', 35.00, '35000'), -- BRONZE
  ('E006', 'MTNBRZ001', 'C005', '2015-04-13', 'V0005', 40.00, '35000'), 

  ('E001', 'MTNBSC000', 'C006', '2016-03-13', 'V0006', 30.00, '10000'), -- BASIC
  ('E003', 'MTNBSC001', 'C006', '2017-05-13', 'V0006', 40.00, '15000'), 

  ('E002', 'MTN015', 'C007', '2015-06-13', 'V0007', 30.00, '90000'), -- PKG007
  ('E004', 'MTN016', 'C007', '2015-06-13', 'V0007', 20.00, '90000'), 

  ('E001', 'MTN005a', 'C008', '2017-04-13', 'V0008', 60.00, '70000'), -- PKG002
  ('E001', 'MTN005b', 'C008', '2017-04-13', 'V0008', 15.00, '70000'), 

  ('E007', 'MTN017', 'C009', '2015-07-13', 'V0009', 30.00, '130000'), -- PKG008
  ('E005', 'MTN018', 'C009', '2015-07-13', 'V0009', 30.00, '130000'), 

  ('E001', 'MTN006', 'C010', '2015-07-13', 'V0010', 55.00, '35000'), -- PKG003
  ('E002', 'MTN007', 'C010', '2015-07-13', 'V0010', 20.00, '35000'), 

  ('E006', 'MTN006', 'C010', '2016-08-13', 'V0010', 55.00, '45000'), -- PKG003
  ('E002', 'MTN007', 'C010', '2016-08-13', 'V0010', 20.00, '45000'), 

  ('E002', 'MTN008', 'C011', '2017-01-13', 'V0011', 25.00, '95000'), -- PKG004
  ('E004', 'MTN009', 'C011', '2017-01-13', 'V0011', 30.00, '95000'), 
  ('E006', 'MTN010', 'C011', '2017-01-13', 'V0011', 30.00, '95000'), 

  ('E001', 'MTN011', 'C012', '2016-04-13', 'V0012', 130.00, '95000'), -- PKG005
  ('E000', 'MTN012', 'C012', '2016-04-13', 'V0012', 130.00, '95000'), 

  ('E000', 'MTNGLD000', 'C013', '2016-9-13', 'V0013', 60.00, '60000'), -- GOLD
  ('E001', 'MTNGLD001', 'C013', '2016-9-13', 'V0013', 30.00, '60000'), 
  ('E002', 'MTNGLD002', 'C013', '2016-9-13', 'V0013', 80.00, '60000'), 
  ('E003', 'MTNGLD003', 'C013', '2016-9-13', 'V0013', 15.00, '60000'), 
  ('E004', 'MTNGLD004', 'C013', '2016-9-13', 'V0013', 30.00, '60000'), 

  ('E000', 'MTNGLD000', 'C013', '2017-6-13', 'V0013', 60.00, '80000'), -- GOLD
  ('E001', 'MTNGLD001', 'C013', '2017-6-13', 'V0013', 30.00, '80000'), 
  ('E002', 'MTNGLD002', 'C013', '2017-6-13', 'V0013', 80.00, '80000'), 
  ('E003', 'MTNGLD003', 'C013', '2017-6-13', 'V0013', 15.00, '80000'), 
  ('E004', 'MTNGLD004', 'C013', '2017-6-13', 'V0013', 30.00, '80000'), 

  ('E001', 'MTN024', 'C014', '2015-4-21', 'V0014', 15.00, '25000'); -- null

insert into Premier (calculatedAnnualFee, Customer_customerID) values
  ('2400.00', 'C011'),
  ('2400.00', 'C012'),
  ('2400.00', 'C013'),
  ('2400.00', 'C014');


insert into Prospective
  (prospectiveID,ProsCellPhoneNumber, ProsEmail, isDeadProspect, Customer_customerID, Person_PersonID) values
  ('PRSP000', '404-124-4444','louWillie@gmail.com', 1, 'C000', 'PSN023'),
  ('PRSP001', '463-234-9345','petePikle@yahoo.com', 0, 'C001', 'PSN022');

insert into Corporation
  (Customer_customerID, mailing, billing, vehiclePickup, vehicleDelivery) values
  ('C006','999 Park St Willow,CA 90734','897 Bumpy Road Bell,CA 67899','677 Loopy St Compton,CA 90766','456 ADC lane Rift,CA 90756'),
  ('C007','444 Cavs St Willow,OH 90734','345 Cleveland Blvd, OH 67899','123 El Sugundo LAX,CA 90766','123 Staples Center,CA 90756');

insert into Individual(homeAddress, Customer_customerID) values
  ('1200 Bellflower Blvd Long Beach, CA 90806', 'C000'),
  ('345 Acer Rd Lakewood, CA 90445', 'C001'),
  ('346 Acer Rd Lakewood, CA 90445', 'C002'),
  ('347 Acer Rd Lakewood, CA 90445', 'C003'),
  ('778 Bellflower Ave Long Beach, CA 90444', 'C004'),
  ('345 Spring St  Signal Hill, CA 90813', 'C005'),
  ('445 Spring St  Signal Hill, CA 90813', 'C008'),
  ('545 Spring St  Signal Hill, CA 90813', 'C009'),
  ('645 Spring St  Signal Hill, CA 90813', 'C010');

insert into MonthlyPayment (Premier_Customer_customerID,paymentDate, paymentAmount) values
  ('C011', '2015-3-23', '200'),
  ('C011', '2015-4-23', '200'),
  ('C012', '2015-3-23', '200'),
  ('C012', '2015-4-23', '200'),
  ('C013', '2015-3-23', '200'),
  ('C013', '2015-4-23', '200'),
  ('C014', '2015-3-23', '200'),
  ('C014', '2015-4-23', '200');

insert into Outreach (Date, Type, Prospective_prospectiveID) values
  ('2017-09-1', 'Prospective', 'PRSP000'),
  ('2017-10-1', 'Prospective', 'PRSP000'),
  ('2017-11-1', 'Prospective', 'PRSP000'),
  ('2017-12-1', 'Steady', 'PRSP001');

insert into Steady (Customer_customerID, loyaltyPoints, email) values
  ('C000', 340, 'johndoe@gmail.com'),
  ('C001', 400, 'carloslomeili@gmail.com'),
  ('C002', 500, 'johndavis@gmail.com'),
  ('C003', 210, 'raychin@gmail.com'),
  ('C004', 640, 'davebrown@gmail.com'),
  ('C005', 390, 'lukeskywalker@gmail.com'),
  ('C006', 340, 'turkbryant@gmail.com'),
  ('C007', 340, 'lebronjames@gmail.com'),
  ('C008', 140, 'elliotreid@gmail.com'),
  ('C009', 20, 'mattfox@gmail.com'),
  ('C010', 80, 'patrickly@gmail.com'); 





