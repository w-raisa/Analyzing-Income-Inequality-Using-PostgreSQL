-- 1) A SELECT * query on every table

SELECT * FROM Country;

SELECT * FROM Gini_Coefficient;

SELECT * FROM UnemploymentRate;

SELECT * FROM GDPPerCapita;

SELECT * FROM TaxRevenue;

SELECT * FROM EducationAttainment;

SELECT * FROM GovernmentSpending;

SELECT * FROM GovernmentDebt;

SELECT * FROM HomicideRate;

SELECT * FROM CO2Emissions;

-- 2) First question: How are government policies related to inequality - specifically, taxes rate, level of debt, government spending? 

-- To answer this we will obtain the average value for TaxRevenue, GovernmentDebt and GovernmentSpending
-- We will compare Gini Coefficient for those countries that have above average values with those that have below average values
-- We will also order the countries by the values for TaxRevenue, GovernmentDebt and GovernmentSpending and take the average Gini coefficient in top 20 and bottom 20 and compare

-- to begin, a comparison between countries above and below average on these values with their gini coefficients


CREATE VIEW above_avg_tax_revenue AS
SELECT TaxRevenue.country AS high_tax_country, 
Gini_Coefficient.value AS gini
FROM TaxRevenue JOIN Gini_Coefficient ON
TaxRevenue.country = Gini_Coefficient.country
WHERE TaxRevenue.value > (SELECT AVG(value) FROM TaxRevenue);

CREATE VIEW below_avg_tax_revenue AS
SELECT TaxRevenue.country AS low_tax_country, 
Gini_Coefficient.value AS gini
FROM TaxRevenue JOIN Gini_Coefficient ON
TaxRevenue.country = Gini_Coefficient.country
WHERE TaxRevenue.value < (SELECT AVG(value) FROM TaxRevenue);

SELECT avg(above_avg_tax_revenue.gini) AS gini_high_tax,
avg(below_avg_tax_revenue.gini) AS gini_low_tax
FROM above_avg_tax_revenue, below_avg_tax_revenue;

CREATE VIEW top_twenty_tax AS
SELECT TaxRevenue.country AS top_tax_country,
Gini_Coefficient.value AS gini
FROM TaxRevenue JOIN Gini_Coefficient ON
TaxRevenue.country = Gini_Coefficient.country
ORDER BY TaxRevenue.country DESC
LIMIT 20;

CREATE VIEW bottom_twenty_tax AS
SELECT TaxRevenue.country AS bottom_tax_country,
Gini_Coefficient.value AS gini
FROM TaxRevenue JOIN Gini_Coefficient ON
TaxRevenue.country = Gini_Coefficient.country
ORDER BY TaxRevenue.country ASC 
LIMIT 20;

SELECT avg(top_twenty_tax.gini) AS gini_top_tax,
avg(bottom_twenty_tax.gini) AS gini_bottom_tax
FROM top_twenty_tax, bottom_twenty_tax;

--

CREATE VIEW above_avg_gov_debt AS
SELECT GovernmentDebt.country AS high_debt_country, 
Gini_Coefficient.value AS gini
FROM GovernmentDebt JOIN Gini_Coefficient ON
GovernmentDebt.country = Gini_Coefficient.country
WHERE GovernmentDebt.value > (SELECT AVG(value) FROM GovernmentDebt);

CREATE VIEW below_avg_gov_debt AS
SELECT GovernmentDebt.country AS low_debt_country, 
Gini_Coefficient.value AS gini
FROM GovernmentDebt JOIN Gini_Coefficient ON
GovernmentDebt.country = Gini_Coefficient.country
WHERE GovernmentDebt.value < (SELECT AVG(value) FROM GovernmentDebt);

SELECT avg(above_avg_gov_debt.gini) AS gini_high_debt,
avg(below_avg_gov_debt.gini) AS gini_low_debt
FROM above_avg_gov_debt, below_avg_gov_debt;

CREATE VIEW top_twenty_debt AS
SELECT GovernmentDebt.country AS top_debt_country,
Gini_Coefficient.value AS gini
FROM GovernmentDebt JOIN Gini_Coefficient ON
GovernmentDebt.country = Gini_Coefficient.country
ORDER BY GovernmentDebt.country DESC 
LIMIT 20;

CREATE VIEW bottom_twenty_debt AS
SELECT GovernmentDebt.country AS bottom_debt_country,
Gini_Coefficient.value AS gini
FROM GovernmentDebt JOIN Gini_Coefficient ON
GovernmentDebt.country = Gini_Coefficient.country
ORDER BY GovernmentDebt.country ASC
LIMIT 20;

SELECT avg(top_twenty_debt.gini) AS gini_top_debt,
avg(bottom_twenty_debt.gini) AS gini_bottom_debt
FROM top_twenty_debt, bottom_twenty_debt;

--

CREATE VIEW above_avg_gov_spending AS
SELECT GovernmentSpending.country AS high_spending_country, 
Gini_Coefficient.value AS gini
FROM GovernmentSpending JOIN Gini_Coefficient ON
GovernmentSpending.country = Gini_Coefficient.country
WHERE GovernmentSpending.value > (SELECT AVG(value) FROM GovernmentSpending);

CREATE VIEW below_avg_gov_spending AS
SELECT GovernmentSpending.country AS low_spending_country, 
Gini_Coefficient.value AS gini
FROM GovernmentSpending JOIN Gini_Coefficient ON
GovernmentSpending.country = Gini_Coefficient.country
WHERE GovernmentSpending.value < (SELECT AVG(value) FROM GovernmentSpending);

SELECT avg(above_avg_gov_spending.gini) AS gini_high_spending,
avg(below_avg_gov_spending.gini) AS gini_low_spending
FROM above_avg_gov_spending, below_avg_gov_spending;

CREATE VIEW top_twenty_spending AS
SELECT GovernmentSpending.country AS top_spending_country,
Gini_Coefficient.value AS gini
FROM GovernmentSpending JOIN Gini_Coefficient ON
GovernmentSpending.country = Gini_Coefficient.country
ORDER BY GovernmentSpending.country DESC
LIMIT 20;

CREATE VIEW bottom_twenty_spending AS
SELECT GovernmentSpending.country AS bottom_spending_country,
Gini_Coefficient.value AS gini
FROM GovernmentSpending JOIN Gini_Coefficient ON
GovernmentSpending.country = Gini_Coefficient.country
ORDER BY GovernmentSpending.country ASC
LIMIT 20;

SELECT avg(top_twenty_spending.gini) AS gini_top_spending,
avg(bottom_twenty_spending.gini) AS gini_bottom_spending
FROM top_twenty_spending, bottom_twenty_spending;


-- next, a comparison between countries in the top 20 and bottom 20 for the different values on the Gini coefficient


-- 3) Second question: What is the relationship between economic output and wealth and income inequality - specifically, how is income inequality associated with the poverty rate and GDP per capita?

-- we will take the exact same approach as for the first question, but the relevant variables this time are UnemploymentRate and GDPPerCapita

CREATE VIEW above_avg_unemployment AS
SELECT UnemploymentRate.country AS high_unemployment_country, 
Gini_Coefficient.value AS gini
FROM UnemploymentRate JOIN Gini_Coefficient ON
UnemploymentRate.country = Gini_Coefficient.country
WHERE UnemploymentRate.value > (SELECT AVG(value) FROM UnemploymentRate);

CREATE VIEW below_avg_unemployment AS
SELECT UnemploymentRate.country AS low_unemployment_country, 
Gini_Coefficient.value AS gini
FROM UnemploymentRate JOIN Gini_Coefficient ON
UnemploymentRate.country = Gini_Coefficient.country
WHERE UnemploymentRate.value < (SELECT AVG(value) FROM UnemploymentRate);

SELECT avg(above_avg_unemployment.gini) AS gini_high_unemployment,
avg(below_avg_unemployment.gini) AS gini_low_unemployment
FROM above_avg_unemployment, below_avg_unemployment;

CREATE VIEW top_twenty_unemployment AS
SELECT UnemploymentRate.country AS top_unemployment_country,
Gini_Coefficient.value AS gini
FROM UnemploymentRate JOIN Gini_Coefficient ON
UnemploymentRate.country = Gini_Coefficient.country
ORDER BY UnemploymentRate.country DESC
LIMIT 20;

CREATE VIEW bottom_twenty_unemployment AS
SELECT UnemploymentRate.country AS bottom_unemployment_country,
Gini_Coefficient.value AS gini
FROM UnemploymentRate JOIN Gini_Coefficient ON
UnemploymentRate.country = Gini_Coefficient.country
ORDER BY UnemploymentRate.country ASC
LIMIT 20;

SELECT avg(top_twenty_unemployment.gini) AS gini_top_unemployment,
avg(bottom_twenty_unemployment.gini) AS gini_bottom_unemployment
FROM top_twenty_unemployment, bottom_twenty_unemployment;

--

CREATE VIEW above_avg_gdp AS
SELECT GDPPerCapita.country AS high_gdp_country, 
Gini_Coefficient.value AS gini
FROM GDPPerCapita JOIN Gini_Coefficient ON
GDPPerCapita.country = Gini_Coefficient.country
WHERE GDPPerCapita.value > (SELECT AVG(value) FROM GDPPerCapita);

CREATE VIEW below_avg_gdp AS
SELECT GDPPerCapita.country AS low_gdp_country, 
Gini_Coefficient.value AS gini
FROM GDPPerCapita JOIN Gini_Coefficient ON
GDPPerCapita.country = Gini_Coefficient.country
WHERE GDPPerCapita.value < (SELECT AVG(value) FROM GDPPerCapita);

SELECT avg(above_avg_gdp.gini) AS gini_high_gdp,
avg(below_avg_gdp.gini) AS gini_low_gdp
FROM above_avg_gdp, below_avg_gdp;

CREATE VIEW top_twenty_gdp AS
SELECT GDPPerCapita.country AS top_gdp_country,
Gini_Coefficient.value AS gini
FROM GDPPerCapita JOIN Gini_Coefficient ON
GDPPerCapita.country = Gini_Coefficient.country
ORDER BY GDPPerCapita.country DESC
LIMIT 20;

CREATE VIEW bottom_twenty_gdp AS
SELECT GDPPerCapita.country AS bottom_gdp_country,
Gini_Coefficient.value AS gini
FROM GDPPerCapita JOIN Gini_Coefficient ON
GDPPerCapita.country = Gini_Coefficient.country
ORDER BY GDPPerCapita.country ASC
LIMIT 20;

SELECT avg(top_twenty_gdp.gini) AS gini_top_gdp,
avg(bottom_twenty_gdp.gini) AS gini_bottom_gdp
FROM top_twenty_gdp, bottom_twenty_gdp;

-- 4) Third question: What is the relationship between income inequality and non-economic factors - specifically crime, childhood education attainment and the environment?

-- we will take the exact same approach as for the first two questions, but the relevant variables this time are EducationAttainment, HomicideRate, CO2Emissions;


CREATE VIEW above_avg_education AS
SELECT EducationAttainment.country AS high_education_country, 
Gini_Coefficient.value AS gini
FROM EducationAttainment JOIN Gini_Coefficient ON
EducationAttainment.country = Gini_Coefficient.country
WHERE EducationAttainment.value > (SELECT AVG(value) FROM EducationAttainment);

CREATE VIEW below_avg_education AS
SELECT EducationAttainment.country AS low_education_country, 
Gini_Coefficient.value AS gini
FROM EducationAttainment JOIN Gini_Coefficient ON
EducationAttainment.country = Gini_Coefficient.country
WHERE EducationAttainment.value < (SELECT AVG(value) FROM EducationAttainment);

SELECT avg(above_avg_education.gini) AS gini_high_education,
avg(below_avg_education.gini) AS gini_low_education
FROM above_avg_education, below_avg_education;

CREATE VIEW top_twenty_education AS
SELECT EducationAttainment.country AS top_education_country,
Gini_Coefficient.value AS gini
FROM EducationAttainment JOIN Gini_Coefficient ON
EducationAttainment.country = Gini_Coefficient.country
ORDER BY  EducationAttainment.country DESC
LIMIT 20;

CREATE VIEW bottom_twenty_education AS
SELECT EducationAttainment.country AS bottom_education_country,
Gini_Coefficient.value AS gini
FROM EducationAttainment JOIN Gini_Coefficient ON
EducationAttainment.country = Gini_Coefficient.country
ORDER BY EducationAttainment.country ASC
LIMIT 20;

SELECT avg(top_twenty_education.gini) AS gini_top_education,
avg(bottom_twenty_education.gini) AS gini_bottom_education
FROM top_twenty_education, bottom_twenty_education;

--

CREATE VIEW above_avg_homicide AS
SELECT HomicideRate.country AS high_homicide_country, 
Gini_Coefficient.value AS gini
FROM HomicideRate JOIN Gini_Coefficient ON
HomicideRate.country = Gini_Coefficient.country
WHERE HomicideRate.value > (SELECT AVG(value) FROM HomicideRate);

CREATE VIEW below_avg_homicide AS
SELECT HomicideRate.country AS low_homicide_country, 
Gini_Coefficient.value AS gini
FROM HomicideRate JOIN Gini_Coefficient ON
HomicideRate.country = Gini_Coefficient.country
WHERE HomicideRate.value < (SELECT AVG(value) FROM HomicideRate);

SELECT avg(above_avg_homicide.gini) AS gini_high_homicide,
avg(below_avg_homicide.gini) AS gini_low_homicde
FROM above_avg_homicide, below_avg_homicide;

CREATE VIEW top_twenty_homicide AS
SELECT HomicideRate.country AS top_homicide_country,
Gini_Coefficient.value AS gini
FROM HomicideRate JOIN Gini_Coefficient ON
HomicideRate.country = Gini_Coefficient.country
ORDER BY HomicideRate.country DESC
LIMIT 20;

CREATE VIEW bottom_twenty_homicide AS
SELECT HomicideRate.country AS bottom_homicide_country,
Gini_Coefficient.value AS gini
FROM HomicideRate JOIN Gini_Coefficient ON
HomicideRate.country = Gini_Coefficient.country
ORDER BY HomicideRate.country ASC
LIMIT 20;

SELECT avg(top_twenty_homicide.gini) AS gini_top_homicide,
avg(bottom_twenty_homicide.gini) AS gini_bottom_homicide
FROM top_twenty_homicide, bottom_twenty_homicide;

--

CREATE VIEW above_avg_co2 AS
SELECT CO2Emissions.country AS high_co2_country, 
Gini_Coefficient.value AS gini
FROM CO2Emissions JOIN Gini_Coefficient ON
CO2Emissions.country = Gini_Coefficient.country
WHERE CO2Emissions.value > (SELECT AVG(value) FROM CO2Emissions);

CREATE VIEW below_avg_co2 AS
SELECT CO2Emissions.country AS low_co2_country, 
Gini_Coefficient.value AS gini
FROM CO2Emissions JOIN Gini_Coefficient ON
CO2Emissions.country = Gini_Coefficient.country
WHERE CO2Emissions.value < (SELECT AVG(value) FROM CO2Emissions);

SELECT avg(above_avg_co2.gini) AS gini_high_co2,
avg(below_avg_co2.gini) AS gini_low_co2
FROM above_avg_co2, below_avg_co2;

CREATE VIEW top_twenty_co2 AS
SELECT CO2Emissions.country AS top_co2_country,
Gini_Coefficient.value AS gini
FROM CO2Emissions JOIN Gini_Coefficient ON
CO2Emissions.country = Gini_Coefficient.country
ORDER BY CO2Emissions.country DESC
LIMIT 20;

CREATE VIEW bottom_twenty_co2 AS
SELECT CO2Emissions.country AS bottom_co2_country,
Gini_Coefficient.value AS gini
FROM CO2Emissions JOIN Gini_Coefficient ON
CO2Emissions.country = Gini_Coefficient.country
ORDER BY CO2Emissions.country ASC
LIMIT 20;

SELECT avg(top_twenty_co2.gini) AS gini_top_co2,
avg(bottom_twenty_co2.gini) AS gini_bottom_co2
FROM top_twenty_co2, bottom_twenty_co2;

-- 5) Finally, we will take the approach to all the questions but in reverse - for countries with above average / highest Gini coefficient values, we will find the
-- average values for the different variables, and for below average / lowest Gini coefficient values, we will compare the average values

CREATE VIEW gini_data AS
SELECT Gini_Coefficient.value AS value, 
UnemploymentRate.value AS unemployment, 
GDPPerCapita.value AS gdp, 
TaxRevenue.value AS tax,
EducationAttainment.value AS education, 
GovernmentSpending.value AS spending, 
GovernmentDebt.value AS debt, 
HomicideRate.value AS homicide, 
CO2Emissions.value AS co2
FROM Gini_Coefficient JOIN UnemploymentRate
ON Gini_Coefficient.country JOIN UnemploymentRate.country
JOIN GDPPerCapita
ON UnemploymentRate.country = GDPPerCapita.country
JOIN TaxRevenue
ON GDPPerCapita.country = TaxRevenue.country
JOIN EducationAttainment
ON TaxRevenue.country = EducationAttainment.country
JOIN GovernmentSpending.country
ON EducationAttainment.country = GovernmentSpending.country
JOIN GovernmentDebt
ON GovernmentSpending.country = GovernmentDebt.country
JOIN HomicideRate
ON GovernmentDebt.country = HomicideRate.country
JOIN CO2Emissions
ON HomicideRate.country = CO2Emissions.country;

 

CREATE VIEW above_avg_gini AS
SELECT value AS high_gini, unemployment, gdp, tax, education, spending, 
debt, homicide, co2
FROM gini_data
WHERE gini_data.value > (SELECT AVG(value) FROM gini_data);

CREATE VIEW below_avg_gini AS
SELECT value AS low_gini, unemployment, gdp, tax, education, spending, 
debt, homicide, co2
FROM gini_data
WHERE gini_data.value < (SELECT AVG(value) FROM gini_data);

SELECT AVG(above_avg_gini.unemployment) AS high_gini_unemployment,
AVG(below_avg_gini.unemployment) AS low_gini_unemployment,
AVG(above_avg_gini.gdp) AS high_gini_gdp,
AVG(below_avg_gini.gdp) AS low_gini_gdp,
AVG(above_avg_gini.tax) AS high_gini_tax,
AVG(below_avg_gini.tax) AS low_gini_tax,
AVG(above_avg_gini.education) AS high_gini_education,
AVG(below_avg_gini.education) AS low_gini_education,
AVG(above_avg_gini.spending) AS high_gini_spending,
AVG(below_avg_gini.spending) AS low_gini_spending,
AVG(above_avg_gini.debt) AS high_gini_debt,
AVG(below_avg_gini.debt) AS low_gini_debt,
AVG(above_avg_gini.homicide) AS high_gini_homicide,
AVG(below_avg_gini.homicide) AS low_gini_homicide,
AVG(above_avg_gini.co2) AS high_gini_co2,
AVG(below_avg_gini.co2) AS low_gini_co2
FROM above_avg_gini, below_avg_gini;


--SELECT avg(above_avg_tax_revenue.gini) AS gini_high_tax,
--avg(below_avg_tax_revenue.gini) AS gini_low_tax
--FROM above_avg_tax_revenue, below_avg_tax_revenue;

CREATE VIEW top_twenty_gini AS
SELECT Gini_Coefficient.value AS top_gini,
unemployment AS top_gini_unemployment, 
gdp AS top_gini_gdp, tax AS top_gini_tax, 
education AS top_gini_education, spending AS top_gini_spending, 
debt AS top_gini_debt, homicide AS top_gini_homicide, co2 AS top_gini_co2
FROM gini_data
ORDER BY Gini_Coefficient.value DESC
LIMIT 20;

CREATE VIEW bottom_twenty_gini AS
SELECT Gini_Coefficient.value AS bottom_gini,
unemployment AS bottom_gini_unemployment, 
gdp AS bottom_gini_gdp, tax AS bottom_gini_tax, 
education AS bottom_gini_education, spending AS bottom_gini_spending, 
debt AS bottom_gini_debt, 
homicide AS bottom_gini_homicide, co2 AS bottom_gini_co2
FROM gini_data
ORDER BY Gini_Coefficient.value ASC
LIMIT 20;


SELECT AVG(top_gini_unemployment), AVG(top_gini_gdp), AVG(top_gini_tax), 
AVG(top_gini_education), AVG(top_gini_spending), AVG(top_gini_debt), 
AVG(top_gini_homicide), AVG(top_gini_co2), AVG(bottom_gini_unemployment), 
AVG(bottom_gini_gdp), AVG(bottom_gini_tax), AVG(bottom_gini_education), 
AVG(bottom_gini_spending), AVG(bottom_gini_debt), AVG(bottom_gini_homicide), 
AVG(bottom_gini_co2)
FROM top_twenty_gini, bottom_twenty_gini;

--  UnemploymentRate, GDPPerCapita, TaxRevenue, EducationAttainment, GovernmentSpending, GovernmentDebt, HomicideRate, CO2Emissions