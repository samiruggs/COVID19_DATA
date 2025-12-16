USE CleanedData
GO
SELECT TOP 20 *
FROM
dbo.cleaned;

USE CleanedData
GO
SELECT DISTINCT Country
FROM
dbo.cleaned;

USE CleanedData
GO
SELECT COUNT(Country) AS Total_Count  
FROM
dbo.cleaned; 

USE CleanedData
GO
SELECT SUM(New_Cases) AS Nigeria_New_Cases,
SUM(New_Death) AS Nigeria_New_Death
FROM dbo.cleaned
WHERE Country = 'Nigeria'; 

SELECT 
Country,
SUM(New_Cases) AS New_Cases,
SUM(New_Death) AS New_Death,
ROUND((SUM(New_Death) * 100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent
FROM dbo.cleaned
WHERE WHO_Region = 'AFR'
GROUP BY Country
ORDER BY Death_Rate_Percent;

SELECT WHO_Region,
SUM(New_Cases) AS New_Cases,
SUM(New_Death) AS New_Death,
ROUND((SUM(New_Death) * 100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent
FROM dbo.cleaned
GROUP BY WHO_Region
ORDER BY Death_Rate_Percent DESC

SELECT WHO_Region,
SUM(New_Cases) AS New_Cases,
SUM(New_Death) AS New_Death,
ROUND((SUM(New_Death) * 100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent,
Year
FROM dbo.cleaned
GROUP BY WHO_Region, Year
ORDER BY Year DESC,Death_Rate_Percent;

SELECT TOP 5 Country,
SUM(New_Cases) AS New_Cases,
SUM(New_Death) AS New_Death,
ROUND((SUM(New_Death) * 100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent
FROM dbo.cleaned
GROUP BY Country
ORDER BY New_Cases DESC;

SELECT SUM(New_Cases) AS Total_New_Cases, 
SUM(New_Death) AS Total_New_Death,
ROUND((SUM(New_Death)*100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent
FROM dbo.cleaned;

SELECT Country,
SUM(New_Cases) AS New_Cases, 
SUM(New_Death) AS New_Death,
ROUND((SUM(New_Death)*100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent
FROM dbo.cleaned
WHERE WHO_Region = 'AFR'
GROUP BY Country
ORDER BY Death_Rate_Percent DESC;

SELECT Country,
SUM(New_Cases) AS New_Cases,
SUM(New_Death) AS New_Death,
ROUND((SUM(New_Death) * 100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent,
Year
FROM dbo.cleaned
WHERE WHO_Region = 'AFR'
GROUP BY Country, Year
ORDER BY Year DESC,Death_Rate_Percent;

SELECT Country,
SUM(New_Cases) AS New_Cases,
SUM(New_Death) AS New_Death,
ROUND((SUM(New_Death) * 100.0)/NULLIF(SUM(New_Cases),0),2) AS Death_Rate_Percent,
Year
FROM dbo.cleaned
WHERE Country = 'Nigeria'
GROUP BY Country, Year
ORDER BY Year DESC,Death_Rate_Percent;