DROP DATABASE EPIC_HC_ALERT_DB;
CREATE DATABASE EPIC_HC_ALERT_DB;
USE EPIC_HC_ALERT_DB;

CREATE TABLE SubscribedPatient (
    patientId VARCHAR(255) ,
    PRIMARY KEY(patientId)		
);

CREATE TABLE Patient (
    patientId VARCHAR(255) NOT NULL,
    patientName VARCHAR(255),
    email VARCHAR(255),
    homeaddressline VARCHAR(255),
    homeaddresscity VARCHAR(255),
    homeaddressstate VARCHAR(255),
    homephone VARCHAR(20),
    gender VARCHAR(20), 
    birthdate VARCHAR(20),	
    PRIMARY KEY(patientId)		
);

CREATE TABLE DiagnosticReport (
    reportId VARCHAR(255) NOT NULL, 
    patientId VARCHAR(255),
    report VARCHAR(255),
    reportDate VARCHAR(30),
    result VARCHAR(255),
    myValue VARCHAR(20),
    lowValue VARCHAR(20),
    highValue VARCHAR(20),
    PRIMARY KEY(reportId),
    FOREIGN KEY(patientId) REFERENCES Patient(patientId)
    ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE MedicationOrder (
    medicationOrderId VARCHAR(255) NOT NULL ,
    patientId VARCHAR(255),
    medication VARCHAR(255),
    dosageInstruction VARCHAR(255),
    frequency int,
    periodUnits VARCHAR(255),
    period double,
    startDate VARCHAR(255),
    endDate VARCHAR(255),	
    PRIMARY KEY(medicationOrderId),
    FOREIGN KEY(patientId) REFERENCES Patient(patientId)
    ON DELETE CASCADE ON UPDATE CASCADE 		
);

CREATE TABLE Practitioner (
    prescriberId VARCHAR(255),
    medicationOrderId VARCHAR(255),
    practitionerName VARCHAR(255),
    PRIMARY KEY(prescriberId),
    FOREIGN KEY(medicationOrderId) REFERENCES MedicationOrder(medicationOrderId)
    ON DELETE CASCADE ON UPDATE CASCADE 		
);


