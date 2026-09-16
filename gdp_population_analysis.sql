WITH Population_GDP_of_Europe_and_Asia AS (
SELECT 
  PO.Country,
  continent AS Continent,
  PO.`2020 population`,
  PO.`2022 population`,
  PO.`2023 population`,
  PO.`2025 population`,
  GD.GDP_Growth_Percent AS GDP_Growth_2025,
  GD.GDP_2023_USD AS GDP_2023,
  CAST(GD.GDP_Full_USD AS BIGNUMERIC) AS GDP_2025,
  GD.GDP_per_Capita_USD AS GDP_Capita
FROM `capstone-project-508019.World_population.Population` AS PO
 Left JOIN `capstone-project-508019.World_population.GDP` AS GD ON PO.country = GD.Country
WHERE   
     PO.continent in ('Europe','Asia','North America')
     AND GD.GDP_Full_USD >= 200000000
     AND GD.GDP_per_Capita_USD > 3000
     AND CAST (PO.`world percentage` AS FLOAT64) != 0.0
)

SELECT *
FROM Population_GDP_of_Europe_and_Asia
ORDER BY 
  Population_GDP_of_Europe_and_Asia.GDP_2025 DESC,
  Country ASC
LIMIT 25
