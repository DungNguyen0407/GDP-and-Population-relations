WITH Population_GDP_of_Europe_and_Asia AS (
SELECT 
  PO.Country,
  PO.`2015 population`,
  PO.`2020 population`,
  PO.`2022 population`,
  PO.`2023 population`,
  continent AS Continent,
  GD.GDP_Full_USD AS Gross_Domestic_Product,
  GD.GDP_per_Capita_USD AS GDP_Capita
FROM `capstone-project-508019.World_population.Population_growth` AS PO
 Left JOIN `capstone-project-508019.World_population.GDP` AS GD ON PO.country = GD.Country
WHERE   
     PO.continent in ('Europe','Asia')
     AND CAST(Replace(Replace(GD.GDP_Full_USD, '$', ''), ',', '') AS INT64) >= 200000000
     AND GD.GDP_per_Capita_USD > 3000
     AND CAST (PO.`world percentage` AS FLOAT64) != 0.0
)

SELECT *
FROM Population_GDP_of_Europe_and_Asia
ORDER BY 
  Population_GDP_of_Europe_and_Asia.Gross_Domestic_Product DESC
LIMIT 20
