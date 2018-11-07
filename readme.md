##Health-care Notification Platform

#####Used Products : WSO2 EI 6.3.0 , WSO2 SP 4.2.0 , WSO2 APIM 2.5.0

Note: Current Implementation only supports  EPIC systems (FHIR-DSTU2).

This is a Simple Implementation of Realtime Healthcare-Notification Platform. Find below diagram to understand the flow of this solution.

![alt text](https://raw.githubusercontent.com/NGimhana/HC_ALERT/master/Architectural%20Diagrams/Blank%20Diagram.png)

**Step 1 : WSO2 EI fetches data from EHR systems(EPIC Sandbox in this case).** 

Since EPIC follows patient-centric FHIR standards, storing of Patient Ids in a database is a prerequisite. In this particular solution, Patient Ids are collected from a Subscriber Interface.

Data polling is done by WSO2 EI Scheduled Tasks . Each Schedule Task executes Sequence. Each Sequence is used to fetch some Unique data. Currently fetches Observation EMRs and  Medication Order EMRs.(Interval:12h count :-1)

Always use Accept Header for avoiding unexpected runtime errors. : Since default EPIC response content-type is application/xml.

This is built as a Mock service and in production can have better ways to data retrieval.

Find Below table for the Sequences and what they are fetching.

| Code|Observation| Sequence Involve|
| ------------- | ------------- |----------|
| 718-7  | Blood Hemoglobin  |EPIC_DATA_POLL_HB_OBSERVATION_SEQUENCE|
| 2823-3  | Blood Potassium  |EPIC_DATA_POLL_POTASSIUM_OBSERVATION_SEQUENCE|
|2345-7 | Blood Glucose | EPIC_DATA_POLL_GLUCOSE_OBSERVATION_SEQUENCE|
|2093-3|Blood Cholesterol| EPIC_DATA_POLL_CHOLESTEROL_OBSERVATION_SEQUENCE|

#####EPIC APIS Used 
Use WSO2 ESB EPIC Connector for execute EPIC APIs. Below synapse configuration sample shows Epic Observation operation
```
<Epic.searchObservation>
    <patient>{$ctx:id}</patient>
    <code>718-7</code>
</Epic.searchObservation>
```

* {$ctx:id}: Patient Id fetched from DB
* code 	 : These are the International codes for Healthcare Observations.( https://loinc.org )	




In addition EPIC_DATA_POLL_MEDICATION_ORDER_SEQUENCE for fetching Medication Orders.

####Database Schema

![alt text](https://raw.githubusercontent.com/NGimhana/HC_ALERT/master/Architectural%20Diagrams/Entity%20Relationship%20Diagram%20-%20New%20Page.png)
   

**Step 2 : WSO2 EI validates retrieved responses.**

Here WSO2 EI validates whether responses can be categorized under below types. 

**Response Validation**

EPIC has predefined Error responses and Error Codes. Used those for validations.
4101 = Resource request returns no results
4100 = The resource request contained an invalid parameter

I checked only for 4101 since patient Ids are valid always.
Only Valid Responses are pushed to Kafka Streams.



**Step 3:  Send the validated responses to Kafka topics.**

#####Input Streams

* hemoglobin-epic =>  Stream for blood Hemoglobin related Data
* Medication-order-epic => Stream for Active Medication Order related Data
* cholesterol-epic =>  Stream for blood cholesterol related Data
* glucose-epic  => Stream for blood Glucose related Data
* bloodpotasium-epic-alert => Stream for blood potassium related Data



**Step 4:  SP retrieves records and generate alerts**

Create and Deploy Business Rules using below Templates.

#####SP Templates Involve


| Template Name|Task|
| ------------- | ------------- |
| Analyze Observation Reports  | Analyze Observation EMR for Abnormalities.  |
| Sending ABNORMAL Report Alerts  | Push Generated Abnormal Observation Alerts to Output Kafka streams    |
|Analyzing Medication Orders | Analyze Active Medication Orders from EMRs. |
|Sending Active Medication Order Alerts|Push Generated Active Medication Orders to Output Kafka Streams.(medication-order-epic-alert)|


**Step 5 : Publish processed alerts to Kafka Topics.**

#####Output Kafka Streams

* bloodhemoglobin-epic-alert   =>  Stream for blood Hemoglobin related alerts
* medication-order-epic-alert  => Stream for Active Medication Order related alerts
* bloodglucose-epic-alert    => Stream for blood Glucose related alerts
* bloodpotasium-epic-alert  => Stream for blood potassium related alerts
* Bloodcholesterol-epic-alert  =>  Stream for blood cholesterol related alerts

**Step 6 : WSO2 EI subscribed Output Kafka Streams and Enriches Alerts before storing it in the Database.**

Since SP generates simple specific Alerts, enrichment is necessary. Just contain relevant data only. Report type, Values,Sender Email , Patient Id etc.

After Enrichment It adds additional data to the alert before saving it on the DB.

Additional Data : Fetched from EPIC (eg: Patient Contact Info. / Practitioner Info )

Call Ex. APIs to fetch data 
* https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/Patient/{ID} 
* https://open-ic.epic.com/FHIR/api/FHIR/DSTU2/Practitioner/{ID}

Checks report Id / medicationOrderIds  existence  in the DB before inserting. (Overcome from Data Redundancy Issues) - DiagnosticReport and MedicationOrder Tables will be affected.



**Step 7 : Stored Alerts are  exposed by EI Data Services.**
Alert data are exposed as RESTful APIs. These are not recommended to be used as public APIs. Just for the backend services for APIM.

**Step 8 : EPIC Healthcare Alert APIs are Exposed via WSO2 APIM**
3rd Party Consumers can use these Alerts for developing their own Healthcare Alert systems.

####APIs Providing

#####Diagnostic Alert Related APIs (Potensial consumers = Patients / Practitioners )

* [GET]/DiagnosticAlertDataService/allreports
    * Retrieves All the diagnostic alerts
* [GET]/DiagnosticAlertDataService/reports/patient/{patientId}
    * Retrieve all the Diagnostic Alert reports corresponding to specific patient given by patientId
* [GET]/DiagnosticAlertDataService/reports/bloodglucose/patient/{patientId}
    * Retrieve all the Diagnostic Alert reports regarding blood glucose corresponding to specific patient given by patientId
* [GET]/DiagnosticAlertDataService/reports/bloodpotasium/patient/{patientId}
    * Retrieve all the Diagnostic Alert reports regarding blood potassium corresponding to specific patient given by patientId
* [GET]/DiagnosticAlertDataService/reports/bloodhemoglobin/patient/{patientId}
    * Retrieve all the Diagnostic Alert reports regarding blood hemoglobin corresponding to specific patient given by patientId
* [GET]/DiagnosticAlertDataService/reports/bloodcholesterol/patient/{patientId}
    * Retrieve all the Diagnostic Alert reports regarding blood cholesterol corresponding to specific patient given by patientId
* [GET]/DiagnosticAlertDataService/reports/patient/{patientId}/{date}
    * Retrieves all the diagnostic reports corresponding to specific patient with in a date

#####Medication Order Related APIs (Potensial consumers = Pharmacists / Practitioners )

* [GET]/MedicationOrderDataService/allmedicationorders
    * Retrieves all the active medication orders
* [GET]/MedicationOrderDataService/medicationOrders/patient/{patientId}
    * Retrieve all the Medication Reports corresponding to a specific patient given by patientId

#####Accessing Subscribed Patients (Potensial consumers = Practitioners / Hospital admin)

* [POST]/RDBMSDataService/patient
    * Adding Patients who wants to be monitored to DB
* [GET]/RDBMSDataService/allpatients
    * Retrieves all monitoring patients
* [GET]/RDBMSDataService/allSelectedEpicPatients
    * Retrieves all Monitoring Epic Patients    
    
    
Click [Here]() for the Installation Guide    