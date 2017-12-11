
ALTER TABLE Certification
    DROP FOREIGN KEY Certification_Mechanic;

ALTER TABLE Certification
    DROP FOREIGN KEY Certification_Skill;

ALTER TABLE Corporation
    DROP FOREIGN KEY Corporation_Customer;

ALTER TABLE Customer
    DROP FOREIGN KEY Customer_Person;

ALTER TABLE Employee
    DROP FOREIGN KEY Employee_Person;

ALTER TABLE Individual
    DROP FOREIGN KEY Individual_Customer;

ALTER TABLE MaintenanceItem
    DROP FOREIGN KEY MaintenanceItem_Package;

ALTER TABLE MaintenanceItem
    DROP FOREIGN KEY MaintenanceItem_Skill;

ALTER TABLE MaintenanceVisitOrder
    DROP FOREIGN KEY MaintenanceVisitOrder_MaintenanceItem;

ALTER TABLE MaintenanceVisitOrder
    DROP FOREIGN KEY MaintenanceVisitOrder_Mechanic;

ALTER TABLE MaintenanceVisitOrder
    DROP FOREIGN KEY MaintenanceVisitOrder_ServiceAppointment;

ALTER TABLE Mechanic
    DROP FOREIGN KEY Mechanic_Employee;

ALTER TABLE Mentoring
    DROP FOREIGN KEY Mentee_Mechanic;

ALTER TABLE Mentoring
    DROP FOREIGN KEY Mentoring_Mechanic;

ALTER TABLE Mentoring
    DROP FOREIGN KEY Mentoring_Skill;

ALTER TABLE MonthlyPayment
    DROP FOREIGN KEY MonthlyPayment_Premier;

ALTER TABLE Outreach
    DROP FOREIGN KEY Outreach_Prospective;

ALTER TABLE Premier
    DROP FOREIGN KEY Premier_Customer;

ALTER TABLE Prospective
    DROP FOREIGN KEY Prospective_Customer;

ALTER TABLE Prospective
    DROP FOREIGN KEY Prospective_Person;

ALTER TABLE ServiceAppointment
    DROP FOREIGN KEY ServiceAppointment_Customer;

ALTER TABLE ServiceAppointment
    DROP FOREIGN KEY ServiceAppointment_Technician;

ALTER TABLE ServiceAppointment
    DROP FOREIGN KEY ServiceAppointment_Vehicle;
    
ALTER TABLE ServiceInterval 
    DROP FOREIGN KEY ServiceInterval_Package;

ALTER TABLE ServiceInterval 
    DROP FOREIGN KEY ServiceInterval_Vehicle;
    
ALTER TABLE Steady
    DROP FOREIGN KEY Steady_Customer;

ALTER TABLE Technician
    DROP FOREIGN KEY Technician_Employee;

ALTER TABLE Vehicle
    DROP FOREIGN KEY Vehicle_Customer;

ALTER TABLE Vehicle
    DROP FOREIGN KEY Vehicle_Package;

-- tables
DROP TABLE Certification;

DROP TABLE Corporation;

DROP TABLE Customer;

DROP TABLE Employee;

DROP TABLE Individual;

DROP TABLE MaintenanceItem;

DROP TABLE MaintenanceVisitOrder;

DROP TABLE Mechanic;

DROP TABLE Mentoring;

DROP TABLE MonthlyPayment;

DROP TABLE Outreach;

DROP TABLE Package;

DROP TABLE Person;

DROP TABLE Premier;

DROP TABLE Prospective;

DROP TABLE ServiceAppointment;

DROP TABLE Skill;

DROP TABLE Steady;

DROP TABLE Technician;

DROP TABLE Vehicle;
