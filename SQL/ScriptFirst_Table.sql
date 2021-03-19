CREATE DATABASE [BookingClinic]
GO
USE [BookingClinic]
GO
--------------------- [dbo].[User] TABLE ---------------------------------
CREATE TABLE [dbo].[User] (
	Id			UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Username	NVARCHAR(64) NOT NULL,
	Fullname	NVARCHAR(255) NOT NULL,
	Email		NVARCHAR(255) NOT NULL,
	Password	NVARCHAR(255) NOT NULL,
	Gender		INT NULL,
	Mobile		INT NULL,
	Birthday	DATETIME2,
	Age			INT,
	Address		NVARCHAR(MAX) NULL,
	Facebook    NVARCHAR(255) NULL,
	Linkedin    NVARCHAR(255) NULL,
    Is_Active   BIT,
	Code        INT,
	Bad_Point   INT,
	Created_At  DATETIME2 , --DEFAULT GETDATE(), CAN ADD DEFAULT TO CREATE DATA WHEN WE CREATE ANY RECORD
	Update_At   DATETIME2,
	Created_By  UNIQUEIDENTIFIER NOT NULL,
	Deleted_By  UNIQUEIDENTIFIER NOT NULL,
	Updated_By  UNIQUEIDENTIFIER NOT NULL
)

--------------------- [dbo].[Role] TABLE ---------------------------------
CREATE TABLE [dbo].[Role] (
	Id			UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Name        NVARCHAR(255) NOT NULL,
	Is_Active   BIT,
	Created_At  DATETIME2,
	Update_At   DATETIME2,
	Created_By  UNIQUEIDENTIFIER NOT NULL,
	Deleted_By  UNIQUEIDENTIFIER NOT NULL,
	Updated_By  UNIQUEIDENTIFIER NOT NULL
)

--------------------- [dbo].[User_Role] TABLE ------------------------------
CREATE TABLE [dbo].[User_Role] (
    Id         UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Id_User    UNIQUEIDENTIFIER NOT NULL,
	Id_Role    UNIQUEIDENTIFIER NOT NULL,
	Is_Active  BIT,
	Created_At DATETIME2,
	Updated_At DATETIME2,
	Created_By UNIQUEIDENTIFIER NOT NULL,
	Deleted_By UNIQUEIDENTIFIER NOT NULL,
	Updated_By UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT PK_User_Role_User FOREIGN KEY (Id_User) REFERENCES [dbo].[User](Id), -- ADD CONSTRAINT PK_User_Role_User FOR FOREIGN KEY
	--FOREIGN KEY (Id_User) REFERENCES [dbo].[User](Id), -------  WAY 2 TO CREATE FOREIGN KEY
	CONSTRAINT PK_User_Role_Role FOREIGN KEY (Id_Role) REFERENCES [dbo].[Role] (Id), 
	--FOREIGN KEY (Id_Role) REFERENCES [dbo].[Role] (Id)
)
----------------------- WAY 3 TO CREATE FOREIGN KEY ----------------------------------
--ALTER TABLE  [dbo].[User_Role]
--ADD CONSTRAINT PK_User_Role_User FOREIGN KEY (Id_User) REFERENCES [dbo].[User](Id);

--ALTER TABLE [dbo].[User_Role]
--ADD CONSTRAINT PK_User_Role_Role FOREIGN KEY (Id_Role) REFERENCES  [dbo].[Role] (Id);
--------------------- WAY TO DROP CONSTRAINT FOR FOREIGN KEY -------------------------
-- ALTER TABLE [dbo].[User_Role]
-- DROP CONSTRAINT PK_User_Role_Role
--------------------- [dbo].[Degree] TABLE ---------------------------------
CREATE TABLE [dbo].[Degree] (
	Id			UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Name        NVARCHAR(255) NOT NULL,
	Is_Active   BIT,
	Created_At  DATETIME2,
	Update_At   DATETIME2,
	Created_By  UNIQUEIDENTIFIER NOT NULL,
	Deleted_By  UNIQUEIDENTIFIER NOT NULL,
	Updated_By  UNIQUEIDENTIFIER NOT NULL
)
--------------------- [dbo].[User_Degree] TABLE -----------------------------
CREATE TABLE [dbo].[User_Degree] (
    Id         UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Id_User    UNIQUEIDENTIFIER NOT NULL,
	Id_Degree  UNIQUEIDENTIFIER NOT NULL,
	Is_Active  BIT,
	Created_At DATETIME2,
	Updated_At DATETIME2,
	Created_By UNIQUEIDENTIFIER NOT NULL,
	Deleted_By UNIQUEIDENTIFIER NOT NULL,
	Updated_By UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT PK_User_Degree_User FOREIGN KEY (Id_User) REFERENCES [dbo].[User](Id),
	CONSTRAINT PK_User_Degree_Degree FOREIGN KEY (Id_Degree) REFERENCES [dbo].[Degree](Id)
)

--------------------- [dbo].[Faculty] TABLE ---------------------------------
CREATE TABLE [dbo].[Faculty] (
	Id			UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Name        NVARCHAR(255) NOT NULL,
	Is_Active   BIT,
	Created_At  DATETIME2,
	Update_At   DATETIME2,
	Created_By  UNIQUEIDENTIFIER NOT NULL,
	Deleted_By  UNIQUEIDENTIFIER NOT NULL,
	Updated_By  UNIQUEIDENTIFIER NOT NULL
)
--------------------- [dbo].[User_Faculty] TABLE -------------------------------
CREATE TABLE [dbo].[User_Faculty] (
    Id         UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Id_User    UNIQUEIDENTIFIER NOT NULL,
	Id_Faculty UNIQUEIDENTIFIER NOT NULL,
	Is_Active  BIT,
	Created_At DATETIME2,
	Updated_At DATETIME2,
	Created_By UNIQUEIDENTIFIER NOT NULL,
	Deleted_By UNIQUEIDENTIFIER NOT NULL,
	Updated_By UNIQUEIDENTIFIER NOT NULL
	CONSTRAINT PK_User_Faculty_User FOREIGN KEY (Id_User) REFERENCES [dbo].[User](Id),
	CONSTRAINT PK_User_Faculty_Faculty FOREIGN KEY (Id_Faculty) REFERENCES [dbo].[Faculty](Id)
)

--------------------- [dbo].[Clinic] TABLE ---------------------------------
CREATE TABLE [dbo].[Clinic] (
	Id			UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Name        NVARCHAR(255) NOT NULL,
	Adrress     NVARCHAR(MAX) NOT NULL,
	Is_Active   BIT,
	Created_At  DATETIME2,
	Update_At   DATETIME2,
	Created_By  UNIQUEIDENTIFIER NOT NULL,
	Deleted_By  UNIQUEIDENTIFIER NOT NULL,
	Updated_By  UNIQUEIDENTIFIER NOT NULL
)
--------------------- [dbo].[User_Clinic] TABLE -------------------------------
CREATE TABLE [dbo].[User_Clinic] (
    Id         UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Id_User    UNIQUEIDENTIFIER NOT NULL,
	Id_Clinic  UNIQUEIDENTIFIER NOT NULL,
	Is_Active  BIT,
	Created_At DATETIME2,
	Updated_At DATETIME2,
	Created_By UNIQUEIDENTIFIER NOT NULL,
	Deleted_By UNIQUEIDENTIFIER NOT NULL,
	Updated_By UNIQUEIDENTIFIER NOT NULL
	CONSTRAINT PK_User_Clinic_User FOREIGN KEY (Id_User)  REFERENCES [dbo].[User](Id),
	CONSTRAINT PK_User_Clinic_Clinic FOREIGN KEY (Id_Clinic) REFERENCES [dbo].[Clinic](Id)
)

--------------------- [dbo].[Clinic_Faculty] TABLE -------------------------------
CREATE TABLE [dbo].[Clinic_Faculty] (
    Id         UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Id_Clinic  UNIQUEIDENTIFIER NOT NULL,
	Id_Faculty UNIQUEIDENTIFIER NOT NULL,
	Is_Active  BIT,
	Created_At DATETIME2,
	Updated_At DATETIME2,
	Created_By UNIQUEIDENTIFIER NOT NULL,
	Deleted_By UNIQUEIDENTIFIER NOT NULL,
	Updated_By UNIQUEIDENTIFIER NOT NULL
	CONSTRAINT PK_Clinic_Faculty_Clinic FOREIGN KEY (Id_Clinic) REFERENCES [dbo].[Clinic](Id),
	CONSTRAINT PK_Clinic_Faculty_Faculty FOREIGN KEY (Id_Faculty) REFERENCES [dbo].[Faculty](Id)
)
--------------------- [dbo].[Price] TABLE -------------------------------
CREATE TABLE [dbo].[Price] (
    Id          UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Id_Clinic   UNIQUEIDENTIFIER NOT NULL,
	Total_Price FLOAT,
	Description NVARCHAR(MAX) NULL,
	Is_Active	BIT,
	Created_At	DATETIME2,
	Updated_At	DATETIME2,
	Created_By	UNIQUEIDENTIFIER NOT NULL,
	Deleted_By	UNIQUEIDENTIFIER NOT NULL,
	Updated_By	UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT  PK_Price_Clinic FOREIGN KEY (Id_Clinic) REFERENCES [dbo].[Clinic](Id),
)
--------------------- [dbo].[Booking] TABLE -------------------------------
CREATE TABLE [dbo].[Booking](
	Id			         UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Address		         NVARCHAR(MAX) NULL,
	Birthday_Year		 DATETIME2,
	Date_Booking		 DATETIME2,
	Email				 NVARCHAR(255) NOT NULL,
	Is_Exit				 BIT,
	Name_Patient		 NVARCHAR(255) NOT NULL,
	Name_Person_BooKing  NVARCHAR(255) NOT NULL,
	Number_Phone         NVARCHAR(20) NOT NULL,
	Pathology            NVARCHAR(MAX) NULL,
	Time_BooKing         DATETIME2,
	Id_Clinic            UNIQUEIDENTIFIER NOT NULL,
	Id_User              UNIQUEIDENTIFIER NOT NULL,
	Id_Expert            UNIQUEIDENTIFIER NOT NULL,
	Is_Active			 BIT,
	Created_At			 DATETIME2,
	Updated_At			 DATETIME2,
	Created_By			 UNIQUEIDENTIFIER NOT NULL,
	Deleted_By			 UNIQUEIDENTIFIER NOT NULL,
	Updated_By			 UNIQUEIDENTIFIER NOT NULL
	CONSTRAINT PK_Booking_Clinic FOREIGN KEY (Id_Clinic) REFERENCES [dbo].[Clinic](Id),
	CONSTRAINT PK_Booking_User   FOREIGN KEY (Id_User)   REFERENCES [dbo].[User](Id),
	CONSTRAINT PK_Booking_Expert FOREIGN KEY (Id_Expert) REFERENCES [dbo].[User](Id)
)
--------------------- [dbo].[Rate] TABLE -------------------------------
CREATE TABLE [dbo].[Rate] (
    Id          UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    Number_Star INT,
	Id_Clinic   UNIQUEIDENTIFIER NOT NULL,
	Id_User     UNIQUEIDENTIFIER NOT NULL,
	Id_Expert   UNIQUEIDENTIFIER NOT NULL,
	Is_Active	BIT,
	Created_At	DATETIME2,
	Updated_At	DATETIME2,
	Created_By	UNIQUEIDENTIFIER NOT NULL,
	Deleted_By	UNIQUEIDENTIFIER NOT NULL,
	Updated_By	UNIQUEIDENTIFIER NOT NULL
	CONSTRAINT  PK_Rate_Clinic FOREIGN KEY (Id_Clinic) REFERENCES [dbo].[Clinic](Id),
	CONSTRAINT  PK_Rate_User   FOREIGN KEY (Id_User)   REFERENCES [dbo].[User](Id),
	CONSTRAINT  PK_Rate_Expert FOREIGN KEY (Id_Expert) REFERENCES [dbo].[User](Id)
)
--------------------- [dbo].[Comment] TABLE -------------------------------
CREATE TABLE [dbo].[Comment] (
    Id          UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Content     NVARCHAR(MAX) NULL,
	Id_Clinic   UNIQUEIDENTIFIER NOT NULL,
	Id_User     UNIQUEIDENTIFIER NOT NULL,
	Id_Expert   UNIQUEIDENTIFIER NOT NULL,
	Is_Active	BIT,
	Created_At	DATETIME2,
	Updated_At	DATETIME2,
	Created_By	UNIQUEIDENTIFIER NOT NULL,
	Deleted_By	UNIQUEIDENTIFIER NOT NULL,
	Updated_By	UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT  PK_Comment_Clinic FOREIGN KEY (Id_Clinic) REFERENCES [dbo].[Clinic](Id),
	CONSTRAINT  PK_Comment_User   FOREIGN KEY (Id_User)   REFERENCES [dbo].[User](Id),
	CONSTRAINT  PK_Comment_Expert FOREIGN KEY (Id_Expert) REFERENCES [dbo].[User](Id)
)
--------------------- [dbo].[Post_Type] TABLE -------------------------------
CREATE TABLE [dbo].[Post_Type]  (
	Id          UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Name        NVARCHAR(512) NOT NULL,
    Is_Active	BIT,
	Created_At	DATETIME2,
	Updated_At	DATETIME2,
	Created_By	UNIQUEIDENTIFIER NOT NULL,
	Deleted_By	UNIQUEIDENTIFIER NOT NULL,
	Updated_By	UNIQUEIDENTIFIER NOT NULL
)
--------------------- [dbo].[Post] TABLE -------------------------------
CREATE TABLE [dbo].[Post] (
	Id          UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Content     NVARCHAR(MAX) NOT NULL,
	Id_Clinic   UNIQUEIDENTIFIER NOT NULL,
	Id_User     UNIQUEIDENTIFIER NOT NULL,
	Id_PostType UNIQUEIDENTIFIER NOT NULL,
	Is_Active	BIT,
	Created_At	DATETIME2,
	Updated_At	DATETIME2,
	Created_By	UNIQUEIDENTIFIER NOT NULL,
	Deleted_By	UNIQUEIDENTIFIER NOT NULL,
	Updated_By	UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT PK_Post_Clinic FOREIGN KEY (Id_Clinic) REFERENCES [dbo].[Clinic](Id),
	CONSTRAINT PK_Post_User   FOREIGN KEY (Id_User)   REFERENCES [dbo].[User](Id),
	CONSTRAINT PK_Post_Post_Type FOREIGN KEY (Id_PostType) REFERENCES [dbo].[Post_Type](Id)
)