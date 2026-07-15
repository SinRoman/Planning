-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "synapse_pyspark"
-- META   },
-- META   "dependencies": {
-- META     "lakehouse": {
-- META       "default_lakehouse": "a7c4854b-5be1-4bac-96fc-027168616cd9",
-- META       "default_lakehouse_name": "Revenue",
-- META       "default_lakehouse_workspace_id": "742236f7-37b8-49dc-bb20-193cf629d0ac",
-- META       "known_lakehouses": [
-- META         {
-- META           "id": "a7c4854b-5be1-4bac-96fc-027168616cd9"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- MARKDOWN ********************

-- 📅 Dim_Date


-- CELL ********************

CREATE OR REPLACE TABLE Dim_Date
AS
WITH dates AS (
  SELECT explode(
    sequence(
      to_date('2023-01-01'),
      to_date('2026-04-30'),
      interval 1 day
    )
  ) AS CalendarDate
)
SELECT
  CAST(date_format(CalendarDate, 'yyyyMMdd') AS INT)         AS DateKey,
  CalendarDate                                               AS Date,
  year(CalendarDate)                                         AS Year,
  month(CalendarDate)                                        AS MonthNumber,
  date_format(CalendarDate, 'MMM')                           AS MonthName,
  quarter(CalendarDate)                                      AS Quarter,
  dayofmonth(CalendarDate)                                   AS DayOfMonth,
  dayofweek(CalendarDate)                                    AS DayOfWeekNumber,
  date_format(CalendarDate, 'EEE')                           AS DayOfWeekName,
  weekofyear(CalendarDate)                                   AS WeekOfYear
FROM dates;

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- MARKDOWN ********************

-- 🌍 Dim_region


-- CELL ********************

CREATE OR REPLACE TABLE Dim_Region
AS
SELECT * FROM VALUES
  (1,  'Europe',        'Switzerland'),
  (2,  'Europe',        'France'),
  (3,  'Europe',        'Germany'),
  (4,  'Europe',        'United Kingdom'),
  (5,  'Europe',        'Italy'),
  (6,  'North America', 'United States'),
  (7,  'North America', 'Canada'),
  (8,  'South America', 'Brazil'),
  (9,  'South America', 'Argentina'),
  (10, 'Asia',          'India'),
  (11, 'Asia',          'Japan'),
  (12, 'Asia',          'Singapore'),
  (13, 'Asia',          'United Arab Emirates'),
  (14, 'Africa',        'South Africa'),
  (15, 'Africa',        'Morocco'),
  (16, 'Oceania',       'Australia'),
  (17, 'Oceania',       'New Zealand')
AS Dim_Region(RegionID, Continent, Country);

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- MARKDOWN ********************

-- 📦 Dim_Product


-- CELL ********************

CREATE OR REPLACE TABLE Dim_Product
AS
SELECT * FROM VALUES
  (100, 'Product A', 'Core'),
  (200, 'Product B', 'Core'),
  (300, 'Product C', 'Core'),
  (400, 'Product D', 'Premium'),
  (500, 'Product E', 'Premium'),
  (600, 'Product F', 'Services'),
  (700, 'Product G', 'Services'),
  (800, 'Product H', 'Add-on')
AS Dim_Product(ProductID, ProductName, ProductCategory);

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- MARKDOWN ********************

-- 📊 Fact Revenue

-- CELL ********************

CREATE OR REPLACE TABLE Fact_ActualRevenue
AS
WITH params AS (
  SELECT
    to_date('2023-01-01') AS start_date,
    to_date('2026-04-30') AS end_date
),
gen AS (
  SELECT
    id,
    -- Random date uniformly distributed across the range
    date_add(
      (SELECT start_date FROM params),
      CAST(
        rand(42) * datediff((SELECT end_date FROM params), (SELECT start_date FROM params))
        AS INT
      )
    ) AS d,

    -- Random RegionID from the Dim_Region list (hardcoded to match the VALUES above)
    element_at(
      array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17),
      CAST(floor(rand(43) * 17) + 1 AS INT)
    ) AS RegionID,

    -- Random ProductID from the Dim_Product list
    element_at(
      array(100,200,300,400,500,600,700,800),
      CAST(floor(rand(44) * 8) + 1 AS INT)
    ) AS ProductID,

    -- Some realistic-ish measures
    CAST(floor(rand(45) * 20) + 1 AS INT)                 AS Quantity,
    CAST(round((rand(46) * 450) + 50, 2) AS DECIMAL(18,2)) AS UnitPrice
  FROM range(10000)
)
SELECT
  CAST(date_format(d, 'yyyyMMdd') AS INT)                 AS DateKey,
  d                                                      AS Date,
  RegionID,
  ProductID,
  Quantity,
  UnitPrice,
  CAST(round(Quantity * UnitPrice, 2) AS DECIMAL(18,2))   AS ActualRevenue
FROM gen;

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }
