
drop database if exists dental_clinic;

CREATE DATABASE IF NOT EXISTS dental_clinic;
USE dental_clinic;

drop table if exists Treatment_Medicine, Medicine,Medicine_Type, Payment, 
Appointment_Treatment, Payment_Type, Appointment, Treatment, 
Treatment_Type, Patient, Doctor, Clinic;

create table Clinic ( Clinic_Id   int NOT NULL AUTO_INCREMENT,
					  Clinic_Name      VARCHAR(50),
					  Clinic_Address   VARCHAR(200),
					  Clinic_Telephone VARCHAR(20),
					  Clinic_Email     VARCHAR(200),
					  PRIMARY KEY (clinic_id));
		
		
CREATE table Doctor ( Doctor_Id   VARCHAR(10) NOT NULL,
                      Clinic_Id   int NOT NULL,
					  First_Name_Doctor  VARCHAR(50) NOT NULL,
					  Last_Name_Doctor   VARCHAR(50) NOT NULL,
					  Doctor_Address     VARCHAR(200),
					  Doctor_Telephone   VARCHAR(20),
					  Doctor_Email       VARCHAR(200),
PRIMARY KEY (Doctor_Id),
FOREIGN KEY (Clinic_Id) REFERENCES Clinic(Clinic_Id)); 
						  
						  
create table Patient ( Patient_Id int NOT NULL AUTO_INCREMENT,
					   First_Name_Patient  VARCHAR(50),
					   Last_Name_Patient   VARCHAR(50),
					   Patient_Address     VARCHAR(200),
					   Patient_Telephone   VARCHAR(20),
					   Patient_Email       VARCHAR(200),
PRIMARY KEY (patient_id));	

			
create table Treatment_Type ( Treatment_Type_Id    int NOT NULL AUTO_INCREMENT,
					          Treatment_Type_Name  VARCHAR(50),
PRIMARY KEY (Treatment_Type_Id));					   

		
create table Treatment ( Treatment_Id       int NOT NULL AUTO_INCREMENT,
					     Treatment_Type_Id  int NOT NULL,
PRIMARY KEY (Treatment_Id),
FOREIGN KEY (Treatment_Type_Id) REFERENCES Treatment_Type(Treatment_Type_Id));		

		
CREATE table Appointment (Appointment_Id  int NOT NULL AUTO_INCREMENT,
						  Doctor_Id   VARCHAR(10) NOT NULL,
						  Patient_Id  int NOT NULL,							
						  Event_Date    DATE NOT NULL, 
						  Time_Start    TIME NOT NULL,
						  Duration_Time int NOT NULL,
						  Room_Number   VARCHAR(20) NOT NULL,
						  Symptoms     VARCHAR(500) NOT NULL,
PRIMARY KEY (Appointment_Id, Event_Date, Time_Start),
FOREIGN KEY (Doctor_Id) REFERENCES Doctor(Doctor_Id),
FOREIGN KEY (Patient_Id) REFERENCES Patient(Patient_Id)); 


CREATE table Appointment_Treatment (Treatment_Id   int NOT NULL,
									Appointment_Id int NOT NULL,
									Comments       VARCHAR(200),
PRIMARY KEY (Treatment_Id, Appointment_Id),
FOREIGN KEY (Treatment_Id) REFERENCES Treatment(Treatment_Id),
FOREIGN KEY (Appointment_Id) REFERENCES Appointment(Appointment_Id)); 

		
CREATE table Payment_Type (Payment_Type_Id     int NOT NULL AUTO_INCREMENT,	
						   Payment_Description  VARCHAR(50) NOT NULL,						
PRIMARY KEY (Payment_Type_Id));				
	

			
CREATE table Payment (Payment_Receipt_Id int NOT NULL AUTO_INCREMENT,
					  Appointment_Id     int NOT NULL,
					  Payment_Type_Id    int NOT NULL,
					  Fees               DECIMAL(7,2),					  
					  Payment_Date       DATE NOT NULL,					  
PRIMARY KEY (Payment_Receipt_Id),
FOREIGN KEY (Appointment_Id) REFERENCES Appointment(Appointment_Id),
FOREIGN KEY (Payment_Type_Id) REFERENCES Payment_Type(Payment_Type_Id));  								  
				
					  
CREATE table Medicine_Type (Medicine_Type_Id    int NOT NULL AUTO_INCREMENT,
					        Medicine_Type_Name  VARCHAR(200),
					        Description         VARCHAR(500),							  
PRIMARY KEY (Medicine_Type_Id)); 	

			
CREATE table Medicine (Medicine_Id       int NOT NULL AUTO_INCREMENT,
					   Medicine_Type_Id  int NOT NULL,
					   Medicine_Name     VARCHAR(200),				  
PRIMARY KEY (Medicine_Id),
FOREIGN KEY (Medicine_Type_Id) REFERENCES Medicine_Type(Medicine_Type_Id)); 					  

						 
CREATE table Treatment_Medicine (Treatment_Id   int NOT NULL,
								 Medicine_Id int NOT NULL,
PRIMARY KEY (Treatment_Id, Medicine_Id),
FOREIGN KEY (Treatment_Id) REFERENCES Treatment(Treatment_Id),
FOREIGN KEY (Medicine_Id) REFERENCES Medicine(Medicine_Id)); 




INSERT INTO Clinic VALUES ("1", "Saint Patrick Dental Clinic", "13 Dublin road, Dundalk","353 8593 8372","spatrick.dentalclinic@gmail.com");				  
INSERT INTO Clinic VALUES ("2", "Saint Dominic Dental Clinic", "5 St Street, Dublin","353 5726 9422","sdominic.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("3", "Saint Joan  Dental Clinic", "15 Castle Road, Ardee","353 5893 3795","sjoan.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("4", "Saint Peter Detal Clinic ", "14 Oak drive, Drogheda","353 3573 9962","speter.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("5", "Saint Juan Detal Clinic", "15 Center City,Cork","353 3573 8798","sjuan.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("6", "Saint Abiel Detal Clinic  ", "6 St patrick, Galway ","353 9087 5634","sabiel.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("7", "Saint Raveena Detal Clinic ", "15 center city, Limerick","353 9868 2341","sravenna.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("8", "Saint Kosy Detal Clinic ", "19 elmwood,Cavan","353 6867 5648","skosy.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("9", "Saint Jose Detal Clinic ", "57 Martha Apartment, Dublin","353 3555 9666","sjose.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("10", "Saint Mathew Detal Clinic", "19 Oak drive, Wexfor","353 3577 9567","smathew.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("11", "Saint xyz Detal Clinic", "17 Drive, Skerry","353 3577 7777","xyz.dentalclinic@gmail.com");
INSERT INTO Clinic VALUES ("12", "Saint abc Detal Clinic", "16 Oak, Sord","353 3577 8888","abc.dentalclinic@gmail.com");
 
 
INSERT INTO Doctor VALUES ("145256", "1", "Cristobal","Colon", "14 Center City, Dundalk", "353 9876 6543","colon.cristobal@gmail.com");	
INSERT INTO Doctor VALUES ("145257", "2", "Joel","Mcaffe", "45  South West, Dublin", "353 1244 6688","mcaffe.joel@gmail.com");
INSERT INTO Doctor VALUES ("145258", "3", "Daniel","Cardenas", "27  Dundalk road, Ardee"," 353 7856 3412","cardenas.daniel@gmail.com");
INSERT INTO Doctor VALUES ("145259", "1", "Juan","Cuevas", "78 South Gate, Drogheda", "353 5690 1020","cuevas.juan@gmail.com");
INSERT INTO Doctor VALUES ("145260", "5", "Pedro","Juarez", "19 Center City, Cork","353 4768 7865","juarez.pedro@gmail.com");
INSERT INTO Doctor VALUES ("145261", "6", "Henry","Lopez", "25 South East , Galway", "353 9089 7473","lopez.henry@gmail.com");
INSERT INTO Doctor VALUES ("145262", "7", "Marvin","Fernandez", "19 Street Road, Limerick","353 9009 1010","fernandez.marvin@gmail.com");
INSERT INTO Doctor VALUES ("145263", "8", "Luis","Castro", "78 North West, Cavan ", "353 1000 5039","castro.luis@gmail.com");
INSERT INTO Doctor VALUES ("145264", "9", "Eduardo","Cardenas", "90 City Center, Dublin", "353 8375 9009","cardenas.eduardo@gmail.com");
INSERT INTO Doctor VALUES ("145265", "10", "Jose","Moreno", "45 St street, Wexfor", "353 4589 8787","moreno.jose@gmail.com");
INSERT INTO Doctor VALUES ("145266", "11", "Jose","Castillo", "43 City Center, Skerry", "353 4589 8787","Castillo.jose@gmail.com");
INSERT INTO Doctor VALUES ("145267", "12", "Manuel","Andez", "12 St street, Sord", "353 4589 8787","Andez.Manuel@gmail.com");


INSERT INTO Patient VALUES (101, "Jose ", "Mcdonald","20 Dublin road, Dundalk", "353 4523 7680","mcdonald.jose@gmail.com");
INSERT INTO Patient VALUES (102, "Maria  ", "Juarez ","40 St Street, Dublin ","353 5867 2744","juarez.maria@gmail.com");
INSERT INTO Patient VALUES (103, "Pedro  ", "Castillo"," 12 Centre Street, Ardee", "353 9090 8080","castillo.pedro@gmail.com");
INSERT INTO Patient VALUES (104, "Pablo", " Escobar","11 Elmwood, Drogheda","353 5020 7080","escobar.pablo@gmail.com");
INSERT INTO Patient VALUES (105, "Martha", "Sanchez","25 North West, Cork	", "353 7978 5656","sanchez.martha@gmail.com");
INSERT INTO Patient VALUES (106, "Luisa ", "Cabrales ","89 Center City, Galway", "353 8765 3737","cabrales.luisa@gmail.com");
INSERT INTO Patient VALUES (107, "Alejandra ", "Guzman	","109 St Street, Limerick", "353 8686 9898","guzman.alejandra@gmail.com");
INSERT INTO Patient VALUES (108, "Guadalupe", "Torrez","78 Center City, Cavan", "353 8685 8383","torrez.guadalupe@gmail.com");
INSERT INTO Patient VALUES (109, "Davide ", "Magloine","90 St Street, Dublin", "353 6889 7547","magloine.davide@gmail.com");
INSERT INTO Patient VALUES (110, "Daniel ", "Ortega","9 Center city, Wexford", "353 5656 4344","ortega.daniel@gmail.com");
insert into Patient VAlUES (111, "Anne ", "Murphy","10 Main St, Dundalk", "353 5635 6457","murphy.anne24@gmail.com");


INSERT INTO Treatment_Type VALUES (1, "Surgery");	
INSERT INTO Treatment_Type VALUES (2, "Extraction");	
INSERT INTO Treatment_Type VALUES (3, "Cleaning ");	
INSERT INTO Treatment_Type VALUES (4, "Reconstruction");
INSERT INTO Treatment_Type VALUES (5, "LED teeth Whitening");
INSERT INTO Treatment_Type VALUES (6, "Dental Implants");
INSERT INTO Treatment_Type VALUES (7, "Dental splint");
INSERT INTO Treatment_Type VALUES (8, "Orthodontic brackets");
INSERT INTO Treatment_Type VALUES (9, "Removable dentures");
INSERT INTO Treatment_Type VALUES (10, "Periodontal treatment");


INSERT INTO Treatment VALUES (200, 1);	
INSERT INTO Treatment VALUES (201, 1);	
INSERT INTO Treatment VALUES (202, 3);	
INSERT INTO Treatment VALUES (203, 4);
INSERT INTO Treatment VALUES (204, 5);
INSERT INTO Treatment VALUES (205, 6);
INSERT INTO Treatment VALUES (206, 7);
INSERT INTO Treatment VALUES (207, 8);
INSERT INTO Treatment VALUES (208, 9);
INSERT INTO Treatment VALUES (209, 10);


INSERT INTO Appointment VALUES (300,"145256",101, '2022-03-27','15:00',1 ,"A01", "Aesthetic problems");
INSERT INTO Appointment VALUES (301,"145256",102, '2022-04-13','09:00',1 ,"A02", "Pain in a tooth");	
INSERT INTO Appointment VALUES (302,"145258",103, '2022-04-20','02:00',2 ,"A03", "Tooth with caries");
INSERT INTO Appointment VALUES (303,"145259",103, '2022-04-23','03:00',3 ,"A04", "Bad breath");
INSERT INTO Appointment VALUES (304,"145260",105, '2022-04-21','10:00',1 ,"A05", "Bleeding ");
INSERT INTO Appointment VALUES (305,"145261",106, '2022-04-22','11:00',2 ,"A06", "Pain in a tooth");
INSERT INTO Appointment VALUES (306,"145262",107, '2022-04-22','16:00',1 ,"A07", "Tooth with caries");
INSERT INTO Appointment VALUES (307,"145263",108, '2022-04-23','15:00',2 ,"A08", "Bad breath");
INSERT INTO Appointment VALUES (308,"145264",109, '2022-04-25','09:30',2 ,"A09", "Bleeding ");
INSERT INTO Appointment VALUES (309,"145264",110, '2022-05-01','10:40',1 ,"A10", "Aesthetic problems");
INSERT INTO Appointment VALUES (310,"145265",111, '2022-05-02','10:40',1 ,"A11", "Aesthetic problems");


INSERT INTO Appointment_Treatment VALUES (201,300, "Irregular alignment of the denture");
INSERT INTO Appointment_Treatment VALUES (201,301, "Tooth with bites");
INSERT INTO Appointment_Treatment VALUES (202,302, "Improper dental cleaning");
INSERT INTO Appointment_Treatment VALUES (203,303, "Degraded tooth");
INSERT INTO Appointment_Treatment VALUES (204,304, "Yellow teeth");
INSERT INTO Appointment_Treatment VALUES (205,305, "Decayed teeth");
INSERT INTO Appointment_Treatment VALUES (206,306, "Misaligned teeth");
INSERT INTO Appointment_Treatment VALUES (207,307, "Misaligned teeth with gaps between them");
INSERT INTO Appointment_Treatment VALUES (208,308, "Worn teeth");
INSERT INTO Appointment_Treatment VALUES (209,309, "Rusty teeth");

	
INSERT INTO Payment_Type VALUES (1, "Cash");
INSERT INTO Payment_Type VALUES (2, "Credit Card");
INSERT INTO Payment_Type VALUES (3, "Debit Card");
INSERT INTO Payment_Type VALUES (4, "Paypal");
INSERT INTO Payment_Type VALUES (5, "Cash");
INSERT INTO Payment_Type VALUES (6, "Credit Card");
INSERT INTO Payment_Type VALUES (7, "Debit Card");
INSERT INTO Payment_Type VALUES (8, "Paypal");
INSERT INTO Payment_Type VALUES (9, "Credit Card");
INSERT INTO Payment_Type VALUES (10, "Debit Card");

	
INSERT INTO Payment VALUES (1,300,1, 100.00, '2022-04-12' );
INSERT INTO Payment VALUES (2,301, 1,  50.00 , '2022-04-13');
INSERT INTO Payment VALUES (3,302, 3,  20.00 , '2022-04-13');
INSERT INTO Payment VALUES (4,303, 4,  200.00 , '2022-04-20');
INSERT INTO Payment VALUES (5,304, 1,  100.00 , '2022-04-21');
INSERT INTO Payment VALUES (6,300, 2,  60.00 , '2022-04-22');
INSERT INTO Payment VALUES (7,306, 3,  30.00 , '2022-04-23');
INSERT INTO Payment VALUES (8,300, 7,  200.00 , '2022-04-25');
INSERT INTO Payment VALUES (9,308, 3,  100.00 , '2022-05-01');
INSERT INTO Payment VALUES (10,309, 4,  100.00 , '2022-05-02');
INSERT INTO Payment VALUES (11,309, 1,  200.00 , '2022-05-02');
INSERT INTO Payment VALUES (12,308, 2,  300.00 , '2022-05-02');
INSERT INTO Payment VALUES (13,300, 4,  500.00 , '2022-05-02');
INSERT INTO Payment VALUES (14,301, 3,  600.00 , '2022-05-02');
INSERT INTO Payment VALUES (15,304, 4,  100.00 , '2022-05-02');


INSERT INTO Medicine_Type  VALUES (1,"Anesthesia", "Prevent the pain, feeling and blood from clotting" );	
INSERT INTO Medicine_Type  VALUES (2,"Analgesic", "Prevent pain and Inhibit thrombus formation" );		
INSERT INTO Medicine_Type  VALUES (3,"Liqui-gels ", "Prevent caries" );	
INSERT INTO Medicine_Type  VALUES (4,"Anesthesia", "Anti-inflammatory drug" );
INSERT INTO Medicine_Type  VALUES (5,"Photoactivation LED", "White and perfect smile" );
INSERT INTO Medicine_Type  VALUES (6,"Antibiotics", "Pain prevention" );
INSERT INTO Medicine_Type  VALUES (7,"Dental aligner", "Fits the teeth in the jaw" );
INSERT INTO Medicine_Type  VALUES (8,"Mouthwash", "Keeps teeth clean and prevents bacteria" );
INSERT INTO Medicine_Type  VALUES (9,"Toothpaste", "Proper dental cleaning" );
INSERT INTO Medicine_Type  VALUES (10,"Tooth scaling", "Prevents infection and yellowing of the teeth" );

			
INSERT INTO Medicine  VALUES (1, 1 ,"Bupivacaine");	
INSERT INTO Medicine  VALUES (2, 1 ,"Ibuprofen");	
INSERT INTO Medicine  VALUES (3, 3 ,"Chlorhexidine varnish");	
INSERT INTO Medicine  VALUES (4, 4 ,"Diclofenac");	
INSERT INTO Medicine  VALUES (5, 5 ,"Led infrared rays");
INSERT INTO Medicine  VALUES (6, 6 ,"Ibuprofen");
INSERT INTO Medicine  VALUES (7, 7 ,"Plastic dental aligner");
INSERT INTO Medicine  VALUES (8, 8 ,"Colgate mouthwash");
INSERT INTO Medicine  VALUES (9, 9 ,"Colgate toothpaste");
INSERT INTO Medicine  VALUES (10, 10 ,"Dental drill");


INSERT INTO Treatment_Medicine  VALUES (201, 1);	
INSERT INTO Treatment_Medicine  VALUES (201, 2);						 
INSERT INTO Treatment_Medicine  VALUES (202, 3);	
INSERT INTO Treatment_Medicine  VALUES (203, 3);			 
INSERT INTO Treatment_Medicine  VALUES (204, 5);	
INSERT INTO Treatment_Medicine  VALUES (205, 6);	
INSERT INTO Treatment_Medicine  VALUES (206, 7);	
INSERT INTO Treatment_Medicine  VALUES (207, 8);	
INSERT INTO Treatment_Medicine  VALUES (208, 9);	
INSERT INTO Treatment_Medicine  VALUES (209, 10);	


/*-- QUERIES*/

/* QUERY 01 -- It shows the name of the doctor, name of the patients and the type of treatment for each patient.-----------------*/ 
/* ----------------------------------------------------------------------------------------------------------------------------- */
select d.first_name_doctor as doctor , p.first_name_patient as patient, tt.treatment_type_name as treatment
from appointment a join patient p on p.patient_Id = a.patient_Id
join doctor d on d.doctor_Id = a.doctor_Id 
join appointment_treatment ap on ap.appointment_Id = a.appointment_Id 
join treatment t on t.treatment_id = ap.treatment_id
join treatment_type tt on tt.treatment_type_id = t.treatment_type_id
/*-------------------------------------------------------------------------------------------------------------------------------*/

/* QUERY 02 ----It shows the name of the patients and their symptoms ------------------------------------------------------------*/ 
/* ----------------------------------------------------------------------------------------------------------------------------- */
select p.first_name_patient as patient, a.Symptoms
from patient p, appointment a, appointment_treatment atr
where a.Patient_Id = p.Patient_Id AND
atr.Appointment_Id = a.Appointment_Id
/*------------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 03 ----It shows at the begining the average of all payments and next the payments of the patients below of the average -*/ 
/* ----------------------------------------------------------------------------------------------------------------------------- */
(select AVG(Fees)from payment);
select p.first_name_patient as patientName, pay.Payment_Receipt_Id as ReceiptNumber, pay.fees
from patient p, appointment a, payment pay
where a.Patient_Id = p.Patient_Id AND
a.Appointment_Id = pay.Appointment_Id AND
Fees < (select AVG(Fees)from payment);
/*------------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 04 --- It shows the payments and payment description made by Pedro -----------------------------------------------------*/ 
/* ----------------------------------------------------------------------------------------------------------------------------- */
select p.first_name_patient as patient, pt.payment_description, pay.fees
from appointment a join patient p on p.patient_Id = a.patient_Id
join payment pay on pay.appointment_Id = a.appointment_Id
join payment_type pt on pt.payment_type_Id = pay.payment_type_Id 
where first_name_patient = "pedro";
/*------------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 05 --- It shows the id doctor, doctors name, clinic name and the date when they have an appointment --------------------*/ 
/* ----------------------------------------------------------------------------------------------------------------------------- */
select d.Doctor_Id, d.first_name_doctor, d.Last_Name_Doctor, c.clinic_Name , a.event_date as appointmentDate
from doctor d join clinic c on d.clinic_Id = c.clinic_Id
join appointment a on a.doctor_Id = d.doctor_Id
/*------------------------------------------------------------------------------------------------------------------------------*/



/* QUERY 06 -- It shows the numbers of doctors that every clinic has ------------------------------------------------------------*/ 
/* ----------------------------------------------------------------------------------------------------------------------------- */
select clinic_name, count(doctor.doctor_id) as total_of_doctors 
from clinic, doctor 
where doctor.clinic_id = clinic.clinic_id group by clinic_name order by total_of_doctors; 
/*------------------------------------------------------------------------------------------------------------------------------*/



/* QUERY 07 --- It shows how many patient has each doctor. ----------------------------------------------------------------------*/ 
/* ----------------------------------------------------------------------------------------------------------------------------- */

select d.First_Name_Doctor as Doctors, count(p.Patient_Id) as total_of_patients 
from doctor d join appointment a on d.doctor_Id = a.doctor_Id
join patient p on p.Patient_Id = a.Patient_Id
group by First_Name_Doctor order by total_of_patients; 

/*------------------------------------------------------------------------------------------------------------------------------*/


/*-- QUERY 08 ==> Show those doctors who has more than 1 appointment ------------------------------------------------------------*/
/*------------------------------------------------------------------------------------------------------------------------------*/
select first_name_doctor as Doctor, count(event_date) as number_of_Appointments
from doctor, appointment
where doctor.doctor_id = appointment.doctor_id 
group by first_name_doctor having count(event_date)>1;
/*------------------------------------------------------------------------------------------------------------------------------*/


/*-- QUERY 09 ==> Show doctor names, clinic name, and patient names of all appointments scheduled in the city of Dublin --------*/ 
/*-- (the city is the last word written in the address)ordered by date and time.- */-------------------------------------------*/
/* ----------------------------------------------------------------------------------------------------------------------------*/
select d.First_name_doctor, d.Last_name_doctor, c.clinic_Name, c.clinic_Address,  
p.First_name_patient, p.Last_name_patient, a.Event_Date,a.Time_Start
from clinic c, doctor d, appointment a, patient p
where d.doctor_id = a.doctor_id and a.patient_Id = p.patient_Id and c.clinic_Id = d.clinic_Id and c.clinic_Address like "%dublin" 
order by a.event_date, a.time_start;
/*------------------------------------------------------------------------------------------------------------------------------*/

/* -QUERY 10 -- show the patient_name, clinic_name and patients who has an appointment on mondays and have more than 1 hours time. -*/
/*------------------------------------------------------------------------------------------------------------------------------*/
select first_name_patient, clinic_Name, dayname(event_date), duration_time as time_Hours
from appointment a join patient p on p.patient_Id = a.patient_Id
join doctor d on d.doctor_Id = a.doctor_Id
join clinic c on c.clinic_Id = d.clinic_Id 
WHERE dayname(a.event_date) = 'Monday' and duration_time > 1;
/* -----------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 11 -- show the patient_name and clinic_name of patient who has an appointment on Sunday and pay more than 50 euros --------*/
/* -----------------------------------------------------------------------------------------------------------------------------*/
select first_name_patient as patient, clinic_Name, dayname(event_date), fees
from appointment a join patient p on p.patient_Id = a.patient_Id
join doctor d on d.doctor_Id = a.doctor_Id
join clinic c on c.clinic_Id = d.clinic_Id 
join payment pay on pay.appointment_Id = a.appointment_Id
WHERE dayname(a.event_date) = 'Sunday' and fees > 50;
  /* ----------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 12 -- Display the doctor who doesnt have any appointment and clinic name where the doctor works -------------------------*/
/* ------------------------------------------------------------------------------------------------------------------------------*/
select Doctor_Id, first_name_doctor, Last_Name_Doctor, clinic_Name
from doctor d join clinic c on d.clinic_Id = c.clinic_Id
where doctor_id NOT IN(select doctor_id from appointment)
 /* -----------------------------------------------------------------------------------------------------------------------------*/
  
  
/* QUERY 13 -- Display all the appointments for Pedro ---------------------------------------------------------------------------*/
select * from appointment 
where patient_id in (select patient_id from patient where first_name_patient = "Pedro")
 /* -----------------------------------------------------------------------------------------------------------------------------*/
  
  
/* QUERY 14 -- delete from de database two patients. (referential integrity) (Jose and Pedro) -----------------------------------*/
/* --when Jose apear only once in first query and Pedro apear with two appoinments in second query. -----------------------------*/
/* ------------------------------------------------------------------------------------------------------------------------------*/
/* -7.1 -- query using (=) when is returning only one value (Jose has only one appointment) -------------------------------------*/
 delete from appointment_treatment 
 where appointment_id = (select appointment_id from appointment 
 where patient_id in (select patient_id from patient where first_name_patient = "Jose"));
 delete from payment 
 where appointment_id = (select appointment_id from appointment 
 where patient_id in (select patient_id from patient where first_name_patient = "Jose"));
 delete from appointment where patient_id = 
(select patient_id from patient where first_name_patient = "Jose");
 delete from patient where first_name_patient = "Jose";
 
/* - 7.2 -- query using (in) when is returning more than 2 values in this case pedro has two differents appointments ------------*/
 delete from appointment_treatment 
 where appointment_id in (select appointment_id from appointment 
 where patient_id in (select patient_id from patient where first_name_patient = "pedro"));
 delete from payment 
 where appointment_id in (select appointment_id from appointment 
 where patient_id in (select patient_id from patient where first_name_patient = "pedro"));
 delete from appointment where patient_id in 
(select patient_id from patient where first_name_patient = "pedro");
 delete from patient where first_name_patient = "pedro";
 /* -----------------------------------------------------------------------------------------------------------------------------*/
  
  
/* QUERY 15 -- Display the highest feees paid from all patients. ----------------------------------------------------------------*/
select max(fees) as highest_fees from payment;
/* ------------------------------------------------------------------------------------------------------------------------------*/
  

/* QUERY 16 -- Display the highest feees paid in the moth of April --------------------------------------------------------------*/
select min(fees) as Lowest_Invoice_April
from payment pa
where monthname(pa.payment_date) = 'April'
/* ------------------------------------------------------------------------------------------------------------------------------*/

/* QUERY 17 -- Display Patients with Bleeding as a symptoms ---------------------------------------------------------------------*/
select first_name_patient, Symptoms 
from appointment a join patient p on p.patient_Id = a.patient_Id 
WHERE Symptoms='Bleeding';
/* ------------------------------------------------------------------------------------------------------------------------------*/
  
/* QUERY 18 -- Display appointment_id and fees, using alias for both and order in ascending order by fees. -----------------------*/
select appointment_Id as appointment_Number, fees as appointment_paid
from payment 
order by fees asc;  
/* ------------------------------------------------------------------------------------------------------------------------------*/
  
/* QUERY 19 -- The contact phone number for Pablo Escobar now is 353 8888 8888-------------------------------------------*/
update patient set patient_telephone = "353 8888 8888" 
where First_Name_Patient = "Pablo"; 
/* ------------------------------------------------------------------------------------------------------------------------------*/ 
  
/* QUERY 20 -- It display the number of the different medicines registered in the dental clinic ---------------------------------*/
select count(distinct medicine_name) as  number_of_medicines 
from medicine; 
/* ------------------------------------------------------------------------------------------------------------------------------*/
  
/* QUERY 21 -- It display in a new table the Lowest_Invoice, Highest_Invoice, Average_Invoice, Total_Invoice----------------------- 
from the table payment-----------------------------------------------------------------------------------------------------------*/
/* ------------------------------------------------------------------------------------------------------------------------------*/
/* - first option checking the total --------------------------------------------------------------------------------------------*/
select
min(fees) as Lowest_Invoice, 
max(fees) as Highest_Invoice, 
avg(fees) as Average_Invoice, 
sum(fees) as Total_Invoice
from payment
/* ------------------------------------------------------------------------------------------------------------------------------*/
/* -second option cheching by the date (grouping by day) ------------------------------------------------------------------------*/ 
select payment_date,
min(fees) as Lowest_Invoice, 
max(fees) as Highest_Invoice, 
avg(fees) as Average_Invoice, 
sum(fees) as Total_Invoice
from payment
group by payment_date
/* ------------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 22 -- Adding a new column in appointment table with the name discount --------------------------------------------------*/
alter table appointment add Discount int;
/* ------------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 23 -- Adding values to the column discounts in appoinments table. ------------------------------------------------------*/
update appointment set Discount = "10" where patient_Id = "101";
update appointment set Discount =  "8" where patient_Id = "102";
update appointment set Discount =  "5" where patient_Id = "103";
update appointment set Discount = "20" where patient_Id = "104";
update appointment set Discount = "30" where patient_Id = "105";
update appointment set Discount = "40" where patient_Id = "106";
update appointment set Discount = "25" where patient_Id = "107";
update appointment set Discount = "12" where patient_Id = "108";
update appointment set Discount = "15" where patient_Id = "109";
update appointment set Discount = "25" where patient_Id = "110";
update appointment set Discount = "35" where patient_Id = "111";
/* ------------------------------------------------------------------------------------------------------------------------------*/


/* QUERY 24 -- Drop the column that was created (discount) ----------------------------------------------------------------------*/
alter table appointment drop column Discount;
/* ----------------------------------------------------------------------------------------------------------------------------- */


/* QUERY 25 -- It has been decided not to have two columns of first and last name for the table of patients,---------------------*/ 
/* -------------- it was decided to create a column joining the two names of the patients. --------------------------------------*/

select  *, concat(first_name_patient, last_name_patient) AS Full_Name
FROM patient;

update patient  
set first_name_patient = replace(first_name_patient,first_name_patient, concat(first_name_patient,' ', last_name_patient));
 
alter table patient change first_name_patient Name_Patient varchar(50);

alter table patient drop column last_name_patient;

select * from patient;

/* ----------------------------------------------------------------------------------------------------------------------------- */











