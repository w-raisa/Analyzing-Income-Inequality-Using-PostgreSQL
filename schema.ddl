drop schema if exists projectschema cascade; 
create schema projectschema;
set search_path to projectschema;

-- Represents a country. Includes country code (a 3 upper case letter code), name and population
create table Country(
-- country code: 3 upper case letters to represent the country
cID char(3) unique, 
-- the name of the country
cName varchar(50) primary key, 
-- the population of the country
population int not null); 

-- The Gini Coefficient represents the level of income inequality in a country. A maximum value of 100 is a completely unequal country
-- A value of 0 means the country has perfect income equality
create table Gini_Coefficient(
-- the value of the gini coefficient, from 0 to 100
value float not null, 
-- the name of the country
country varchar(50) primary key references Country(cName));

-- The rate of unemployment in the country
create table UnemploymentRate(
-- the rate of unemploymentvalue float not null, 
-- the name of the country
country varchar(50) references Country(cName));

-- the GDP per capita
create table GDPPerCapita(
-- the value of GDP per capita
value float not null, 
-- the name of the country
country varchar(50) references Country(cName));

-- percent of GDP collected as taxes
create table TaxRevenue(
-- the tax revenue amount
value float not null, 
-- the name of the country
country varchar(50) references Country(cName));

-- The percent of population that attained a lower secondary level of education or above 
create table EducationAttainment(
-- The percent of population that attained a lower secondary level of education or above
value float not null, 
-- the name of the country
country varchar(50) references Country(cName));

-- Percent of GDP the government spends
create table GovernmentSpending(
-- The value of government spending
value float not null, 
-- the name of the country
country varchar(50) references Country(cName));

-- Government debt as percent of GDP
create table GovernmentDebt(
-- the value of government debt
value float not null, 
-- the name of the country
country varchar(50) references Country(cName));

-- the rate of homicide
create table HomicideRate(
-- the value of the homicide rate
value float not null, 
-- the name of the country
country varchar(50) references Country(cName));

-- amount of CO2 emitted
create table CO2Emissions(
-- the value of the amount of CO2 emitted
value float not null, 
-- the name of the country
country varchar(50) references Country(cName));