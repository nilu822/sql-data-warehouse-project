/*

this script checks if the database is exists or not if exists then it will drop the whole datawarehouse
and will recreate it , it also creates 3 schemas(layer) 1. bronze, 2. silver 3. gold
/*


--drop and re-create datawarehouse if exists 
if exists(select 1 from sys.databases where name='datawarehouse')
begin
	alter database datawarehouse set single_user with rollback immediate;
	drop database datawarehouse;
end;

--DATA WAREHOUSE--

use master;

CREATE DATABASE datawarehouse;
go

use datawarehouse;
go

--create schemas
CREATE SCHEMA bronze;
go
CREATE SCHEMA silver;
go
CREATE SCHEMA gold;
go
select * from INFORMATION_SCHEMA.SCHEMATA;
--drop schema dbo;

