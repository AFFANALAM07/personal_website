Create Database Corona_Virus_Dataset;
USE corona_virus_dataset;

ALTER TABLE corona_case
CHANGE `Country/Region` Country varchar(200);

-- Q1. Write a code to check NULL values

SELECT * 
FROM corona_case
WHERE Province IS NULL 
   OR Country IS NULL 
   OR Latitude IS NULL 
   OR Longitude IS NULL 
   OR Date IS NULL 
   OR Confirmed IS NULL 
   OR Deaths IS NULL 
   OR Recovered IS NULL;
   
-- Q2. If NULL values are present, update them with zeros for all columns. 
 
 -- Note -: there is no NULL Value present in Dataset 

-- Q3. check total number of rows
SELECT 
	COUNT(*) as 'Total No. of Rows' 
FROM
    corona_case;







-- Q4. Check what is start_date and end_date
SELECT 
    MIN(Date) AS start_date,
    MAX(Date) AS end_date
FROM 
    corona_case;
    
-- Q5. Number of month present in dataset
SELECT 
	COUNT(DISTINCT DATE_FORMAT(Date, '%Y-%m') )AS 'Number of Months'
FROM 
    corona_case;
    
    
    
    
-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
    DATE_FORMAT(Date, '%Y %M') AS `MONTH`,
    AVG(Confirmed) AS 'Average Confirmed',
    AVG(Deaths) AS 'Average Deaths',
    AVG(Recovered) AS 'Average Recovered'
FROM 
    corona_case
GROUP BY 
    `MONTH`
ORDER BY 
    `MONTH`;

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 

-- Q8 Find minimum values for confirmed, deaths, recovered per year

SELECT 
      DATE_FORMAT(Date,'%Y') AS `YEAR`,
      MIN(Confirmed) AS 'MINIMUM CONFIRMED CASE',
      MIN(Deaths) AS 'MINIMUM DEATH CASE',
      MIN(Recovered) AS 'MINIMUM RECOVERD CASE'
FROM
	  corona_case
GROUP BY `YEAR`;

-- Q9. Find maximum values of confirmed, deaths, recovered per year

SELECT 
      DATE_FORMAT(Date,'%Y') AS `YEAR`,
      MAX(Confirmed) AS 'MAXIMUM CONFIRMED CASE',
      MAX(Deaths) AS 'MAXIMUM DEATH CASE',
      MAX(Recovered) AS 'MAXIMUM  RECOVERD CASE'
FROM
	  corona_case
GROUP BY `YEAR`;

-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
      DATE_FORMAT(Date,'%M %Y') AS `MONTH`,
      SUM(Confirmed) AS 'TOTAL NO. OF CONFIRMED CASE',
      SUM(Deaths) AS 'TOTAL NO. OF DEATH CASE',
      SUM(Recovered) AS 'TOTAL NO. OF  RECOVERD CASE'
FROM
	  corona_case
GROUP BY `MONTH`;

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT
    date_format(Date,'%M %Y') AS `MONTH`,
    SUM(Confirmed) AS total_confirmed_cases,
    AVG(Confirmed) AS average_confirmed_cases,
    VARIANCE(Confirmed) AS variance_confirmed_cases,
    STDDEV(Confirmed) AS stdev_confirmed_cases
FROM
    corona_case
GROUP BY `MONTH`;
    
-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
    DATE_FORMAT(Date, '%M %Y') AS MONTH,
    SUM(Deaths) AS Total_Deaths,
    AVG(Deaths) AS Average_Deaths,
    VARIANCE(Deaths) AS Variance_Deaths,
    STDDEV(Deaths) AS stdev_Deaths
FROM
    corona_case
GROUP BY
    `MONTH`;
    
-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT
    DATE_FORMAT(Date, '%M %Y') AS MONTH,
    SUM(Recovered) AS total_recovered_cases,
    AVG(Recovered) AS average_recovered_cases,
    VARIANCE(Recovered) AS variance_recovered_cases,
    STDDEV(Recovered) AS stdev_recovered_cases
FROM
    corona_case
GROUP BY 
    `MONTH`;
    
-- Q14. Find Country having highest number of the Confirmed case

SELECT 
      Country, 
      SUM(Confirmed) AS TOTAL_CONFIRMED_CASE
FROM 
	  corona_case
GROUP BY 
      Country
ORDER BY 
      `TOTAL_CONFIRMED_CASE` DESC
LIMIT 1 ;


-- Q15. Find Country having lowest number of the death case

SELECT 
      Country , 
      SUM(Deaths) AS TOTAL_DEATH_CASE
FROM 
	  corona_case
GROUP BY 
     Country 
ORDER BY 
      `TOTAL_DEATH_CASE` 
LIMIT 1
;

-- Q16. Find top 5 countries having highest recovered case
SELECT 
      Country, 
      SUM(Recovered) AS TOTAL_RECOVERED_CASE
FROM 
	  corona_case
GROUP BY 
      Country
ORDER BY 
      `TOTAL_RECOVERED_CASE` DESC
LIMIT 5
;









