-- DDL

CREATE TABLE Certification (
    dateEarned date NOT NULL,
    Skill_skillName varchar(50) NOT NULL,
    Mechanic_Employee_EmployeeID varchar(50) NOT NULL,
    CONSTRAINT Certification_pk PRIMARY KEY (Skill_skillName,Mechanic_Employee_EmployeeID)
);

CREATE TABLE Corporation (
    Customer_customerID varchar(50) NOT NULL,
    mailing varchar(50) NOT NULL,
    billing varchar(50) NOT NULL,
    vehiclePickup varchar(50) NOT NULL,
    vehicleDelivery varchar(50) NOT NULL,
    CONSTRAINT Corporation_pk PRIMARY KEY (Customer_customerID)
);

CREATE TABLE Customer (
    customerID varchar(50) NOT NULL,
    phoneNumber varchar(50) NOT NULL,
    yearJoined int NOT NULL,
    Person_PersonID varchar(50) NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY (customerID)
);

CREATE TABLE Employee (
    EmployeeID varchar(50) NOT NULL,
    Person_PersonID varchar(50) NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (EmployeeID)
);

CREATE TABLE Individual (
    homeAddress varchar(50) NOT NULL,
    Customer_customerID varchar(50) NOT NULL,
    CONSTRAINT Individual_pk PRIMARY KEY (Customer_customerID)
);

CREATE TABLE MaintenanceItem (
    maintID varchar(50) NOT NULL,
    cost double NOT NULL,
    itemName varchar(50) NOT NULL,
    Package_PackageID varchar(50),
    Skill_skillRequired varchar(50) NOT NULL,
    CONSTRAINT MaintenanceItem_pk PRIMARY KEY (maintID)
);

CREATE TABLE MaintenanceVisitOrder (
    Mechanic_Employee_EmployeeID varchar(50) NOT NULL,
    MaintenanceItem_maintID varchar(50) NOT NULL,
    ServiceAppointment_Customer_customerID varchar(50) NOT NULL,
    ServiceAppointment_appDate date NOT NULL,
    ServiceAppointment_Vehicle_VIN varchar(50) NOT NULL,
    TotalCostOfService double NOT NULL,
    MileageForNextService varchar(50) NOT NULL,
    CONSTRAINT MaintenanceVisitOrder_pk PRIMARY KEY (MaintenanceItem_maintID,ServiceAppointment_Customer_customerID,ServiceAppointment_appDate,ServiceAppointment_Vehicle_VIN)
);

CREATE TABLE Mechanic (
    Employee_EmployeeID varchar(50) NOT NULL,
    hourlyRate varchar(50) NOT NULL,
    CONSTRAINT Mechanic_pk PRIMARY KEY (Employee_EmployeeID)
);

CREATE TABLE Mentoring (
    Skill_skillName varchar(50) NOT NULL,
    MentorID varchar(50) NOT NULL,
    MenteeID varchar(50) NOT NULL,
    startDate date NOT NULL,
    endDate date,
    CONSTRAINT Mentoring_pk PRIMARY KEY (Skill_skillName,MentorID,MenteeID,startDate)
);

CREATE TABLE MonthlyPayment (
    Premier_Customer_customerID varchar(50) NOT NULL,
    paymentDate date NOT NULL,
    paymentAmount varchar(20) NOT NULL,
    CONSTRAINT MonthlyPayment_pk PRIMARY KEY (Premier_Customer_customerID,paymentDate)
);

CREATE TABLE Outreach (
    Date date NOT NULL,
    Type varchar(50) NOT NULL,
    Prospective_prospectiveID varchar(50) NOT NULL,
    CONSTRAINT Outreach_pk PRIMARY KEY (Date,Prospective_prospectiveID)
);

CREATE TABLE Package (
    PackageID varchar(50) NOT NULL,
    PackageName varchar(50) NOT NULL,
    CONSTRAINT Package_pk PRIMARY KEY (PackageID)
);

CREATE TABLE Person (
    PersonID varchar(50) NOT NULL,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Birthdate varchar(50) NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (PersonID)
);

CREATE TABLE Premier (
    calculatedAnnualFee varchar(20) NOT NULL,
    Customer_customerID varchar(50) NOT NULL,
    CONSTRAINT Premier_pk PRIMARY KEY (Customer_customerID)
);

CREATE TABLE Prospective (
     Customer_customerID varchar(50) NOT NULL,
    ProsCellPhoneNumber varchar(50) NOT NULL,
    ProsEmail varchar(50) NOT NULL,
    isDeadProspect boolean NOT NULL,
    Referral_Date date NOT NULL,
    Referral_Existing_customerID varchar(50) NOT NULL,
    CONSTRAINT Prospective_pk PRIMARY KEY (Customer_customerID)
);

CREATE TABLE Referral (
    Date date NOT NULL,
    Type varchar(50) NOT NULL,
    Existing_customerID varchar(50) NOT NULL,
    CONSTRAINT Outreach_pk PRIMARY KEY (Date,Existing_customerID)
 );

CREATE TABLE ServiceAppointment (
    appDate date NOT NULL,
    Customer_customerID varchar(50) NOT NULL,
    Vehicle_VIN varchar(50) NOT NULL,
    Technician_EmployeeID varchar(50) NOT NULL,
    appTime varchar(50) NOT NULL,
    currentMileage varchar(50) NOT NULL,
    CouponDiscountAmount varchar(50),
    CONSTRAINT ServiceAppointment_pk PRIMARY KEY (appDate,Customer_customerID,Vehicle_VIN)
);

CREATE TABLE ServiceInterval (
    S_INTERVAL_ID int NOT NULL,
    intervalMile varchar(50) NOT NULL,
    Vehicle_VIN varchar(50) NOT NULL,
    Package_PackageID varchar(50) NOT NULL,
    CONSTRAINT ServiceInterval_pk PRIMARY KEY (S_INTERVAL_ID,Vehicle_VIN)
);


CREATE TABLE Skill (
    skillName varchar(50) NOT NULL,
    CONSTRAINT Skill_pk PRIMARY KEY (skillName)
);

CREATE TABLE Steady (
    Customer_customerID varchar(50) NOT NULL,
    loyaltyPoints int NOT NULL,
    email varchar(50) NOT NULL,
    CONSTRAINT Steady_pk PRIMARY KEY (Customer_customerID)
);

CREATE TABLE Technician (
    Employee_EmployeeID varchar(50) NOT NULL,
    specialty varchar(20) NOT NULL,
    salary varchar(20) NOT NULL,
    CONSTRAINT Technician_pk PRIMARY KEY (Employee_EmployeeID)
);

CREATE TABLE Vehicle (
    VIN varchar(50) NOT NULL,
    make varchar(50) NOT NULL,
    model varchar(50) NOT NULL,
    vehicleYear varchar(50) NOT NULL,
    estimatedMileagePerYear varchar(50) NOT NULL,
    Customer_customerID varchar(50) NOT NULL,
    Package_PackageID varchar(50),
    CONSTRAINT Vehicle_pk PRIMARY KEY (VIN)
);

ALTER TABLE Certification ADD CONSTRAINT Certification_Mechanic FOREIGN KEY Certification_Mechanic (Mechanic_Employee_EmployeeID)
    REFERENCES Mechanic (Employee_EmployeeID);

ALTER TABLE Certification ADD CONSTRAINT Certification_Skill FOREIGN KEY Certification_Skill (Skill_skillName)
    REFERENCES Skill (skillName);

ALTER TABLE Corporation ADD CONSTRAINT Corporation_Customer FOREIGN KEY Corporation_Customer (Customer_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE Customer ADD CONSTRAINT Customer_Person FOREIGN KEY Customer_Person (Person_PersonID)
    REFERENCES Person (PersonID);

ALTER TABLE Employee ADD CONSTRAINT Employee_Person FOREIGN KEY Employee_Person (Person_PersonID)
    REFERENCES Person (PersonID);

ALTER TABLE Individual ADD CONSTRAINT Individual_Customer FOREIGN KEY Individual_Customer (Customer_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE MaintenanceItem ADD CONSTRAINT MaintenanceItem_Package FOREIGN KEY MaintenanceItem_Package (Package_PackageID)
    REFERENCES Package (PackageID);

ALTER TABLE MaintenanceItem ADD CONSTRAINT MaintenanceItem_Skill FOREIGN KEY MaintenanceItem_Skill (Skill_skillRequired)
    REFERENCES Skill (skillName);

ALTER TABLE MaintenanceVisitOrder ADD CONSTRAINT MaintenanceVisitOrder_MaintenanceItem FOREIGN KEY MaintenanceVisitOrder_MaintenanceItem (MaintenanceItem_maintID)
    REFERENCES MaintenanceItem (maintID);

ALTER TABLE MaintenanceVisitOrder ADD CONSTRAINT MaintenanceVisitOrder_Mechanic FOREIGN KEY MaintenanceVisitOrder_Mechanic (Mechanic_Employee_EmployeeID)
    REFERENCES Mechanic (Employee_EmployeeID);

ALTER TABLE MaintenanceVisitOrder ADD CONSTRAINT MaintenanceVisitOrder_ServiceAppointment FOREIGN KEY MaintenanceVisitOrder_ServiceAppointment (ServiceAppointment_appDate,ServiceAppointment_Customer_customerID,ServiceAppointment_Vehicle_VIN)
    REFERENCES ServiceAppointment (appDate,Customer_customerID,Vehicle_VIN);

ALTER TABLE Mechanic ADD CONSTRAINT Mechanic_Employee FOREIGN KEY Mechanic_Employee (Employee_EmployeeID)
    REFERENCES Employee (EmployeeID);

ALTER TABLE Mentoring ADD CONSTRAINT Mentee_Mechanic FOREIGN KEY Mentee_Mechanic (MenteeID)
    REFERENCES Mechanic (Employee_EmployeeID);

ALTER TABLE Mentoring ADD CONSTRAINT Mentoring_Mechanic FOREIGN KEY Mentoring_Mechanic (MentorID)
    REFERENCES Mechanic (Employee_EmployeeID);

ALTER TABLE Mentoring ADD CONSTRAINT Mentoring_Skill FOREIGN KEY Mentoring_Skill (Skill_skillName)
    REFERENCES Skill (skillName);

ALTER TABLE MonthlyPayment ADD CONSTRAINT MonthlyPayment_Premier FOREIGN KEY MonthlyPayment_Premier (Premier_Customer_customerID)
    REFERENCES Premier (Customer_customerID);

ALTER TABLE Outreach ADD CONSTRAINT Outreach_Prospective FOREIGN KEY Outreach_Prospective (Prospective_prospectiveID)
    REFERENCES Prospective (prospectiveID);

ALTER TABLE Premier ADD CONSTRAINT Premier_Customer FOREIGN KEY Premier_Customer (Customer_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE Prospective ADD CONSTRAINT Prospective_Customer FOREIGN KEY Prospective_Customer (Customer_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE Prospective ADD CONSTRAINT Prospective_Referral FOREIGN KEY Prospective_Referral (Referral_Date,Referral_Existing_customerID)
   REFERENCES Referral (Date,Existing_customerID);

ALTER TABLE Referral ADD CONSTRAINT Referral_Customer FOREIGN KEY Referral_Customer (Existing_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE ServiceAppointment ADD CONSTRAINT ServiceAppointment_Customer FOREIGN KEY ServiceAppointment_Customer (Customer_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE ServiceAppointment ADD CONSTRAINT ServiceAppointment_Technician FOREIGN KEY ServiceAppointment_Technician (Technician_EmployeeID)
    REFERENCES Technician (Employee_EmployeeID);

ALTER TABLE ServiceAppointment ADD CONSTRAINT ServiceAppointment_Vehicle FOREIGN KEY ServiceAppointment_Vehicle (Vehicle_VIN)
    REFERENCES Vehicle (VIN);

ALTER TABLE ServiceInterval ADD CONSTRAINT ServiceInterval_Package FOREIGN KEY ServiceInterval_Package (Package_PackageID)
    REFERENCES Package (PackageID);

ALTER TABLE ServiceInterval ADD CONSTRAINT ServiceInterval_Vehicle FOREIGN KEY ServiceInterval_Vehicle (Vehicle_VIN)
    REFERENCES Vehicle (VIN);

ALTER TABLE Steady ADD CONSTRAINT Steady_Customer FOREIGN KEY Steady_Customer (Customer_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE Technician ADD CONSTRAINT Technician_Employee FOREIGN KEY Technician_Employee (Employee_EmployeeID)
    REFERENCES Employee (EmployeeID);

ALTER TABLE Vehicle ADD CONSTRAINT Vehicle_Customer FOREIGN KEY Vehicle_Customer (Customer_customerID)
    REFERENCES Customer (customerID);

ALTER TABLE Vehicle ADD CONSTRAINT Vehicle_Package FOREIGN KEY Vehicle_Package (Package_PackageID)
    REFERENCES Package (PackageID);


----

