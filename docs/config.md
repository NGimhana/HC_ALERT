## Installation Guide

#### Prerequisites
 
* WSO2 EI 6.3.0
* WSO2 APIM 2.5.0
* WSO2 SP 4.2.0
* Apache Kafka Configuration - Recommends: Kafka_2.11-2.0.0
* MySQL configuration

#### Initial Setup

1. Follow Apache Kafka Quick start Guide for Kafka configuration. https://kafka.apache.org/quickstart

2. Create Below Stream topics. 
>bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic  <Topic Name>

##### Input Streams
* hemoglobin-epic
* Medication-order-epic
* cholesterol-epic
* glucose-epic
* potasium-in-blood-epic

##### Output  Streams
* bloodhemoglobin-epic-alert
* medication-order-epic-alert
* bloodglucose-epic-alert
* bloodpotasium-epic-alert
* Bloodcholesterol-epic-alert

3 . Configure EI for Kafka Operations
Kafka Transport Configuration 
https://docs.wso2.com/display/ESBCONNECTORS/Configuring+the+Kafka+Operations

Kafka Inbound Endpoint Configuration
https://docs.wso2.com/display/ESBCONNECTORS/Configuring+the+Kafka+Inbound+Operation

4 . Deploy Below CAPPs to EI.

First Clone total project. Then Build AlertEnricher , DatabasePoll projects.
https://docs.wso2.com/display/ESB481/Creating+and+Deploying+a+Carbon+Application

* DatabasePollCompositeApplication_1.0.0.car
* AlertEnricherCompositeApplication_1.0.0.car

5 . Copy Below .dbs files to 
><EI_HOME>/repository/deployment/server/dataservices.

Can be find under DataServices directory.
* DiagnosticAlertDataService.dbs
* MedicationOrderDataService.dbs
* RDBMSDataService.dbs

6 . Change Offset to 3 in EI carbon.xml 
 >	<EI_HOME>/conf/carbon.xml => <Offset>3</Offset>

7 . Deploy All the provided Siddhi Template files in SP

> <SP_HOME>/wso2/dashboard/resources/businessRules/templates

Add below UUIDs  in the <SP_HOME>/conf/dashboard/deployment.yaml file under wso2.business.rules.manager namespace as shown below.

**UUIDs**  
* analyzing-observation-reports/sending-abnormal-report-alerts
* analyzing-medication-orders/sending-active-medication-order-alerts  

8 . Deploy below xml files to APIM
 * admin--EpicHealthcareAlert_v1.0.0.xml
> <APIM_HOME>/repository/deployment/server/synapse-configs/default/api

* EpicHealthcareAlert--v1.0.0_APIproductionEndpoint.xml
* EpicHealthcareAlert--v1.0.0_APIsandboxEndpoint.xml

><APIM_HOME>/repository/deployment/server/synapse-configs/default/endpoints

9 .  Change Offset to 10 in APIM carbon.xml 
>  <EI_HOME>/repository/conf/carbon.xml => <Offset>10</Offset>

10 . Create below DB and Tables in MYSQL 

Use provided AlertDb.sql under Database SQL directory

* DB : EPIC_HC_ALERT_DB
* Tables : Patient , SubscribedPatient ,DiagnosticReport , MedicationOrder,Practitioner

#### Testing

Note : Current Implementation only supports EPIC systems only.

EPIC SandBox Patients



| PatientId|PatientName|
| ------------- | ------------- |
| Tbt3KuCY0B5PSrJvCu2j-PlK.aiHsu2xUjUM8bWpetXoB | Jason Argonaut   |
| Ta1lSLg3glOZyQI.K3L08iF1-Tlb0E3TXC2L2CsyGMScB | Jason Argonaut|
| TUKRxL29bxE9lyAcdTIyrWC6Ln5gZ-z7CLr2r-2SY964B| Jessica Argonaut   |
|TJ0QiyZ6YNFjcofUWBjUzxfqxnmDX0tC036gBbh-cLwMB | Emily Williams|
|TwncfOQytqCYtmJKvdpDOSU7U1upj6s9crg-PFHQgSO0B|Emily Williams|
|Tt.ozkoEh2-Kc6KfzsnFFLb-bD-FGZJk6gCno4QlSN7oB|Emily Williams|


1. Insert one or more above Patient IDs to Employees Table.
Can Use either Dashboard or simple SQL insert query.

2. Start Zookeeper and Kafka Brokers
>bin/zookeeper-server-start.sh config/zookeeper.properties

>bin/kafka-server-start.sh config/server.properties
 
3 .Start EI  <EI_HOME>sh bin/integrator.sh
 
Then Select a Sequence in EI console and Edit it. 
Set  Count to (-1) for execute infinitely.  Set Interval also.

![EI_Tasks_Screenshot](https://raw.githubusercontent.com/NGimhana/HC_ALERT/master/docs/Guideline%20screenshots/scheduledTasks.png)

![EI_Interval_Screenshot](https://raw.githubusercontent.com/NGimhana/HC_ALERT/master/docs/Guideline%20screenshots/scheduledTaskInterval.png)

4 . Start SP Worker and Dashboard 
> <SP_HOME>sh bin/worker.sh  
> <SP_HOME>sh bin/dashboard.sh
 
Create Business Rules for Each Observation Type using the EPIC Healthcare Alert Template.

Use Input Streams mentioned under Initial Setup section for Input Kafka Stream

Make sure to deploy Both Analyze App and Alert app.

Eg: DiagnosticReportApp and DiagnosticAlertSiddhiApp

Follow [WSO2 SP Templating](https://docs.wso2.com/display/SP420/Managing+Business+Rules+via+Templates) as a Tutorial.

5 . Start APIM 
> <APIM_HOME>sh bin/wso2server.sh

Check results with APIM swagger of EpicHealthcareAlert API

Follow [WSO2 API Quick Start Guide](https://docs.wso2.com/display/AM260/Quick+Start+Guide) as a Tutorial for WSO2 APIM and usage of APIs
