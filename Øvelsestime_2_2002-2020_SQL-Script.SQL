-- Create the Excersice DB
Create Database Excersice_20022020;

-- Create Table Doctor
Create table Doctors(
Doctor_id serial primary key,
Doctor_number varchar(5) unique not null,
Doctor_name varchar(50) not null,
Phone varchar(20) unique not null
);
drop table Doctors;

--inserts
INSERT INTO Doctors(Doctor_number,Doctor_name,Phone)
VALUES ('D1','Dr. Peterson','12341234');
INSERT INTO Doctors(Doctor_number,Doctor_name,Phone)
VALUES ('D2','Dr. Jensen','24352435');
INSERT INTO Doctors(Doctor_number,Doctor_name,Phone)
VALUES ('D4','Dr. Poetch','34563456');
INSERT INTO Doctors(Doctor_number,Doctor_name,Phone)
VALUES ('D5','Dr. Neurenheim','45674567');

--position table
create table Possition (
Possition_id serial primary key,
Designation varchar(20) not null,
Charges_pr_hour int not null
);
drop table Possition;

--Inserts Possition
INSERT INTO Possition(Designation,Charges_pr_hour)
VALUES('Professor',5000);
INSERT INTO Possition(Designation,Charges_pr_hour)
VALUES('Assistant Professor',3000);

-- department table
Create table Department(
Department_id serial Primary key,
room_adress varchar (10) unique not null,
Department_name varchar(50) not null
);
drop table Department;

--Inserts Department
INSERT INTO Department(room_adress,Department_name)
VALUES('U45','Neurology');
INSERT INTO Department(room_adress,Department_name)
VALUES('U32','Orthopedic');
INSERT INTO Department(room_adress,Department_name)
VALUES('U186','ENT/Neurology');
INSERT INTO Department(room_adress,Department_name)
VALUES('U150','Skin/Orthepoedic');

--patient table
create table patient(
Patient_id serial primary key,
Patient_number varchar (4) unique not null,
Patient_name varchar(50) not null,
Cpr_number varchar(11) unique not null,
patient_phone varchar (20) unique not null
);
drop table Patient;

--inserts Patients
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p1','Jan', '190582-1113','98769876');
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p4','Ole','051165-9863','65436543');
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p5','Peter','300175-2359','87658765');
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p7','Jens','041298-1257','76547654');
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p9','Anna','260792-1050','54325432');
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p10','Dennis','150893-1151','43214321');
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p12','Ahmed','010211-7853','32103210');
INSERT INTO patient(Patient_number,Patient_name,Cpr_number,patient_phone)
VALUES('p13','Annika','051285-8072','21092109');

--room table
Create table Rooms(
Room_id serial primary key,
Room_number varchar(3) unique not null,
room_type varchar (50) not null
);
drop table Rooms;

-- Inserts Rooms
INSERT INTO Rooms(Room_number,room_type)
VALUES('R2','Normal');
INSERT INTO Rooms(Room_number,room_type)
VALUES('R4','Two Bed');
INSERT INTO Rooms(Room_number,room_type)
VALUES('R5','Special');
INSERT INTO Rooms(Room_number,room_type)
VALUES('R6','Special');

--bed table
create table Beds(
bed_id serial primary key,
bed_number varchar (3) unique not null
);
drop table beds;

-- Inserts Beds
INSERT INTO Beds(bed_number)
VALUES('B1');
INSERT INTO Beds(bed_number)
VALUES('B5');
INSERT INTO Beds(bed_number)
VALUES('B7');
INSERT INTO Beds(bed_number)
VALUES('B8');
INSERT INTO Beds(bed_number)
VALUES('B9');

--Employment table
Create table DoctorEmployment(
Doctoremployment_id serial primary key,
Doctor_id integer not null references Doctors(Doctor_id),
Department_id integer not null references department(Department_id),
Possition_id integer not null references possition(Possition_id)
);

--Inserts employment
INSERT INTO DoctorEmployment(Doctor_id,Department_id,Possition_id)
VALUES(1,1,1);
INSERT INTO DoctorEmployment(Doctor_id,Department_id,Possition_id)
VALUES(2,2,1);
INSERT INTO DoctorEmployment(Doctor_id,Department_id,Possition_id)
VALUES(3,3,2);
INSERT INTO DoctorEmployment(Doctor_id,Department_id,Possition_id)
VALUES(4,4,2);

--Admission tabel
Create table admission(
admission_id serial Primary key,
Patient_id integer not null references patient (patient_id),
room_id integer references Rooms (Room_id),
bed_id integer references Beds (bed_id),
Doctor_id integer references Doctors (Doctor_id)
);
drop table Admission;

--Inserts Admission
INSERT INTO Admission(Patient_id,room_id,bed_id,Doctor_id)
Values(1,1,1,1);
INSERT INTO Admission(Patient_id,room_id,bed_id,Doctor_id)
Values(1,3,4,3);
INSERT INTO Admission(Patient_id,room_id,bed_id,Doctor_id)
Values(2,1,1,2);
INSERT INTO Admission(Patient_id,room_id,bed_id,Doctor_id)
Values(3,1,1,1);
INSERT INTO Admission(Patient_id,doctor_id)
Values(4,1);
INSERT INTO Admission(Patient_id,room_id,bed_id,Doctor_id)
Values(4,2,2,2);
INSERT INTO Admission(Patient_id,room_id,bed_id,Doctor_id)
Values(5,2,3,2);
INSERT INTO Admission(Patient_id,Doctor_id)
Values(6,3);
INSERT INTO Admission(Patient_id,Doctor_id)
Values(7,4);
INSERT INTO Admission(Patient_id,room_id,bed_id,Doctor_id)
Values(8,4,4,4);




--queries
Select * from beds;
select * from patient;
select * from rooms;
select * from Doctors;
select * from admission;

--view

create view