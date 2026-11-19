CREATE DATABASE AI_Freelance_DB;
GO

USE AI_Freelance_DB;
GO

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    UserRole VARCHAR(20) NOT NULL CHECK (UserRole IN ('Freelancer', 'Client', 'Admin', 'Manager')),
    Phone VARCHAR(20),
    AccountStatus VARCHAR(20) DEFAULT 'Active' CHECK (AccountStatus IN ('Active', 'Suspended')),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Freelancers (
    FreelancerID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    Headline VARCHAR(150) NOT NULL,
    Bio TEXT,
    HourlyRate DECIMAL(10, 2) NOT NULL CHECK (HourlyRate > 0),
    ExperienceYears INT DEFAULT 0 CHECK (ExperienceYears >= 0),
    AverageRating DECIMAL(3, 2) DEFAULT 0.00,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL UNIQUE,
    CompanyName VARCHAR(100),
    Industry VARCHAR(100),
    Country VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE AI_Skills (
    SkillID INT IDENTITY(1,1) PRIMARY KEY,
    SkillName VARCHAR(100) NOT NULL UNIQUE,
    Category VARCHAR(50) NOT NULL
);

CREATE TABLE Freelancer_Skills (
    FreelancerID INT NOT NULL,
    SkillID INT NOT NULL,
    ProficiencyLevel VARCHAR(20) CHECK (ProficiencyLevel IN ('Beginner', 'Intermediate', 'Expert')),
    PRIMARY KEY (FreelancerID, SkillID),
    FOREIGN KEY (FreelancerID) REFERENCES Freelancers(FreelancerID) ON DELETE CASCADE,
    FOREIGN KEY (SkillID) REFERENCES AI_Skills(SkillID) ON DELETE CASCADE
);

CREATE TABLE AI_Services (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    FreelancerID INT NOT NULL,
    ServiceTitle VARCHAR(150) NOT NULL,
    Description TEXT NOT NULL,
    BasePrice DECIMAL(10, 2) NOT NULL CHECK (BasePrice > 0),
    DeliveryDays INT NOT NULL CHECK (DeliveryDays > 0),
    FOREIGN KEY (FreelancerID) REFERENCES Freelancers(FreelancerID) ON DELETE CASCADE
);

CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    ProjectTitle VARCHAR(150) NOT NULL,
    Description TEXT NOT NULL,
    Budget DECIMAL(10, 2) NOT NULL CHECK (Budget > 0),
    Deadline DATE NOT NULL,
    ProjectStatus VARCHAR(20) DEFAULT 'Open' CHECK (ProjectStatus IN ('Open', 'In Progress', 'Completed', 'Cancelled')),
    PostedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

CREATE TABLE Project_Requirements (
    ProjectID INT NOT NULL,
    SkillID INT NOT NULL,
    PRIMARY KEY (ProjectID, SkillID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE,
    FOREIGN KEY (SkillID) REFERENCES AI_Skills(SkillID)
);

CREATE TABLE Proposals (
    ProposalID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    FreelancerID INT NOT NULL,
    BidAmount DECIMAL(10, 2) NOT NULL CHECK (BidAmount > 0),
    EstimatedDays INT NOT NULL CHECK (EstimatedDays > 0),
    CoverLetter TEXT NOT NULL,
    ProposalStatus VARCHAR(20) DEFAULT 'Pending' CHECK (ProposalStatus IN ('Pending', 'Accepted', 'Rejected')),
    SubmittedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID) ON DELETE CASCADE,
    FOREIGN KEY (FreelancerID) REFERENCES Freelancers(FreelancerID)
);

CREATE TABLE Project_Assignments (
    AssignmentID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL UNIQUE,
    FreelancerID INT NOT NULL,
    ProposalID INT NOT NULL UNIQUE,
    AssignedDate DATETIME DEFAULT GETDATE(),
    CompletionDate DATETIME NULL,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (FreelancerID) REFERENCES Freelancers(FreelancerID),
    FOREIGN KEY (ProposalID) REFERENCES Proposals(ProposalID)
);

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    AssignmentID INT NOT NULL,
    AmountPaid DECIMAL(10, 2) NOT NULL CHECK (AmountPaid > 0),
    PlatformFee DECIMAL(10, 2) DEFAULT 0.00,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentStatus VARCHAR(20) DEFAULT 'Pending' CHECK (PaymentStatus IN ('Pending', 'Completed', 'Refunded')),
    PaymentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (AssignmentID) REFERENCES Project_Assignments(AssignmentID)
);

CREATE TABLE Reviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectID INT NOT NULL,
    ReviewerUserID INT NOT NULL,
    RevieweeUserID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (ReviewerUserID) REFERENCES Users(UserID),
    FOREIGN KEY (RevieweeUserID) REFERENCES Users(UserID)
);
GO
