CREATE DATABASE [ChicagoCrimesStage]
GO
USE [ChicagoCrimesStage]
GO

CREATE TABLE [FBI Code] (
    [Code] varchar(3),
    [Name] varchar(31),
    [Type] varchar(43),
    [Def] varchar(427),
    [source_id] int,
    [source_name] varchar(100),
	[create_timestamp] DATETIME NOT NULL,
	[update_timestamp] DATETIME NOT NULL
);

-- DROP TABLE [Socioeconomic]
CREATE TABLE [Socioeconomic] (
    [Community Area Number] int,
    [COMMUNITY AREA NAME] varchar(26),
    [PERCENT OF HOUSING CROWDED] real,
    [PERCENT HOUSEHOLDS BELOW POVERTY] real,
    [PERCENT AGED 16+ UNEMPLOYED] real,
    [PERCENT AGED 25+ WITHOUT HIGH SCHOOL DIPLOMA] real,
    [PERCENT AGED UNDER 18 OR OVER 64] real,
    [PER CAPITA INCOME ] int,
    [HARDSHIP INDEX] int,
    [source_id] int,
    [source_name] varchar(100),
	[create_timestamp] DATETIME NOT NULL,
	[update_timestamp] DATETIME NOT NULL
)

--DROP TABLE [Chicago Crimes];
CREATE TABLE [Chicago Crimes] (
    [ID] int,
    [Case Number] varchar(9),
    [Date] datetime,
    [Block] varchar(100),
    [IUCR] varchar(10),
    [Primary Type] varchar(100),
    [Description] varchar(100),
    [Location Description] varchar(100),
    [Arrest] bit,
    [Domestic] bit,
    [Beat] int,
    [District] real,
    [Ward] real,
    [Community Area] int,
    [FBI Code] varchar(3),
    [X Coordinate] real,
    [Y Coordinate] real,
    [Year] smallint,
    [Updated On] datetime,
    [Latitude] real,
    [Longitude] real,
    [Location] varchar(300),
    [source_id] int,
    [source_name] varchar(100),
	[create_timestamp] DATETIME NOT NULL,
	[update_timestamp] DATETIME NOT NULL
)