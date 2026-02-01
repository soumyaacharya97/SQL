use world;

SELECT * FROM world.city;

SELECT * FROM world.country;

SELECT * FROM world.countrylanguage;



 Q1. Count how many cities are there in each country?
  
 SELECT 
    co.Name AS CountryName,
    COUNT(ci.ID) AS NumberOfCities
FROM world.country co
LEFT JOIN world.city ci 
ON co.Code = ci.CountryCode
GROUP BY co.Code, co.Name
ORDER BY NumberOfCities DESC;
 
 
Q2. Display all continents having more than 30 countries.

select continent, count(continent) from world.country group by continent having count(continent) > 30

or

select continent from world.country group by continent having count(continent) > 30


Q3. List regions whose total population exceeds 200 million.

select Region, sum(Population) from world.country group by Region having sum(Population) > 200000000


Q4. Find the top 5 continents by average GNP per country.

select Continent, avg(GNP), COUNT(*) AS NumberOfCountries from world.country WHERE GNP > 0 
group by Continent order by avg(GNP) desc limit 5


Q5. Find the total number of official languages spoken in each continent.

SELECT 
    co.Continent,
    COUNT(DISTINCT cl.Language) AS TotalOfficialLanguages
FROM world.country co
INNER JOIN world.countrylanguage cl 
ON co.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY co.Continent


Q6. Find the maximum and minimum GNP for each continent

select continent, 
max(gnp) as maximumgnp, min(gnp) as minimumgnp, 
max(gnp) - min(gnp) as gnprange 
from world.country WHERE GNP > 0 group by continent


 Q7. Find the country with the highest average city population.
 
 SELECT 
    co.Name AS CountryName,
    co.Code AS CountryCode,
    AVG(ci.Population) AS AverageCityPopulation,
    COUNT(ci.ID) AS NumberOfCities
FROM world.country co
INNER JOIN world.city ci
ON co.Code = ci.CountryCode
GROUP BY co.Code, co.Name
ORDER BY AverageCityPopulation DESC
LIMIT 1;


Q8. List continents where the average city population is greater than 200,000.

select co.continent, avg(c.population) as avgpopulation , count(c.id) as city from world.country as co join world.city as c on 
co.code = c.countrycode group by co.continent having avg(c.population) > 200000


Q9. Find the total population and average life expectancy for each continent, ordered by average life
expectancy descending.

SELECT 
    Continent,
    SUM(Population) AS TotalPopulation,
    ROUND(AVG(LifeExpectancy), 2) AS AverageLifeExpectancy,
    COUNT(*) AS NumberOfCountries
FROM world.country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Continent
ORDER BY AverageLifeExpectancy DESC;


Q10. Find the top 3 continents with the highest average life expectancy, but only include those where
the total population is over 200 million.

SELECT 
    Continent,
    ROUND(AVG(LifeExpectancy), 2) AS AverageLifeExpectancy,
    SUM(Population) AS TotalPopulation,
    COUNT(*) AS NumberOfCountries
FROM world.country
WHERE LifeExpectancy IS NOT NULL
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY AverageLifeExpectancy DESC
LIMIT 3;









