/*
Covid 19 Data Exploration 
Skills used: Joins, Aggregate Functions, Converting Data Types
*/

SELECT *
FROM PortfolioProject..CovidDeaths
Where continent is not null 
order by 3,4

SELECT *
FROM PortfolioProject..CovidVaccinations

SELECT Location, ROUND(AVG(life_expectancy),5) AS Expectancy
FROM PortfolioProject..CovidVaccinations
WHERE location = 'Nigeria'
GROUP BY location

-- Select Data that we are going to be starting with
Select continent, MAX(total_cases) AS TotalCases
From PortfolioProject..CovidDeaths
Where continent is not null 
Group By continent
order by 2 DESC

Select Location, population, MAX(total_cases) AS TotalCases
From PortfolioProject..CovidDeaths
Where continent is not null 
Group By Location, population
order by 3 DESC

Select continent, SUM(CONVERT(int,new_deaths)) AS TotalDeaths
From PortfolioProject..CovidDeaths
Where continent is not null 
Group By continent
order by 2 DESC

Select Location, population, MAX(CAST(total_deaths AS INT)) AS TotalDeaths
From PortfolioProject..CovidDeaths
Where continent is not null 
Group By Location, population
order by 3 DESC

-- Total Cases vs Total Deaths

Select Location, MAX(total_cases) AS TotalCases, MAX(CAST(total_deaths AS int)) AS TotalDeaths, ROUND(MAX(total_deaths/total_cases),4)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
Where location = 'Nigeria'
and continent is not null
GROUP BY location

-- What proportion of the Nigeria's Population had COVID
Select Location, Population, MAX(total_cases) AS COVIDCases, ROUND(MAX(total_cases/population)*100,3) as PercentPopulationInfected
From PortfolioProject..CovidDeaths
where location = 'Nigeria'
GROUP BY location, population

-- What African Countries have the Highest Number of Infected Persons?
Select Location, Population, MAX(total_cases) as HighestInfectionCount
From PortfolioProject..CovidDeaths
Where continent ='Africa'
Group by Location, Population
order by HighestInfectionCount DESC

-- African Countries with Highest Death Count per Population
Select Location, MAX(total_cases) AS TotalCases, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent = 'Africa'
Group by Location
order by TotalDeathCount desc

---Total Cases in Africa
SELECT SUM(new_cases) AS AfricaCases
FROM PortfolioProject..CovidDeaths
WHERE continent = 'Africa'


--- Proportion of Nigerian Population Tested
SELECT location, population, MAX(CAST(total_tests AS int)) AS TestedPop, ROUND(MAX(CAST(total_tests AS int)/population),4)*100 AS TestedPopPercent
FROM PortfolioProject..CovidDeaths
WHERE location = 'Nigeria'
GROUP BY location, population
ORDER BY TestedPopPercent DESC

---What is the Percentage of Infected Persons that Were Admitted
SELECT location, MAX(CAST(hosp_patients AS int)) AS InPatients, ROUND(MAX(CAST(hosp_patients AS int))/MAX(total_cases),4)*100 AS AdmissionRate
FROM PortfolioProject..CovidDeaths
WHERE Continent = 'Africa'
AND hosp_patients IS NOT NULL
GROUP BY location
ORDER BY AdmissionRate DESC


--- What African countries had COVID patients that were admitted into ICU
SELECT location, MAX(CAST(icu_patients AS int)) AS ICUPatients
FROM PortfolioProject..CovidDeaths
WHERE Continent = 'Africa'
AND icu_patients IS NOT NULL
GROUP BY location
ORDER BY ICUPatients DESC

SELECT location, MAX(total_cases) AS COVIDCases, MAX(CAST(icu_patients AS int)) AS ICUPatients,
ROUND(MAX(CAST(icu_patients AS int))/MAX(total_cases),4)*100 AS ICUperCase
FROM PortfolioProject..CovidDeaths
WHERE Continent = 'Africa'
AND icu_patients IS NOT NULL
GROUP BY location
ORDER BY ICUPatients DESC
