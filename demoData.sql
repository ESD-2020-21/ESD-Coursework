/* TO DO:  Nothing, COMPLETE */ 

create table users(
	UserName varchar(20) not null primary key,
	Password varchar(20),
	role varchar(10)
);

create table patients(
	PatientID int not null primary key
            generated always as identity (start with 1, increment by 1), 
	PatientName varchar(50),
	PatientAddress varchar(100),
	PatientType varchar(10),
        PatientDOB varchar(20),
	UserName varchar(20) references users(UserName)
);

create table employee(
	EmployeeID int not null primary key
            generated always as identity (start with 1, increment by 1), 
	EmployeeName varchar(50),
	EmployeeAddress varchar(100),
        EmployeeDOB varchar(20),
	UserName varchar(20) references users(UserName)
);

create table operations(
    oID int not null primary key
            generated always as identity (start with 1, increment by 1), 
    EmployeeID int references employee(EmployeeID),
    PatientID int references patients(PatientID),
    OperationDate date,
    OperationTime time,
    nSlot int,
    Invoice float,
    OperationNote varchar(50)
);


create table booking_slots(
    SlotID int not null primary key
            generated always as identity (start with 1, increment by 1),
    SlotDate varchar(20),
    SlotTime varchar(20),
    requestprescription varchar(10),
    BookingNote varchar(50),
    EmployeeID int references employee(EmployeeID),
    PatientID int references patients(PatientID)
);

INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('yonis', 'yonis123', 'admin');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('drfirst', 'firstdoctor', 'doctor');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('msbest', 'best1234', 'nurse');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('robsmith', 'smithy342', 'patient');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('lizbrown', 'elizabeth', 'patient');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('hesitant1', 'jakedog123', 'patient');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('tsouth1', 'south1987', 'patient');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('abdullah', 'mahdli23', 'patient');

INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, EmployeeDOB, UserName) VALUES ('Dr James First', '23 Tomato Road, Manchester, M12 4QK' , '1990-12-23', 'drfirst');
INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, EmployeeDOB, UserName) VALUES ('Ms Linda Best', '42 Carrot Street, Leeds, L13 2AK' , '1999-05-23', 'msbest');

INSERT INTO Patients (PatientName, PatientAddress, PatientType, PatientDOB, UserName) VALUES ('Rob Smith', '14 King Street, Aberdeen, AB24 1BR', 'NHS', '1980-05-23', 'robsmith');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, PatientDOB, UserName) VALUES ('Liz Brown', 'Non-UK street, Non-UK Town, BS15 1QZ', 'private', '1958-05-13', 'lizbrown');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, PatientDOB, UserName) VALUES ('Edward Hesitant', 'Queen street, Non-UK Town, BS15 1QQ', 'private' , '1990-02-23', 'hesitant1');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, PatientDOB, UserName) VALUES ('Tom South', 'Prince street, Bristol, BS1 1AA', 'private' , '1995-05-03','tsouth1');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, PatientDOB, UserName) VALUES ('Abdullah Mahdli', 'Prince street, Bristol, BS1 1AA', 'private' , '1995-05-03','abdullah');

/* Doesnt work if you try and insert a value in a foreign key that doesnt exist in the primary key of that table.*/
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice, OperationNote ) VALUES (1,2, '2020-01-01', '10:00', 4, 67.8, 'Exercise');
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice, OperationNote ) VALUES (2,2, '2019-11-13', '14:00', 3, 60.7, 'Rehabilitation');
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice, OperationNote ) VALUES (1,1, '2020-05-04', '13:00', 10, 33.4, 'N/A');
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice, OperationNote ) VALUES (1,1, '2019-12-30', '20:00', 5, 33.4, 'Refer to specialist');

INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription, BookingNote) VALUES (1,2, '2020-01-01', '13:00', 'no' , 'Head Injury');
INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription, BookingNote) VALUES (2,4,'2019-11-13', '14:00', 'yes', 'N/A');
INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription, BookingNote) VALUES (1,3,'2020-05-04', '10:00', 'no', 'Stomach Ache');
INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription, BookingNote) VALUES (2,1,'2019-12-30', '20:00','no', 'N/A');
