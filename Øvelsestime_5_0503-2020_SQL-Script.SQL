CREATE DATABASE exercise_5;

--Create employee table
BEGIN;
CREATE TABLE Employee(
    username varchar(20) PRIMARY KEY,
    password varchar(20) UNIQUE NOT NULL,
    Email varchar(20) UNIQUE NOT NULL,
    Number_of_colleagues int
);
COMMIT;

--insert into Employee table
BEGIN;
INSERT INTO Employee(username,password,Email)
VALUES ('Kenneth','12345','Kenneth@gmail.com');
INSERT INTO Employee(username,password,Email)
VALUES ('Kenneth2','123456','Kenneth2@gmail.com');
INSERT INTO Employee(username,password,Email)
VALUES ('Kenneth3','123457','Kenneth3@gmail.com');
COMMIT;

SELECT * from Employee;

--Create Department table
BEGIN;
CREATE TABLE Department(
	Department_id serial PRIMARY KEY,
    Department_name varchar(20),
    Number_of_members int
);
COMMIT;
drop table department;

--Insert into Department table
BEGIN;
INSERT INTO Department(Department_name)
VALUES('SDU');
COMMIT;


--Create relational table
CREATE TABLE Department_members(
    id Serial PRIMARY KEY,
    Employee_name varchar references Employee (username),
    Department_id int references Department(Department_id)
)

insert into Department_members(Employee_name,department_id)
values('Kenneth',1);
--index by email in Employee
BEGIN;
CREATE UNIQUE INDEX ON Employee(email);
COMMIT;
select*from Department_members;


--Create Procedure
CREATE oR REPLACE PRoCEDURE Update_department_size(Department_number INTEGER)
As $$
DECLARE
number_of_department_members integer := 0;
BEGIN
SELECT COUNT(*) INTO number_of_department_members
FROM Department_members WHERE department_id = department_number;

UPDATE department SET number_of_members = number_of_department_members
WHERE department_id = department_number;

END; $$

LANgUAgE plpgsql;


Select * from department;


--create trigger
CREATE OR REPLACE FUNCTION Update_alL_department_sizes_trigger()
RETURNS TRIGGER
as $$
BEGIN
CALL Update_department_size(1);
Return NEW;
END;$$
LANGUAGE Plpgsql;




BEGIN;

CREATE TRIGGER update_number_of_members_trigger
AFTER INSERT oR DELETE oN department_members
EXECUTE PROCEDURE update_alL_department_sizes_trigger();

COMMIT;