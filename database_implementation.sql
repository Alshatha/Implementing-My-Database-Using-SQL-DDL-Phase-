-- Step 1: Create Department without FK to Employee
CREATE TABLE Department (
    DNUM INT PRIMARY KEY,
    HireDate DATE NOT NULL,
    DName VARCHAR(100) NOT NULL UNIQUE,
    SSN INT -- Will be FK to Employee later
);

-- Step 2: Create Employee (with FK to Department)
CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    BirthDate DATE NOT NULL,
    super_ID INT,
    DNUM INT,
    FOREIGN KEY (super_ID) REFERENCES Employee(SSN),
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

-- Step 3: Now add the FK from Department to Employee
ALTER TABLE Department
ADD CONSTRAINT FK_Department_Employee FOREIGN KEY (SSN) REFERENCES Employee(SSN);

-- Step 4: Create Locations
CREATE TABLE Locations (
    Locations VARCHAR(100) PRIMARY KEY,
    DNUM INT NOT NULL,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

-- Step 5: Create Project
CREATE TABLE Project (
    PNumber INT PRIMARY KEY,
    Location VARCHAR(100),
    City VARCHAR(100),
    PName VARCHAR(100) NOT NULL,
    DNUM INT NOT NULL,
    FOREIGN KEY (DNUM) REFERENCES Department(DNUM)
);

-- Step 6: Create Works_on
CREATE TABLE Works_on (
    WorkingHours DECIMAL(4,2) NOT NULL,
    PNumber INT NOT NULL,
    SSN INT NOT NULL,
    PRIMARY KEY (PNumber, SSN),
    FOREIGN KEY (PNumber) REFERENCES Project(PNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);

-- Step 7: Create Dependent
CREATE TABLE Dependent (
    DependentName VARCHAR(50) PRIMARY KEY,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    BirthDate DATE NOT NULL,
    SSN INT NOT NULL,
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);
