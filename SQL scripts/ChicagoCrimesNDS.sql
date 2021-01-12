CREATE DATABASE ChicagoCrimesNDS;
GO
USE ChicagoCrimesNDS;
GO
CREATE TABLE [Data source](
	data_source_sk INT PRIMARY KEY,
	data_source_name VARCHAR(100) NOT NULL,
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
);

CREATE TABLE [FBI Type NDS](
	fbi_type_sk INT IDENTITY(1, 1) PRIMARY KEY,
	fbi_type_name CHAR(50) NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
)

CREATE TABLE [FBI NDS](
	fbi_code_sk INT IDENTITY(1, 1) PRIMARY KEY,
	fbi_code_nk CHAR(3) NOT NULL,
	fbi_code_name CHAR(50) NOT NULL,
	fbi_code_type INT NOT NULL REFERENCES [FBI Type NDS](fbi_type_sk),
	fbi_code_definition CHAR(500) NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
);

CREATE TABLE [Primary category NDS](
	primary_category_sk INT IDENTITY(1, 1) PRIMARY KEY,
	primary_category_name VARCHAR(100) NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
);

CREATE TABLE [Secondary category NDS](
	secondary_category_sk INT IDENTITY(1, 1) PRIMARY KEY,
	secondary_category_name VARCHAR(100) NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
);

CREATE TABLE [IUCR NDS](
	iucr_sk INT IDENTITY(1, 1) PRIMARY KEY,
	iucr_nk VARCHAR(10) NOT NULL,
	primary_category_sk INT REFERENCES [Primary category NDS](primary_category_sk),
	secondary_category_sk INT REFERENCES [Secondary category NDS](secondary_category_sk),
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
);

CREATE TABLE [District NDS](
	district_sk INT IDENTITY(1, 1) PRIMARY KEY,
	district_nk INT NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
)

CREATE TABLE [Beat NDS](
	beat_sk INT IDENTITY(1, 1) PRIMARY KEY,
	beat_nk INT NOT NULL,
	district_sk INT REFERENCES [District NDS](district_sk),
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
)

CREATE TABLE [Address NDS](
	address_sk INT IDENTITY(1, 1) PRIMARY KEY,
	address_name CHAR(100) NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
)

CREATE TABLE [Area NDS](
	area_sk INT IDENTITY(1, 1) PRIMARY KEY,
	area_nk INT NOT NULL,
	area_name VARCHAR(50) NOT NULL,
	housing_crowded FLOAT NOT NULL,
	household_below_poverty FLOAT NOT NULL,
	aged_over_16_unemployed FLOAT NOT NULL,
	aged_over_25_without_high_school FLOAT NOT NULL,
	aged_under_18_over_64 FLOAT NOT NULL,
	capita_income INT NOT NULL,
	hardship_index INT NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
);

CREATE TABLE [Location NDS](
	location_sk INT IDENTITY(1, 1) PRIMARY KEY,
	location_name VARCHAR(100) NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
)

CREATE TABLE [Date NDS](
	date_sk INT IDENTITY(1,1 ) PRIMARY KEY,
	date_nk DATETIME NOT NULL,
	[day] INT NOT NULL,
	[month] INT NOT NULL,
	[year] INT NOT NULL,
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
);

--DROP TABLE [Crimes NDS];

CREATE TABLE [Crimes NDS] (
	crimes_sk INT IDENTITY(1, 1) PRIMARY KEY,
	crimes_nk INT NOT NULL,
	case_number CHAR(10) NOT NULL,
	iucr_sk INT REFERENCES [IUCR NDS](iucr_sk),
	address_sk INT REFERENCES [Address NDS](address_sk),
	location_sk INT REFERENCES [Location NDS](location_sk),
	arrest INT NOT NULL,
	domestic INT NOT NULL,
	beat_sk INT REFERENCES [Beat NDS](beat_sk),
	ward INT,
	area_sk INT REFERENCES [Area NDS](area_sk),
	fbi_sk INT REFERENCES [FBI NDS](fbi_code_sk),
	updated_on DATETIME not null,
	date_sk INT REFERENCES [Date NDS](date_sk),
	data_source_sk INT REFERENCES [Data source](data_source_sk),
	created_time DATETIME NOT NULL,
	updated_time DATETIME NOT NULL
)

GO
INSERT INTO [Data source]
	(data_source_sk, data_source_name, created_time, updated_time)
VALUES (0, 'Unknown', GETDATE(), GETDATE());

SET identity_insert [FBI Type NDS] ON;
INSERT INTO [FBI Type NDS]
	(fbi_type_sk, fbi_type_name, data_source_sk, created_time, updated_time)
VALUES(0, 'Unknown', 0, GETDATE(), GETDATE())
SET identity_insert [FBI Type NDS] OFF;

SET identity_insert [FBI NDS] ON;
INSERT INTO [FBI NDS] 
	(fbi_code_sk, fbi_code_nk, fbi_code_name, fbi_code_type, fbi_code_definition, data_source_sk, created_time, updated_time)
VALUES(0, 0, 'Unknown', 0, 'Unknown', 0, GETDATE(), GETDATE());
SET identity_insert [FBI NDS] OFF;

SET identity_insert [Primary category NDS] ON;
INSERT INTO [Primary category NDS]
	(primary_category_sk, primary_category_name, data_source_sk, created_time, updated_time)
	VALUES(0, 'Unknown', 0, GETDATE(), GETDATE());
SET identity_insert [Primary category NDS] OFF;

SET identity_insert [Secondary category NDS] ON;
INSERT INTO [Secondary category NDS]
	(secondary_category_sk, secondary_category_name, data_source_sk, created_time, updated_time)
values(0, 'Unknown', 0, GETDATE(), GETDATE());
SET identity_insert [Secondary category NDS] OFF;

SET identity_insert [IUCR NDS] ON;
INSERT INTO [IUCR NDS]
	(iucr_sk, iucr_nk, primary_category_sk, secondary_category_sk, data_source_sk, created_time, updated_time)
VALUES(0, 'Unknown', 0, 0, 0, GETDATE(), GETDATE());
SET identity_insert [IUCR NDS] OFF;

SET identity_insert [District NDS] ON;
INSERT INTO [District NDS]
	(district_sk, district_nk, data_source_sk, created_time, updated_time)
VALUES(0, 0, 0, GETDATE(), GETDATE());
SET identity_insert [District NDS] OFF;

SET identity_insert [Beat NDS] ON;
INSERT INTO [Beat NDS]
	(beat_sk, beat_nk, data_source_sk, created_time, updated_time)
VALUES(0, 0, 0, GETDATE(), GETDATE());
SET identity_insert [Beat NDS] OFF;

SET identity_insert [Address NDS] ON;
INSERT INTO [Address NDS]
	(address_sk, address_name, data_source_sk, created_time, updated_time)
VALUES(0, 0, 0, GETDATE(), GETDATE());
SET identity_insert [Address NDS] OFF;

SET identity_insert [Area NDS] ON;
INSERT INTO [Area NDS]
	(area_sk, area_nk, area_name, housing_crowded, household_below_poverty, 
	aged_over_16_unemployed, aged_over_25_without_high_school, 
	aged_under_18_over_64, capita_income, hardship_index,
	data_source_sk, created_time, updated_time)
VALUES(0, 0, 'Unknown', 0, 0, 0, 0, 0, 0, 0, 0, GETDATE(), GETDATE());
SET identity_insert [Area NDS] OFF;

SET identity_insert [Location NDS] ON;
INSERT INTO [Location NDS]
	(location_sk, location_name, data_source_sk, created_time, updated_time)
VALUES(0, 'Unknown', 0, GETDATE(), GETDATE());
SET identity_insert [Location NDS] OFF;

SET identity_insert [Date NDS] ON;
INSERT INTO [Date NDS]
	(date_sk, date_nk, [day], [month], [year], data_source_sk, created_time, updated_time)
VALUES(0, GETDATE(), 0, 0, 0, 0, GETDATE(), GETDATE())
SET identity_insert [DATE NDS] OFF;