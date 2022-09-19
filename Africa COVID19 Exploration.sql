/*
Africa's Covid 19 Data Exploration 
Skills used: Joins, Aggregate Functions, Converting Data Types
*/

---AFRICA POPULATION, COVIDCASES AND ITS PREVALENCE
SELECT SUM(population) AS AfricaPop, SUM(new_cases) AS AfricaCases, SUM(new_cases)/SUM(population)*100 AS PercentInfected
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'

---AFRICA COVID MORTALITY
SELECT MAX(CAST(total_deaths AS int)) AS AfricaCOVIDMortality
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'

---AFRICA COVID MORTALITY
SELECT SUM(population) AS AfricaPop, SUM(CAST(new_deaths AS int)) AS AfricaCOVIDMortality,
		SUM(CAST(new_deaths AS FLOAT))/SUM(population)*100 AS PercentDead
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'

SELECT SUM(new_cases) AS AfricaCOVIDCases, SUM(CAST(new_deaths AS int)) AS AfricaCOVIDMortality,
		ROUND(SUM(CAST(new_deaths AS float))/SUM(new_cases),4)*100 AS COVIDdeathsperCase
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'

-- In-Hospital Patients and ICU admission
SELECT SUM(new_cases) AS COVIDCases, MAX(CAST(hosp_patients AS float)) AS hospitalized, 
		ROUND(MAX(CAST(hosp_patients AS float))/sum(new_cases),4)*100 AS ProportionHospitalized
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'

SELECT SUM(new_cases) AS COVIDCases, MAX(CAST(icu_patients AS int)) AS ICUadmission, 
		ROUND(MAX(CAST(icu_patients AS int))/sum(new_cases),4)*100 AS ICUProportion
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'

SELECT MAX(CAST(hosp_patients AS int)) AS hospitalized, MAX(CAST(icu_patients AS int)) AS ICUadmission, 
			ROUND(MAX(CAST(icu_patients AS float))/MAX(CAST(hosp_patients AS float)),4)*100 AS ICUProportion
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'

SELECT MAX(CAST(hosp_patients AS int)) AS hospitalized, MAX(CAST(icu_patients AS int)) AS ICUadmission, SUM(CAST(new_deaths AS int)) AS deaths,
			ROUND(MAX(CAST(icu_patients AS float))/SUM(CAST(new_deaths AS float)),4)*100 AS ICUDeathProportion,
				ROUND(MAX(CAST(hosp_patients AS float))/SUM(CAST(new_deaths AS float)),4)*100 AS HospitalDeathProportion
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'



SELECT MAX(CAST(total_vaccinations AS float)) AS PeopleVaccine
FROM dbo.CovidVaccinations
WHERE continent = 'Africa'


SELECT MAX(CAST(people_vaccinated AS float)) AS PeopleVaccine
FROM dbo.CovidVaccinations
WHERE continent = 'Africa'


SELECT MAX(CAST(people_fully_vaccinated AS float)) AS PeopleVaccine
FROM dbo.CovidVaccinations
WHERE continent = 'Africa'

SELECT MAX(CAST(total_boosters AS float)) AS PeopleVaccine
FROM dbo.CovidVaccinations
WHERE continent = 'Africa'



 