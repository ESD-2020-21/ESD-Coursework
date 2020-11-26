

create table users(
	UserName varchar(20) primary key,
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
    SlotDate date,
    SlotTime time,
    EmployeeID int references employee(EmployeeID),
    PatientID int references patients(PatientID)
);

INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('meaydin', 'aydinme', 'doctor');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('eaydin', '12345me', 'nurse');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('caidan', '5432@10', 'client');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('princehassan', 'prince_passwd', 'client');
INSERT INTO USERS (UserName, Password, "ROLE") VALUES ('admin', 'admin_passwd', 'admin');

INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, UserName) VALUES ('Mehmet Aydin', 'Mehmets Address, London, NW4 0BH', 'meaydin');
INSERT INTO EMPLOYEE (EmployeeName, EmployeeAddress, UserName) VALUES ('Emin Aydin', 'Emiin''s Address, Bristol, BS16', 'eaydin');

INSERT INTO Patients (PatientName, PatientAddress, PatientType, UserName) VALUES ('Charly Aidan', '14 King Street, Aberdeen, AB24 1BR', 'NHS', 'caidan');
INSERT INTO Patients (PatientName, PatientAddress, PatientType, UserName) VALUES ('Prince Hassan', 'Non-UK street, Non-UK Town, Non_UK', 'private', 'princehassan');
