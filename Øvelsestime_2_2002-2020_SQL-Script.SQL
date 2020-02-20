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

--position table
create table Possition (
Possition_id serial primary key,
Designation varchar(20) not null,
Charges_pr_hour int not null
);
drop table Possition;

-- department table
Create table Department(
Department_id serial Primary key,
room_adress varchar (10) unique not null
);
drop table Department;

--patient table
create table patient(
Patient_id serial primary key,
Patient_number varchar (4) unique not null,
Patient_name varchar(50) not null,
Cpr_number varchar(11) unique not null,
patient_phone varchar (20) unique not null
);
drop table Patient;

--room table
Create table Rooms(
Room_id serial primary key,
Room_number varchar(3) not null,
room_type varchar (50) not null
);
drop table Rooms;

--bed table
create table Beds(
bed_id serial primary key,
bed_number varchar (3) unique not null
);
drop table beds;

--ansættelses table
Create table DoctorEmployment(
    Doctoremployement_id serial primary key,
    Doctor_id integer not null references Doctors(Doctor_id),
    Department_id integer not null references department(Department_id),
    Possition_id integer not null references position(Possition_id)
);

--indlæggelses tabel
Create table admission(
admission_id serial Primary key,
patient_number varchar(4) not null references patient (patient_number),
room_id integer references Rooms (Room_id),
bed_id integer references Beds (bed_id),
Doctor_id integer references Doctors (Doctor_id)
);
drop table Admission;