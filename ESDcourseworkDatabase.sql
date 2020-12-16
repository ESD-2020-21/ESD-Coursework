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
	UserName varchar(20) references users(UserName)
);

create table employee(
	EmployeeID int not null primary key
            generated always as identity (start with 1, increment by 1), 
	EmployeeName varchar(50),
	EmployeeAddress varchar(100),
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
    Invoice float
);


create table booking_slots(
    SlotID int not null primary key
            generated always as identity (start with 1, increment by 1),
    SlotDate varchar(20),
    SlotTime varchar(20),
    requestprescription varchar(10),
    EmployeeID int references employee(EmployeeID),
    PatientID int references patients(PatientID)
);

INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('meaydin', 'aydinme', 'doctor');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('eaydin', '12345me', 'nurse');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('caidan', '5432@10', 'patient');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('princehassan', 'prince_passwd', 'patient');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('yonis', 'yonis123', 'admin');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('jonas', 'jonas123', 'nurse');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('mohammed', 'mohammed123', 'patient');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('james', 'james123', 'doctor');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('chris', 'chris123', 'patient');


INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, UserName) VALUES ('Mehmet Aydin', 'Mehmets Address, London, NW4 0BH', 'meaydin');
INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, UserName) VALUES ('Emin Aydin', 'Emiin''s Address, Bristol, BS16', 'eaydin');
INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, UserName) VALUES ('Jonas Waters', 'Jonas'' Address, Bristol, BS14', 'jonas');
INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, UserName) VALUES ('James Selch', 'James'' Address, South Gloustershire, BS35', 'james');

INSERT INTO Patients (PatientName, PatientAddress, PatientType, UserName) VALUES ('Charly Aidan', '14 King Street, Aberdeen, AB24 1BR', 'NHS','caidan');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, UserName) VALUES ('Prince Hassan', 'Non-UK street, Non-UK Town, BS15 1QZ', 'private','princehassan');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, UserName) VALUES ('Mohammed Hassan', 'Queen street, Non-UK Town, BS15 1QQ', 'private','mohammed');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, UserName) VALUES ('Chris Waters', 'Prince street, Bristol, BS1 1AA', 'private','chris');


/* Doesnt work if you try and insert a value in a foreign key that doesnt exist in the primary key of that table.*/
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice ) VALUES (1,2, '2020-01-01', '10:00', 4, 67.8);
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice ) VALUES (2,2, '2019-11-13', '14:00', 3, 60.7);
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice ) VALUES (1,1, '2020-05-04', '13:00', 10, 33.4);
INSERT INTO operations (EmployeeID, PatientID, OperationDate, OperationTime, nSlot, Invoice ) VALUES (1,1, '2019-12-30', '20:00', 5, 33.4);

INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription) VALUES (1,2, '2020-01-01', '13:00', 'no');
INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription) VALUES (2,4,'2019-11-13', '14:00', 'yes');
INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription) VALUES (4,3,'2020-05-04', '10:00', 'no');
INSERT INTO booking_slots (EmployeeID, PatientID, SlotDate, SlotTime,requestprescription) VALUES (3,1,'2019-12-30', '20:00','no');

