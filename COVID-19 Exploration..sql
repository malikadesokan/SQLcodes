/*
World Covid 19 Data Exploration 
Skills used: Joins, Aggregate Functions, Converting Data Types
*/

---WORLD POPULATION, COVID-19 CASES AND ITS PREVALENCE
-- World Population vs COVID CASES
SELECT location, MAX(population) AS Pop, SUM(new_cases) AS WorldCases, ROUND(SUM(new_cases)/MAX(population),8)*100 AS WorldCOVIDPerc
FROM PortfolioProject..CovidDeaths
WHERE location = 'World'
Group By location

-- Continent Population vs COVID Cases
SELECT location, MAX(population) AS Pop, SUM(new_cases) AS ContCases, ROUND(SUM(new_cases)/MAX(population),8)*100 AS ContCOVIDPerc
FROM PortfolioProject..CovidDeaths
Where location IN ('South America', 'North America', 'Asia', 'Africa', 'Oceania', 'Europe')
GROUP BY location, continent
ORDER BY ContCOVIDPerc DESC

-- World Population vs COVID Deaths
SELECT location, MAX(population) AS Pop, SUM(CAST(new_deaths AS float)) AS WorldDeath, 
ROUND(SUM(CAST(new_deaths AS float))/MAX(population),8)*100 AS WorldDeathPerc
FROM PortfolioProject..CovidDeaths
WHERE location = 'World'
Group By location

--Continent Population vs COVID Deaths
SELECT location, MAX(population) AS Pop, SUM(CAST(new_deaths AS float)) AS ContDeath, 
ROUND(SUM(CAST(new_deaths AS float))/MAX(population),8)*100 AS ContDeathPerc
FROM PortfolioProject..CovidDeaths
Where location IN ('South America', 'North America', 'Asia', 'Africa', 'Oceania', 'Europe')
GROUP BY location, continent
ORDER BY ContDeathPerc DESC

--World COVID Cases vs COVID Deaths
SELECT location, SUM(new_cases) AS COVIDCases, SUM(CAST(new_deaths AS float)) AS COVIDDeaths, 
ROUND(SUM(CAST(new_deaths AS float))/SUM(new_cases),8)*100 AS DeathProportion
FROM PortfolioProject..CovidDeaths
WHERE location = 'World'
Group By location

--Continent COVID Cases vs COVID Deaths
SELECT location, SUM(new_cases) AS COVIDCases, SUM(CAST(new_deaths AS float)) AS COVIDDeaths, 
ROUND(SUM(CAST(new_deaths AS float))/SUM(new_cases),8)*100 AS DeathProportion
FROM PortfolioProject..CovidDeaths
Where location IN ('South America', 'North America', 'Asia', 'Africa', 'Oceania', 'Europe')
Group By location
order by 4 DESC

--World Population Fully Vaccinated
SELECT MAX(CAST(people_fully_vaccinated AS float)) FullyVaccinated
FROM PortfolioProject..CovidVaccinations

--Population Fully Vaccinated by Continent
SELECT location, MAX(CAST(people_fully_vaccinated AS float)) FullyVaccinated
FROM PortfolioProject..CovidVaccinations
Where location IN ('South America', 'North America', 'Asia', 'Africa', 'Oceania', 'Europe')
Group By location
order by 2 DESC

--- Vaccinations Administered
SELECT MAX(CAST(total_vaccinations AS float)) TotalVaccine
FROM PortfolioProject..CovidVaccinations

--- Vaccinations Administered By Continent
SELECT location, MAX(CAST(total_vaccinations AS float)) TotalVaccine
FROM PortfolioProject..CovidVaccinations
Where location IN ('South America', 'North America', 'Asia', 'Africa', 'Oceania', 'Europe')
Group By location
order by 2 DESC
