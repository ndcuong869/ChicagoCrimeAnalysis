CREATE DATABASE [ChicagoCrimesDDS];
GO
USE [ChicagoCrimesDDS];
GO

CREATE TABLE [Dim Date]
(
	date_sk INT PRIMARY KEY,
	[sql_date] DATETIME NOT NULL,
	day_of_week INT NOT NULL,
	day_of_month INT NOT NULL,
	[month] INT NOT NULL,
	[quater] INT NOT NULL,
	[year] INT NOT NULL,
	english_month_name CHAR(15) NOT NULL,
	short_english_month_name CHAR(3) NOT NULL,
	create_timestamp DATETIME NOT NULL,
	update_timestamp DATETIME NOT NULL
);

--CREATE TABLE [Dim Month]
--(
--	date_sk INT IDENTITY(1, 1) PRIMARY KEY,
--	[month] INT NOT NULL,
--	[quater] INT NOT NULL,
--	[year] INT NOT NULL,
--	english_month_name CHAR(15) NOT NULL,
--	short_english_month_name CHAR(3) NOT NULL,
--	create_timestamp DATETIME NOT NULL,
--	update_timestamp DATETIME NOT NULL
--)

CREATE TABLE [Dim Location]
(
	location_sk INT PRIMARY KEY,
	location_name CHAR(100) NOT NULL,
	data_source_sk INT NOT NULL,
	create_timestamp DATETIME NOT NULL,
	update_timestamp DATETIME NOT NULL
);

CREATE TABLE [Dim Area]
(
	area_sk INT PRIMARY KEY,
	area_name CHAR(50) NOT NULL,
	housing_crowded FLOAT NOT NULL,
	household_below_poverty FLOAT NOT NULL,
	aged_over_16_unemployed FLOAT NOT NULL,
	aged_over_25_without_high_school FLOAT NOT NULL,
	aged_under_18_over_64 FLOAT NOT NULL,
	capita_income INT NOT NULL,
	hardship_index INT NOT NULL,
	data_source_sk INT NOT NULL,
	create_timestamp DATETIME NOT NULL,
	update_timestamp DATETIME NOT NULL
);

CREATE TABLE [Dim IUCR]
(
	iucr_sk INT PRIMARY KEY,
	iucr_type VARCHAR(20) NOT NULL,
	data_source_sk INT NOT NULL,
	create_timestamp DATETIME NOT NULL,
	update_timestamp DATETIME NOT NULL
)

--CREATE TABLE [Fact Crime]
--(
--	crime_sk INT PRIMARY KEY,
--	iucr_sk INT NOT NULL REFERENCES [Dim IUCR](iucr_sk),
--	location_sk INT NOT NULL REFERENCES [Dim Location](location_sk),
--	area_sk INT NOT NULL REFERENCES [Dim Area](area_sk),
--	date_sk INT NOT NULL REFERENCES [Dim Date](date_sk),
--	arrest INT NOT NULL,
--	domestic INT NOT NULL,
--	data_source_sk INT NOT NULL,
--	create_timestamp DATETIME NOT NULL,
--	update_timestamp DATETIME NOT NULL
--);

CREATE TABLE [Fact Crime]
(
	crime_sk INT PRIMARY KEY,
	iucr_sk INT NOT NULL REFERENCES [Dim IUCR](iucr_sk),
	location_sk INT NOT NULL REFERENCES [Dim Location](location_sk),
	area_sk INT NOT NULL REFERENCES [Dim Area](area_sk),
	date_sk INT NOT NULL REFERENCES [Dim Date](date_sk),
	arrest INT NOT NULL,
	not_arrest INT NOT NULL,
	domestic INT NOT NULL,
	not_domestic INT NOT NULL,
	domestic_arrest INT NOT NULL,
	domestic_not_arrest INT NOT NULL,
	not_domestic_arrest INT NOT NULL,
	not_domestic_not_arrest INT NOT NULL,
	create_timestamp DATETIME NOT NULL,
	update_timestamp DATETIME NOT NULL
);

