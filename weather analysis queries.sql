-- ================================================================
-- INDIVIDUAL COLUMN QUERIES — 1st to 4th Moment
-- Database : power_trading_project
-- Table    : iex_weather_raw
-- Total    : 76 columns x 3 queries each
--            (A) Mean + Variance + Stdev + Range + Skewness + Kurtosis
--            (B) Median
--            (C) Mode
-- ================================================================

USE power_trading_project;

-- ----------------------------------------------------------------
-- COLUMN 1: Hour
-- ----------------------------------------------------------------

-- 1A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Hour`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Hour`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Hour`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Hour`) - MIN(`Hour`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Hour` - (SELECT AVG(`Hour`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Hour`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Hour` - (SELECT AVG(`Hour`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Hour`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 1B. Median
SELECT ROUND(AVG(`Hour`), 4) AS median_value
FROM (
  SELECT `Hour`,
         ROW_NUMBER() OVER (ORDER BY `Hour`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Hour` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 1C. Mode
SELECT `Hour` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Hour` IS NOT NULL
GROUP BY `Hour`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 2: Purchase Bid (MW)
-- ----------------------------------------------------------------

-- 2A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Purchase Bid (MW)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Purchase Bid (MW)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Purchase Bid (MW)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Purchase Bid (MW)`) - MIN(`Purchase Bid (MW)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Purchase Bid (MW)` - (SELECT AVG(`Purchase Bid (MW)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Purchase Bid (MW)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Purchase Bid (MW)` - (SELECT AVG(`Purchase Bid (MW)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Purchase Bid (MW)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 2B. Median
SELECT ROUND(AVG(`Purchase Bid (MW)`), 4) AS median_value
FROM (
  SELECT `Purchase Bid (MW)`,
         ROW_NUMBER() OVER (ORDER BY `Purchase Bid (MW)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Purchase Bid (MW)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 2C. Mode
SELECT `Purchase Bid (MW)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Purchase Bid (MW)` IS NOT NULL
GROUP BY `Purchase Bid (MW)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 3: Sell Bid (MW)
-- ----------------------------------------------------------------

-- 3A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Sell Bid (MW)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Sell Bid (MW)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Sell Bid (MW)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Sell Bid (MW)`) - MIN(`Sell Bid (MW)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Sell Bid (MW)` - (SELECT AVG(`Sell Bid (MW)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Sell Bid (MW)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Sell Bid (MW)` - (SELECT AVG(`Sell Bid (MW)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Sell Bid (MW)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 3B. Median
SELECT ROUND(AVG(`Sell Bid (MW)`), 4) AS median_value
FROM (
  SELECT `Sell Bid (MW)`,
         ROW_NUMBER() OVER (ORDER BY `Sell Bid (MW)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Sell Bid (MW)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 3C. Mode
SELECT `Sell Bid (MW)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Sell Bid (MW)` IS NOT NULL
GROUP BY `Sell Bid (MW)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 4: MCV (MW)
-- ----------------------------------------------------------------

-- 4A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`MCV (MW)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`MCV (MW)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`MCV (MW)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`MCV (MW)`) - MIN(`MCV (MW)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`MCV (MW)` - (SELECT AVG(`MCV (MW)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`MCV (MW)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`MCV (MW)` - (SELECT AVG(`MCV (MW)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`MCV (MW)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 4B. Median
SELECT ROUND(AVG(`MCV (MW)`), 4) AS median_value
FROM (
  SELECT `MCV (MW)`,
         ROW_NUMBER() OVER (ORDER BY `MCV (MW)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `MCV (MW)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 4C. Mode
SELECT `MCV (MW)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `MCV (MW)` IS NOT NULL
GROUP BY `MCV (MW)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 5: Final Scheduled Volume (MW)
-- ----------------------------------------------------------------

-- 5A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Final Scheduled Volume (MW)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Final Scheduled Volume (MW)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Final Scheduled Volume (MW)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Final Scheduled Volume (MW)`) - MIN(`Final Scheduled Volume (MW)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Final Scheduled Volume (MW)` - (SELECT AVG(`Final Scheduled Volume (MW)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Final Scheduled Volume (MW)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Final Scheduled Volume (MW)` - (SELECT AVG(`Final Scheduled Volume (MW)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Final Scheduled Volume (MW)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 5B. Median
SELECT ROUND(AVG(`Final Scheduled Volume (MW)`), 4) AS median_value
FROM (
  SELECT `Final Scheduled Volume (MW)`,
         ROW_NUMBER() OVER (ORDER BY `Final Scheduled Volume (MW)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Final Scheduled Volume (MW)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 5C. Mode
SELECT `Final Scheduled Volume (MW)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Final Scheduled Volume (MW)` IS NOT NULL
GROUP BY `Final Scheduled Volume (MW)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 6: MCP (Rs/MWh) *
-- ----------------------------------------------------------------

-- 6A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`MCP (Rs/MWh) *`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`MCP (Rs/MWh) *`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`MCP (Rs/MWh) *`), 4)                                                   AS stdev_value,
  ROUND(MAX(`MCP (Rs/MWh) *`) - MIN(`MCP (Rs/MWh) *`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`MCP (Rs/MWh) *` - (SELECT AVG(`MCP (Rs/MWh) *`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`MCP (Rs/MWh) *`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`MCP (Rs/MWh) *` - (SELECT AVG(`MCP (Rs/MWh) *`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`MCP (Rs/MWh) *`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 6B. Median
SELECT ROUND(AVG(`MCP (Rs/MWh) *`), 4) AS median_value
FROM (
  SELECT `MCP (Rs/MWh) *`,
         ROW_NUMBER() OVER (ORDER BY `MCP (Rs/MWh) *`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `MCP (Rs/MWh) *` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 6C. Mode
SELECT `MCP (Rs/MWh) *` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `MCP (Rs/MWh) *` IS NOT NULL
GROUP BY `MCP (Rs/MWh) *`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 7: Mundra_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 7A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mundra_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mundra_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mundra_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mundra_temperature_2m (°C)`) - MIN(`Mundra_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mundra_temperature_2m (°C)` - (SELECT AVG(`Mundra_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mundra_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mundra_temperature_2m (°C)` - (SELECT AVG(`Mundra_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mundra_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 7B. Median
SELECT ROUND(AVG(`Mundra_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Mundra_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Mundra_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mundra_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 7C. Mode
SELECT `Mundra_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mundra_temperature_2m (°C)` IS NOT NULL
GROUP BY `Mundra_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 8: Mundra_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 8A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mundra_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mundra_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mundra_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mundra_relative_humidity_2m (%)`) - MIN(`Mundra_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mundra_relative_humidity_2m (%)` - (SELECT AVG(`Mundra_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mundra_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mundra_relative_humidity_2m (%)` - (SELECT AVG(`Mundra_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mundra_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 8B. Median
SELECT ROUND(AVG(`Mundra_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Mundra_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Mundra_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mundra_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 8C. Mode
SELECT `Mundra_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mundra_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Mundra_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 9: Mundra_cloud_cover (%)
-- ----------------------------------------------------------------

-- 9A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mundra_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mundra_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mundra_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mundra_cloud_cover (%)`) - MIN(`Mundra_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mundra_cloud_cover (%)` - (SELECT AVG(`Mundra_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mundra_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mundra_cloud_cover (%)` - (SELECT AVG(`Mundra_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mundra_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 9B. Median
SELECT ROUND(AVG(`Mundra_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Mundra_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Mundra_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mundra_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 9C. Mode
SELECT `Mundra_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mundra_cloud_cover (%)` IS NOT NULL
GROUP BY `Mundra_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 10: Mundra_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 10A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mundra_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mundra_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mundra_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mundra_wind_speed_10m (km/h)`) - MIN(`Mundra_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mundra_wind_speed_10m (km/h)` - (SELECT AVG(`Mundra_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mundra_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mundra_wind_speed_10m (km/h)` - (SELECT AVG(`Mundra_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mundra_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 10B. Median
SELECT ROUND(AVG(`Mundra_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Mundra_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Mundra_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mundra_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 10C. Mode
SELECT `Mundra_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mundra_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Mundra_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 11: Mundra_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 11A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mundra_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mundra_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mundra_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mundra_shortwave_radiation (W/m²)`) - MIN(`Mundra_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mundra_shortwave_radiation (W/m²)` - (SELECT AVG(`Mundra_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mundra_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mundra_shortwave_radiation (W/m²)` - (SELECT AVG(`Mundra_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mundra_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 11B. Median
SELECT ROUND(AVG(`Mundra_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Mundra_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Mundra_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mundra_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 11C. Mode
SELECT `Mundra_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mundra_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Mundra_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 12: RamaGundem_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 12A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`RamaGundem_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`RamaGundem_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`RamaGundem_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`RamaGundem_temperature_2m (°C)`) - MIN(`RamaGundem_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`RamaGundem_temperature_2m (°C)` - (SELECT AVG(`RamaGundem_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`RamaGundem_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`RamaGundem_temperature_2m (°C)` - (SELECT AVG(`RamaGundem_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`RamaGundem_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 12B. Median
SELECT ROUND(AVG(`RamaGundem_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `RamaGundem_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `RamaGundem_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `RamaGundem_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 12C. Mode
SELECT `RamaGundem_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `RamaGundem_temperature_2m (°C)` IS NOT NULL
GROUP BY `RamaGundem_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 13: RamaGundem_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 13A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`RamaGundem_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`RamaGundem_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`RamaGundem_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`RamaGundem_relative_humidity_2m (%)`) - MIN(`RamaGundem_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`RamaGundem_relative_humidity_2m (%)` - (SELECT AVG(`RamaGundem_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`RamaGundem_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`RamaGundem_relative_humidity_2m (%)` - (SELECT AVG(`RamaGundem_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`RamaGundem_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 13B. Median
SELECT ROUND(AVG(`RamaGundem_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `RamaGundem_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `RamaGundem_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `RamaGundem_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 13C. Mode
SELECT `RamaGundem_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `RamaGundem_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `RamaGundem_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 14: RamaGundem_cloud_cover (%)
-- ----------------------------------------------------------------

-- 14A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`RamaGundem_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`RamaGundem_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`RamaGundem_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`RamaGundem_cloud_cover (%)`) - MIN(`RamaGundem_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`RamaGundem_cloud_cover (%)` - (SELECT AVG(`RamaGundem_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`RamaGundem_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`RamaGundem_cloud_cover (%)` - (SELECT AVG(`RamaGundem_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`RamaGundem_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 14B. Median
SELECT ROUND(AVG(`RamaGundem_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `RamaGundem_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `RamaGundem_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `RamaGundem_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 14C. Mode
SELECT `RamaGundem_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `RamaGundem_cloud_cover (%)` IS NOT NULL
GROUP BY `RamaGundem_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 15: RamaGundem_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 15A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`RamaGundem_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`RamaGundem_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`RamaGundem_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`RamaGundem_wind_speed_10m (km/h)`) - MIN(`RamaGundem_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`RamaGundem_wind_speed_10m (km/h)` - (SELECT AVG(`RamaGundem_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`RamaGundem_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`RamaGundem_wind_speed_10m (km/h)` - (SELECT AVG(`RamaGundem_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`RamaGundem_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 15B. Median
SELECT ROUND(AVG(`RamaGundem_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `RamaGundem_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `RamaGundem_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `RamaGundem_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 15C. Mode
SELECT `RamaGundem_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `RamaGundem_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `RamaGundem_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 16: RamaGundem_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 16A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`RamaGundem_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`RamaGundem_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`RamaGundem_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`RamaGundem_shortwave_radiation (W/m²)`) - MIN(`RamaGundem_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`RamaGundem_shortwave_radiation (W/m²)` - (SELECT AVG(`RamaGundem_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`RamaGundem_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`RamaGundem_shortwave_radiation (W/m²)` - (SELECT AVG(`RamaGundem_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`RamaGundem_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 16B. Median
SELECT ROUND(AVG(`RamaGundem_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `RamaGundem_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `RamaGundem_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `RamaGundem_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 16C. Mode
SELECT `RamaGundem_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `RamaGundem_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `RamaGundem_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 17: Vindhyachal_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 17A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Vindhyachal_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Vindhyachal_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Vindhyachal_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Vindhyachal_temperature_2m (°C)`) - MIN(`Vindhyachal_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Vindhyachal_temperature_2m (°C)` - (SELECT AVG(`Vindhyachal_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Vindhyachal_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Vindhyachal_temperature_2m (°C)` - (SELECT AVG(`Vindhyachal_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Vindhyachal_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 17B. Median
SELECT ROUND(AVG(`Vindhyachal_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Vindhyachal_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Vindhyachal_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Vindhyachal_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 17C. Mode
SELECT `Vindhyachal_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Vindhyachal_temperature_2m (°C)` IS NOT NULL
GROUP BY `Vindhyachal_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 18: Vindhyachal_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 18A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Vindhyachal_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Vindhyachal_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Vindhyachal_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Vindhyachal_relative_humidity_2m (%)`) - MIN(`Vindhyachal_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Vindhyachal_relative_humidity_2m (%)` - (SELECT AVG(`Vindhyachal_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Vindhyachal_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Vindhyachal_relative_humidity_2m (%)` - (SELECT AVG(`Vindhyachal_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Vindhyachal_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 18B. Median
SELECT ROUND(AVG(`Vindhyachal_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Vindhyachal_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Vindhyachal_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Vindhyachal_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 18C. Mode
SELECT `Vindhyachal_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Vindhyachal_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Vindhyachal_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 19: Vindhyachal_cloud_cover (%)
-- ----------------------------------------------------------------

-- 19A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Vindhyachal_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Vindhyachal_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Vindhyachal_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Vindhyachal_cloud_cover (%)`) - MIN(`Vindhyachal_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Vindhyachal_cloud_cover (%)` - (SELECT AVG(`Vindhyachal_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Vindhyachal_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Vindhyachal_cloud_cover (%)` - (SELECT AVG(`Vindhyachal_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Vindhyachal_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 19B. Median
SELECT ROUND(AVG(`Vindhyachal_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Vindhyachal_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Vindhyachal_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Vindhyachal_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 19C. Mode
SELECT `Vindhyachal_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Vindhyachal_cloud_cover (%)` IS NOT NULL
GROUP BY `Vindhyachal_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 20: Vindhyachal_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 20A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Vindhyachal_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Vindhyachal_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Vindhyachal_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Vindhyachal_wind_speed_10m (km/h)`) - MIN(`Vindhyachal_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Vindhyachal_wind_speed_10m (km/h)` - (SELECT AVG(`Vindhyachal_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Vindhyachal_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Vindhyachal_wind_speed_10m (km/h)` - (SELECT AVG(`Vindhyachal_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Vindhyachal_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 20B. Median
SELECT ROUND(AVG(`Vindhyachal_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Vindhyachal_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Vindhyachal_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Vindhyachal_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 20C. Mode
SELECT `Vindhyachal_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Vindhyachal_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Vindhyachal_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 21: Vindhyachal_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 21A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Vindhyachal_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Vindhyachal_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Vindhyachal_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Vindhyachal_shortwave_radiation (W/m²)`) - MIN(`Vindhyachal_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Vindhyachal_shortwave_radiation (W/m²)` - (SELECT AVG(`Vindhyachal_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Vindhyachal_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Vindhyachal_shortwave_radiation (W/m²)` - (SELECT AVG(`Vindhyachal_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Vindhyachal_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 21B. Median
SELECT ROUND(AVG(`Vindhyachal_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Vindhyachal_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Vindhyachal_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Vindhyachal_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 21C. Mode
SELECT `Vindhyachal_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Vindhyachal_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Vindhyachal_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 22: Bhadla_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 22A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Bhadla_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Bhadla_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Bhadla_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Bhadla_temperature_2m (°C)`) - MIN(`Bhadla_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Bhadla_temperature_2m (°C)` - (SELECT AVG(`Bhadla_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Bhadla_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Bhadla_temperature_2m (°C)` - (SELECT AVG(`Bhadla_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Bhadla_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 22B. Median
SELECT ROUND(AVG(`Bhadla_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Bhadla_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Bhadla_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Bhadla_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 22C. Mode
SELECT `Bhadla_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Bhadla_temperature_2m (°C)` IS NOT NULL
GROUP BY `Bhadla_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 23: Bhadla_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 23A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Bhadla_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Bhadla_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Bhadla_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Bhadla_relative_humidity_2m (%)`) - MIN(`Bhadla_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Bhadla_relative_humidity_2m (%)` - (SELECT AVG(`Bhadla_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Bhadla_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Bhadla_relative_humidity_2m (%)` - (SELECT AVG(`Bhadla_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Bhadla_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 23B. Median
SELECT ROUND(AVG(`Bhadla_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Bhadla_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Bhadla_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Bhadla_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 23C. Mode
SELECT `Bhadla_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Bhadla_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Bhadla_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 24: Bhadla_cloud_cover (%)
-- ----------------------------------------------------------------

-- 24A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Bhadla_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Bhadla_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Bhadla_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Bhadla_cloud_cover (%)`) - MIN(`Bhadla_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Bhadla_cloud_cover (%)` - (SELECT AVG(`Bhadla_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Bhadla_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Bhadla_cloud_cover (%)` - (SELECT AVG(`Bhadla_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Bhadla_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 24B. Median
SELECT ROUND(AVG(`Bhadla_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Bhadla_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Bhadla_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Bhadla_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 24C. Mode
SELECT `Bhadla_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Bhadla_cloud_cover (%)` IS NOT NULL
GROUP BY `Bhadla_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 25: Bhadla_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 25A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Bhadla_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Bhadla_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Bhadla_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Bhadla_wind_speed_10m (km/h)`) - MIN(`Bhadla_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Bhadla_wind_speed_10m (km/h)` - (SELECT AVG(`Bhadla_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Bhadla_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Bhadla_wind_speed_10m (km/h)` - (SELECT AVG(`Bhadla_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Bhadla_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 25B. Median
SELECT ROUND(AVG(`Bhadla_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Bhadla_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Bhadla_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Bhadla_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 25C. Mode
SELECT `Bhadla_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Bhadla_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Bhadla_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 26: Bhadla_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 26A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Bhadla_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Bhadla_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Bhadla_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Bhadla_shortwave_radiation (W/m²)`) - MIN(`Bhadla_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Bhadla_shortwave_radiation (W/m²)` - (SELECT AVG(`Bhadla_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Bhadla_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Bhadla_shortwave_radiation (W/m²)` - (SELECT AVG(`Bhadla_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Bhadla_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 26B. Median
SELECT ROUND(AVG(`Bhadla_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Bhadla_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Bhadla_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Bhadla_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 26C. Mode
SELECT `Bhadla_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Bhadla_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Bhadla_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 27: Akaltara_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 27A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Akaltara_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Akaltara_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Akaltara_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Akaltara_temperature_2m (°C)`) - MIN(`Akaltara_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Akaltara_temperature_2m (°C)` - (SELECT AVG(`Akaltara_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Akaltara_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Akaltara_temperature_2m (°C)` - (SELECT AVG(`Akaltara_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Akaltara_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 27B. Median
SELECT ROUND(AVG(`Akaltara_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Akaltara_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Akaltara_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Akaltara_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 27C. Mode
SELECT `Akaltara_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Akaltara_temperature_2m (°C)` IS NOT NULL
GROUP BY `Akaltara_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 28: Akaltara_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 28A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Akaltara_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Akaltara_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Akaltara_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Akaltara_relative_humidity_2m (%)`) - MIN(`Akaltara_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Akaltara_relative_humidity_2m (%)` - (SELECT AVG(`Akaltara_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Akaltara_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Akaltara_relative_humidity_2m (%)` - (SELECT AVG(`Akaltara_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Akaltara_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 28B. Median
SELECT ROUND(AVG(`Akaltara_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Akaltara_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Akaltara_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Akaltara_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 28C. Mode
SELECT `Akaltara_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Akaltara_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Akaltara_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 29: Akaltara_cloud_cover (%)
-- ----------------------------------------------------------------

-- 29A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Akaltara_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Akaltara_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Akaltara_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Akaltara_cloud_cover (%)`) - MIN(`Akaltara_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Akaltara_cloud_cover (%)` - (SELECT AVG(`Akaltara_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Akaltara_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Akaltara_cloud_cover (%)` - (SELECT AVG(`Akaltara_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Akaltara_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 29B. Median
SELECT ROUND(AVG(`Akaltara_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Akaltara_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Akaltara_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Akaltara_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 29C. Mode
SELECT `Akaltara_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Akaltara_cloud_cover (%)` IS NOT NULL
GROUP BY `Akaltara_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 30: Akaltara_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 30A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Akaltara_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Akaltara_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Akaltara_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Akaltara_wind_speed_10m (km/h)`) - MIN(`Akaltara_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Akaltara_wind_speed_10m (km/h)` - (SELECT AVG(`Akaltara_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Akaltara_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Akaltara_wind_speed_10m (km/h)` - (SELECT AVG(`Akaltara_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Akaltara_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 30B. Median
SELECT ROUND(AVG(`Akaltara_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Akaltara_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Akaltara_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Akaltara_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 30C. Mode
SELECT `Akaltara_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Akaltara_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Akaltara_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 31: Akaltara_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 31A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Akaltara_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Akaltara_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Akaltara_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Akaltara_shortwave_radiation (W/m²)`) - MIN(`Akaltara_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Akaltara_shortwave_radiation (W/m²)` - (SELECT AVG(`Akaltara_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Akaltara_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Akaltara_shortwave_radiation (W/m²)` - (SELECT AVG(`Akaltara_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Akaltara_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 31B. Median
SELECT ROUND(AVG(`Akaltara_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Akaltara_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Akaltara_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Akaltara_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 31C. Mode
SELECT `Akaltara_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Akaltara_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Akaltara_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 32: Khavda_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 32A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Khavda_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Khavda_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Khavda_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Khavda_temperature_2m (°C)`) - MIN(`Khavda_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Khavda_temperature_2m (°C)` - (SELECT AVG(`Khavda_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Khavda_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Khavda_temperature_2m (°C)` - (SELECT AVG(`Khavda_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Khavda_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 32B. Median
SELECT ROUND(AVG(`Khavda_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Khavda_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Khavda_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Khavda_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 32C. Mode
SELECT `Khavda_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Khavda_temperature_2m (°C)` IS NOT NULL
GROUP BY `Khavda_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 33: Khavda_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 33A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Khavda_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Khavda_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Khavda_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Khavda_relative_humidity_2m (%)`) - MIN(`Khavda_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Khavda_relative_humidity_2m (%)` - (SELECT AVG(`Khavda_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Khavda_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Khavda_relative_humidity_2m (%)` - (SELECT AVG(`Khavda_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Khavda_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 33B. Median
SELECT ROUND(AVG(`Khavda_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Khavda_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Khavda_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Khavda_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 33C. Mode
SELECT `Khavda_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Khavda_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Khavda_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 34: Khavda_cloud_cover (%)
-- ----------------------------------------------------------------

-- 34A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Khavda_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Khavda_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Khavda_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Khavda_cloud_cover (%)`) - MIN(`Khavda_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Khavda_cloud_cover (%)` - (SELECT AVG(`Khavda_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Khavda_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Khavda_cloud_cover (%)` - (SELECT AVG(`Khavda_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Khavda_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 34B. Median
SELECT ROUND(AVG(`Khavda_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Khavda_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Khavda_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Khavda_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 34C. Mode
SELECT `Khavda_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Khavda_cloud_cover (%)` IS NOT NULL
GROUP BY `Khavda_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 35: Khavda_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 35A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Khavda_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Khavda_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Khavda_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Khavda_wind_speed_10m (km/h)`) - MIN(`Khavda_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Khavda_wind_speed_10m (km/h)` - (SELECT AVG(`Khavda_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Khavda_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Khavda_wind_speed_10m (km/h)` - (SELECT AVG(`Khavda_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Khavda_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 35B. Median
SELECT ROUND(AVG(`Khavda_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Khavda_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Khavda_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Khavda_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 35C. Mode
SELECT `Khavda_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Khavda_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Khavda_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 36: Khavda_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 36A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Khavda_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Khavda_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Khavda_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Khavda_shortwave_radiation (W/m²)`) - MIN(`Khavda_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Khavda_shortwave_radiation (W/m²)` - (SELECT AVG(`Khavda_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Khavda_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Khavda_shortwave_radiation (W/m²)` - (SELECT AVG(`Khavda_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Khavda_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 36B. Median
SELECT ROUND(AVG(`Khavda_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Khavda_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Khavda_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Khavda_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 36C. Mode
SELECT `Khavda_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Khavda_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Khavda_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 37: Muppandal_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 37A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Muppandal_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Muppandal_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Muppandal_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Muppandal_temperature_2m (°C)`) - MIN(`Muppandal_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Muppandal_temperature_2m (°C)` - (SELECT AVG(`Muppandal_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Muppandal_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Muppandal_temperature_2m (°C)` - (SELECT AVG(`Muppandal_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Muppandal_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 37B. Median
SELECT ROUND(AVG(`Muppandal_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Muppandal_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Muppandal_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Muppandal_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 37C. Mode
SELECT `Muppandal_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Muppandal_temperature_2m (°C)` IS NOT NULL
GROUP BY `Muppandal_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 38: Muppandal_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 38A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Muppandal_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Muppandal_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Muppandal_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Muppandal_relative_humidity_2m (%)`) - MIN(`Muppandal_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Muppandal_relative_humidity_2m (%)` - (SELECT AVG(`Muppandal_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Muppandal_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Muppandal_relative_humidity_2m (%)` - (SELECT AVG(`Muppandal_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Muppandal_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 38B. Median
SELECT ROUND(AVG(`Muppandal_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Muppandal_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Muppandal_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Muppandal_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 38C. Mode
SELECT `Muppandal_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Muppandal_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Muppandal_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 39: Muppandal_cloud_cover (%)
-- ----------------------------------------------------------------

-- 39A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Muppandal_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Muppandal_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Muppandal_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Muppandal_cloud_cover (%)`) - MIN(`Muppandal_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Muppandal_cloud_cover (%)` - (SELECT AVG(`Muppandal_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Muppandal_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Muppandal_cloud_cover (%)` - (SELECT AVG(`Muppandal_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Muppandal_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 39B. Median
SELECT ROUND(AVG(`Muppandal_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Muppandal_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Muppandal_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Muppandal_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 39C. Mode
SELECT `Muppandal_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Muppandal_cloud_cover (%)` IS NOT NULL
GROUP BY `Muppandal_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 40: Muppandal_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 40A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Muppandal_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Muppandal_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Muppandal_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Muppandal_wind_speed_10m (km/h)`) - MIN(`Muppandal_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Muppandal_wind_speed_10m (km/h)` - (SELECT AVG(`Muppandal_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Muppandal_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Muppandal_wind_speed_10m (km/h)` - (SELECT AVG(`Muppandal_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Muppandal_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 40B. Median
SELECT ROUND(AVG(`Muppandal_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Muppandal_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Muppandal_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Muppandal_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 40C. Mode
SELECT `Muppandal_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Muppandal_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Muppandal_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 41: Muppandal_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 41A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Muppandal_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Muppandal_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Muppandal_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Muppandal_shortwave_radiation (W/m²)`) - MIN(`Muppandal_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Muppandal_shortwave_radiation (W/m²)` - (SELECT AVG(`Muppandal_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Muppandal_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Muppandal_shortwave_radiation (W/m²)` - (SELECT AVG(`Muppandal_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Muppandal_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 41B. Median
SELECT ROUND(AVG(`Muppandal_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Muppandal_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Muppandal_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Muppandal_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 41C. Mode
SELECT `Muppandal_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Muppandal_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Muppandal_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 42: Srisailam_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 42A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Srisailam_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Srisailam_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Srisailam_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Srisailam_temperature_2m (°C)`) - MIN(`Srisailam_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Srisailam_temperature_2m (°C)` - (SELECT AVG(`Srisailam_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Srisailam_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Srisailam_temperature_2m (°C)` - (SELECT AVG(`Srisailam_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Srisailam_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 42B. Median
SELECT ROUND(AVG(`Srisailam_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Srisailam_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Srisailam_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Srisailam_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 42C. Mode
SELECT `Srisailam_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Srisailam_temperature_2m (°C)` IS NOT NULL
GROUP BY `Srisailam_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 43: Srisailam_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 43A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Srisailam_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Srisailam_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Srisailam_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Srisailam_relative_humidity_2m (%)`) - MIN(`Srisailam_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Srisailam_relative_humidity_2m (%)` - (SELECT AVG(`Srisailam_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Srisailam_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Srisailam_relative_humidity_2m (%)` - (SELECT AVG(`Srisailam_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Srisailam_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 43B. Median
SELECT ROUND(AVG(`Srisailam_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Srisailam_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Srisailam_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Srisailam_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 43C. Mode
SELECT `Srisailam_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Srisailam_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Srisailam_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 44: Srisailam_cloud_cover (%)
-- ----------------------------------------------------------------

-- 44A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Srisailam_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Srisailam_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Srisailam_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Srisailam_cloud_cover (%)`) - MIN(`Srisailam_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Srisailam_cloud_cover (%)` - (SELECT AVG(`Srisailam_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Srisailam_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Srisailam_cloud_cover (%)` - (SELECT AVG(`Srisailam_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Srisailam_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 44B. Median
SELECT ROUND(AVG(`Srisailam_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Srisailam_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Srisailam_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Srisailam_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 44C. Mode
SELECT `Srisailam_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Srisailam_cloud_cover (%)` IS NOT NULL
GROUP BY `Srisailam_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 45: Srisailam_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 45A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Srisailam_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Srisailam_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Srisailam_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Srisailam_wind_speed_10m (km/h)`) - MIN(`Srisailam_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Srisailam_wind_speed_10m (km/h)` - (SELECT AVG(`Srisailam_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Srisailam_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Srisailam_wind_speed_10m (km/h)` - (SELECT AVG(`Srisailam_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Srisailam_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 45B. Median
SELECT ROUND(AVG(`Srisailam_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Srisailam_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Srisailam_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Srisailam_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 45C. Mode
SELECT `Srisailam_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Srisailam_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Srisailam_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 46: Srisailam_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 46A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Srisailam_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Srisailam_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Srisailam_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Srisailam_shortwave_radiation (W/m²)`) - MIN(`Srisailam_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Srisailam_shortwave_radiation (W/m²)` - (SELECT AVG(`Srisailam_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Srisailam_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Srisailam_shortwave_radiation (W/m²)` - (SELECT AVG(`Srisailam_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Srisailam_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 46B. Median
SELECT ROUND(AVG(`Srisailam_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Srisailam_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Srisailam_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Srisailam_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 46C. Mode
SELECT `Srisailam_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Srisailam_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Srisailam_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 47: Tehri_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 47A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Tehri_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Tehri_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Tehri_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Tehri_temperature_2m (°C)`) - MIN(`Tehri_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Tehri_temperature_2m (°C)` - (SELECT AVG(`Tehri_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Tehri_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Tehri_temperature_2m (°C)` - (SELECT AVG(`Tehri_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Tehri_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 47B. Median
SELECT ROUND(AVG(`Tehri_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Tehri_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Tehri_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Tehri_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 47C. Mode
SELECT `Tehri_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Tehri_temperature_2m (°C)` IS NOT NULL
GROUP BY `Tehri_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 48: Tehri_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 48A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Tehri_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Tehri_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Tehri_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Tehri_relative_humidity_2m (%)`) - MIN(`Tehri_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Tehri_relative_humidity_2m (%)` - (SELECT AVG(`Tehri_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Tehri_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Tehri_relative_humidity_2m (%)` - (SELECT AVG(`Tehri_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Tehri_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 48B. Median
SELECT ROUND(AVG(`Tehri_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Tehri_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Tehri_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Tehri_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 48C. Mode
SELECT `Tehri_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Tehri_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Tehri_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 49: Tehri_cloud_cover (%)
-- ----------------------------------------------------------------

-- 49A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Tehri_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Tehri_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Tehri_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Tehri_cloud_cover (%)`) - MIN(`Tehri_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Tehri_cloud_cover (%)` - (SELECT AVG(`Tehri_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Tehri_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Tehri_cloud_cover (%)` - (SELECT AVG(`Tehri_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Tehri_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 49B. Median
SELECT ROUND(AVG(`Tehri_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Tehri_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Tehri_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Tehri_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 49C. Mode
SELECT `Tehri_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Tehri_cloud_cover (%)` IS NOT NULL
GROUP BY `Tehri_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 50: Tehri_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 50A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Tehri_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Tehri_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Tehri_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Tehri_wind_speed_10m (km/h)`) - MIN(`Tehri_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Tehri_wind_speed_10m (km/h)` - (SELECT AVG(`Tehri_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Tehri_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Tehri_wind_speed_10m (km/h)` - (SELECT AVG(`Tehri_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Tehri_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 50B. Median
SELECT ROUND(AVG(`Tehri_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Tehri_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Tehri_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Tehri_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 50C. Mode
SELECT `Tehri_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Tehri_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Tehri_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 51: Tehri_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 51A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Tehri_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Tehri_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Tehri_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Tehri_shortwave_radiation (W/m²)`) - MIN(`Tehri_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Tehri_shortwave_radiation (W/m²)` - (SELECT AVG(`Tehri_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Tehri_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Tehri_shortwave_radiation (W/m²)` - (SELECT AVG(`Tehri_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Tehri_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 51B. Median
SELECT ROUND(AVG(`Tehri_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Tehri_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Tehri_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Tehri_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 51C. Mode
SELECT `Tehri_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Tehri_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Tehri_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 52: Blr_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 52A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Blr_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Blr_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Blr_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Blr_temperature_2m (°C)`) - MIN(`Blr_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Blr_temperature_2m (°C)` - (SELECT AVG(`Blr_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Blr_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Blr_temperature_2m (°C)` - (SELECT AVG(`Blr_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Blr_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 52B. Median
SELECT ROUND(AVG(`Blr_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Blr_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Blr_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Blr_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 52C. Mode
SELECT `Blr_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Blr_temperature_2m (°C)` IS NOT NULL
GROUP BY `Blr_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 53: Blr_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 53A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Blr_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Blr_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Blr_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Blr_relative_humidity_2m (%)`) - MIN(`Blr_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Blr_relative_humidity_2m (%)` - (SELECT AVG(`Blr_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Blr_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Blr_relative_humidity_2m (%)` - (SELECT AVG(`Blr_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Blr_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 53B. Median
SELECT ROUND(AVG(`Blr_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Blr_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Blr_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Blr_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 53C. Mode
SELECT `Blr_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Blr_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Blr_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 54: Blr_cloud_cover (%)
-- ----------------------------------------------------------------

-- 54A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Blr_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Blr_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Blr_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Blr_cloud_cover (%)`) - MIN(`Blr_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Blr_cloud_cover (%)` - (SELECT AVG(`Blr_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Blr_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Blr_cloud_cover (%)` - (SELECT AVG(`Blr_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Blr_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 54B. Median
SELECT ROUND(AVG(`Blr_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Blr_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Blr_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Blr_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 54C. Mode
SELECT `Blr_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Blr_cloud_cover (%)` IS NOT NULL
GROUP BY `Blr_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 55: Blr_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 55A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Blr_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Blr_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Blr_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Blr_wind_speed_10m (km/h)`) - MIN(`Blr_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Blr_wind_speed_10m (km/h)` - (SELECT AVG(`Blr_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Blr_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Blr_wind_speed_10m (km/h)` - (SELECT AVG(`Blr_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Blr_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 55B. Median
SELECT ROUND(AVG(`Blr_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Blr_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Blr_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Blr_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 55C. Mode
SELECT `Blr_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Blr_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Blr_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 56: Blr_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 56A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Blr_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Blr_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Blr_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Blr_shortwave_radiation (W/m²)`) - MIN(`Blr_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Blr_shortwave_radiation (W/m²)` - (SELECT AVG(`Blr_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Blr_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Blr_shortwave_radiation (W/m²)` - (SELECT AVG(`Blr_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Blr_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 56B. Median
SELECT ROUND(AVG(`Blr_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Blr_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Blr_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Blr_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 56C. Mode
SELECT `Blr_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Blr_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Blr_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 57: Chn_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 57A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Chn_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Chn_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Chn_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Chn_temperature_2m (°C)`) - MIN(`Chn_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Chn_temperature_2m (°C)` - (SELECT AVG(`Chn_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Chn_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Chn_temperature_2m (°C)` - (SELECT AVG(`Chn_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Chn_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 57B. Median
SELECT ROUND(AVG(`Chn_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Chn_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Chn_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Chn_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 57C. Mode
SELECT `Chn_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Chn_temperature_2m (°C)` IS NOT NULL
GROUP BY `Chn_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 58: Chn_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 58A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Chn_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Chn_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Chn_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Chn_relative_humidity_2m (%)`) - MIN(`Chn_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Chn_relative_humidity_2m (%)` - (SELECT AVG(`Chn_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Chn_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Chn_relative_humidity_2m (%)` - (SELECT AVG(`Chn_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Chn_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 58B. Median
SELECT ROUND(AVG(`Chn_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Chn_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Chn_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Chn_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 58C. Mode
SELECT `Chn_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Chn_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Chn_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 59: Chn_cloud_cover (%)
-- ----------------------------------------------------------------

-- 59A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Chn_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Chn_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Chn_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Chn_cloud_cover (%)`) - MIN(`Chn_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Chn_cloud_cover (%)` - (SELECT AVG(`Chn_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Chn_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Chn_cloud_cover (%)` - (SELECT AVG(`Chn_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Chn_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 59B. Median
SELECT ROUND(AVG(`Chn_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Chn_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Chn_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Chn_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 59C. Mode
SELECT `Chn_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Chn_cloud_cover (%)` IS NOT NULL
GROUP BY `Chn_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 60: Chn_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 60A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Chn_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Chn_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Chn_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Chn_wind_speed_10m (km/h)`) - MIN(`Chn_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Chn_wind_speed_10m (km/h)` - (SELECT AVG(`Chn_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Chn_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Chn_wind_speed_10m (km/h)` - (SELECT AVG(`Chn_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Chn_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 60B. Median
SELECT ROUND(AVG(`Chn_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Chn_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Chn_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Chn_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 60C. Mode
SELECT `Chn_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Chn_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Chn_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 61: Chn_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 61A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Chn_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Chn_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Chn_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Chn_shortwave_radiation (W/m²)`) - MIN(`Chn_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Chn_shortwave_radiation (W/m²)` - (SELECT AVG(`Chn_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Chn_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Chn_shortwave_radiation (W/m²)` - (SELECT AVG(`Chn_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Chn_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 61B. Median
SELECT ROUND(AVG(`Chn_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Chn_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Chn_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Chn_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 61C. Mode
SELECT `Chn_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Chn_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Chn_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 62: Delhi_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 62A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Delhi_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Delhi_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Delhi_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Delhi_temperature_2m (°C)`) - MIN(`Delhi_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Delhi_temperature_2m (°C)` - (SELECT AVG(`Delhi_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Delhi_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Delhi_temperature_2m (°C)` - (SELECT AVG(`Delhi_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Delhi_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 62B. Median
SELECT ROUND(AVG(`Delhi_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Delhi_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Delhi_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Delhi_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 62C. Mode
SELECT `Delhi_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Delhi_temperature_2m (°C)` IS NOT NULL
GROUP BY `Delhi_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 63: Delhi_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 63A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Delhi_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Delhi_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Delhi_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Delhi_relative_humidity_2m (%)`) - MIN(`Delhi_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Delhi_relative_humidity_2m (%)` - (SELECT AVG(`Delhi_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Delhi_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Delhi_relative_humidity_2m (%)` - (SELECT AVG(`Delhi_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Delhi_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 63B. Median
SELECT ROUND(AVG(`Delhi_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Delhi_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Delhi_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Delhi_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 63C. Mode
SELECT `Delhi_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Delhi_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Delhi_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 64: Delhi_cloud_cover (%)
-- ----------------------------------------------------------------

-- 64A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Delhi_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Delhi_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Delhi_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Delhi_cloud_cover (%)`) - MIN(`Delhi_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Delhi_cloud_cover (%)` - (SELECT AVG(`Delhi_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Delhi_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Delhi_cloud_cover (%)` - (SELECT AVG(`Delhi_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Delhi_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 64B. Median
SELECT ROUND(AVG(`Delhi_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Delhi_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Delhi_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Delhi_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 64C. Mode
SELECT `Delhi_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Delhi_cloud_cover (%)` IS NOT NULL
GROUP BY `Delhi_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 65: Delhi_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 65A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Delhi_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Delhi_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Delhi_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Delhi_wind_speed_10m (km/h)`) - MIN(`Delhi_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Delhi_wind_speed_10m (km/h)` - (SELECT AVG(`Delhi_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Delhi_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Delhi_wind_speed_10m (km/h)` - (SELECT AVG(`Delhi_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Delhi_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 65B. Median
SELECT ROUND(AVG(`Delhi_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Delhi_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Delhi_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Delhi_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 65C. Mode
SELECT `Delhi_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Delhi_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Delhi_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 66: Delhi_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 66A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Delhi_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Delhi_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Delhi_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Delhi_shortwave_radiation (W/m²)`) - MIN(`Delhi_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Delhi_shortwave_radiation (W/m²)` - (SELECT AVG(`Delhi_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Delhi_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Delhi_shortwave_radiation (W/m²)` - (SELECT AVG(`Delhi_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Delhi_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 66B. Median
SELECT ROUND(AVG(`Delhi_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Delhi_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Delhi_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Delhi_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 66C. Mode
SELECT `Delhi_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Delhi_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Delhi_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 67: Hyd_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 67A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Hyd_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Hyd_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Hyd_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Hyd_temperature_2m (°C)`) - MIN(`Hyd_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Hyd_temperature_2m (°C)` - (SELECT AVG(`Hyd_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Hyd_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Hyd_temperature_2m (°C)` - (SELECT AVG(`Hyd_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Hyd_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 67B. Median
SELECT ROUND(AVG(`Hyd_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Hyd_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Hyd_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Hyd_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 67C. Mode
SELECT `Hyd_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Hyd_temperature_2m (°C)` IS NOT NULL
GROUP BY `Hyd_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 68: Hyd_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 68A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Hyd_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Hyd_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Hyd_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Hyd_relative_humidity_2m (%)`) - MIN(`Hyd_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Hyd_relative_humidity_2m (%)` - (SELECT AVG(`Hyd_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Hyd_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Hyd_relative_humidity_2m (%)` - (SELECT AVG(`Hyd_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Hyd_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 68B. Median
SELECT ROUND(AVG(`Hyd_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Hyd_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Hyd_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Hyd_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 68C. Mode
SELECT `Hyd_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Hyd_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Hyd_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 69: Hyd_cloud_cover (%)
-- ----------------------------------------------------------------

-- 69A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Hyd_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Hyd_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Hyd_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Hyd_cloud_cover (%)`) - MIN(`Hyd_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Hyd_cloud_cover (%)` - (SELECT AVG(`Hyd_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Hyd_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Hyd_cloud_cover (%)` - (SELECT AVG(`Hyd_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Hyd_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 69B. Median
SELECT ROUND(AVG(`Hyd_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Hyd_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Hyd_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Hyd_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 69C. Mode
SELECT `Hyd_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Hyd_cloud_cover (%)` IS NOT NULL
GROUP BY `Hyd_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 70: Hyd_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 70A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Hyd_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Hyd_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Hyd_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Hyd_wind_speed_10m (km/h)`) - MIN(`Hyd_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Hyd_wind_speed_10m (km/h)` - (SELECT AVG(`Hyd_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Hyd_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Hyd_wind_speed_10m (km/h)` - (SELECT AVG(`Hyd_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Hyd_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 70B. Median
SELECT ROUND(AVG(`Hyd_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Hyd_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Hyd_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Hyd_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 70C. Mode
SELECT `Hyd_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Hyd_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Hyd_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 71: Hyd_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 71A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Hyd_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Hyd_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Hyd_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Hyd_shortwave_radiation (W/m²)`) - MIN(`Hyd_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Hyd_shortwave_radiation (W/m²)` - (SELECT AVG(`Hyd_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Hyd_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Hyd_shortwave_radiation (W/m²)` - (SELECT AVG(`Hyd_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Hyd_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 71B. Median
SELECT ROUND(AVG(`Hyd_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Hyd_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Hyd_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Hyd_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 71C. Mode
SELECT `Hyd_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Hyd_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Hyd_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 72: Mumbai_temperature_2m (°C)
-- ----------------------------------------------------------------

-- 72A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mumbai_temperature_2m (°C)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mumbai_temperature_2m (°C)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mumbai_temperature_2m (°C)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mumbai_temperature_2m (°C)`) - MIN(`Mumbai_temperature_2m (°C)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mumbai_temperature_2m (°C)` - (SELECT AVG(`Mumbai_temperature_2m (°C)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mumbai_temperature_2m (°C)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mumbai_temperature_2m (°C)` - (SELECT AVG(`Mumbai_temperature_2m (°C)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mumbai_temperature_2m (°C)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 72B. Median
SELECT ROUND(AVG(`Mumbai_temperature_2m (°C)`), 4) AS median_value
FROM (
  SELECT `Mumbai_temperature_2m (°C)`,
         ROW_NUMBER() OVER (ORDER BY `Mumbai_temperature_2m (°C)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mumbai_temperature_2m (°C)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 72C. Mode
SELECT `Mumbai_temperature_2m (°C)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mumbai_temperature_2m (°C)` IS NOT NULL
GROUP BY `Mumbai_temperature_2m (°C)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 73: Mumbai_relative_humidity_2m (%)
-- ----------------------------------------------------------------

-- 73A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mumbai_relative_humidity_2m (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mumbai_relative_humidity_2m (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mumbai_relative_humidity_2m (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mumbai_relative_humidity_2m (%)`) - MIN(`Mumbai_relative_humidity_2m (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mumbai_relative_humidity_2m (%)` - (SELECT AVG(`Mumbai_relative_humidity_2m (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mumbai_relative_humidity_2m (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mumbai_relative_humidity_2m (%)` - (SELECT AVG(`Mumbai_relative_humidity_2m (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mumbai_relative_humidity_2m (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 73B. Median
SELECT ROUND(AVG(`Mumbai_relative_humidity_2m (%)`), 4) AS median_value
FROM (
  SELECT `Mumbai_relative_humidity_2m (%)`,
         ROW_NUMBER() OVER (ORDER BY `Mumbai_relative_humidity_2m (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mumbai_relative_humidity_2m (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 73C. Mode
SELECT `Mumbai_relative_humidity_2m (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mumbai_relative_humidity_2m (%)` IS NOT NULL
GROUP BY `Mumbai_relative_humidity_2m (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 74: Mumbai_cloud_cover (%)
-- ----------------------------------------------------------------

-- 74A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mumbai_cloud_cover (%)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mumbai_cloud_cover (%)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mumbai_cloud_cover (%)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mumbai_cloud_cover (%)`) - MIN(`Mumbai_cloud_cover (%)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mumbai_cloud_cover (%)` - (SELECT AVG(`Mumbai_cloud_cover (%)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mumbai_cloud_cover (%)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mumbai_cloud_cover (%)` - (SELECT AVG(`Mumbai_cloud_cover (%)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mumbai_cloud_cover (%)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 74B. Median
SELECT ROUND(AVG(`Mumbai_cloud_cover (%)`), 4) AS median_value
FROM (
  SELECT `Mumbai_cloud_cover (%)`,
         ROW_NUMBER() OVER (ORDER BY `Mumbai_cloud_cover (%)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mumbai_cloud_cover (%)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 74C. Mode
SELECT `Mumbai_cloud_cover (%)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mumbai_cloud_cover (%)` IS NOT NULL
GROUP BY `Mumbai_cloud_cover (%)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 75: Mumbai_wind_speed_10m (km/h)
-- ----------------------------------------------------------------

-- 75A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mumbai_wind_speed_10m (km/h)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mumbai_wind_speed_10m (km/h)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mumbai_wind_speed_10m (km/h)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mumbai_wind_speed_10m (km/h)`) - MIN(`Mumbai_wind_speed_10m (km/h)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mumbai_wind_speed_10m (km/h)` - (SELECT AVG(`Mumbai_wind_speed_10m (km/h)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mumbai_wind_speed_10m (km/h)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mumbai_wind_speed_10m (km/h)` - (SELECT AVG(`Mumbai_wind_speed_10m (km/h)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mumbai_wind_speed_10m (km/h)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 75B. Median
SELECT ROUND(AVG(`Mumbai_wind_speed_10m (km/h)`), 4) AS median_value
FROM (
  SELECT `Mumbai_wind_speed_10m (km/h)`,
         ROW_NUMBER() OVER (ORDER BY `Mumbai_wind_speed_10m (km/h)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mumbai_wind_speed_10m (km/h)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 75C. Mode
SELECT `Mumbai_wind_speed_10m (km/h)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mumbai_wind_speed_10m (km/h)` IS NOT NULL
GROUP BY `Mumbai_wind_speed_10m (km/h)`
ORDER BY frequency DESC
LIMIT 1;


-- ----------------------------------------------------------------
-- COLUMN 76: Mumbai_shortwave_radiation (W/m²)
-- ----------------------------------------------------------------

-- 76A. Mean | Variance | Stdev | Range | Skewness | Kurtosis
SELECT
  ROUND(AVG(`Mumbai_shortwave_radiation (W/m²)`), 4)                                                          AS mean_value,
  ROUND(VAR_POP(`Mumbai_shortwave_radiation (W/m²)`), 4)                                                      AS variance_value,
  ROUND(STDDEV_POP(`Mumbai_shortwave_radiation (W/m²)`), 4)                                                   AS stdev_value,
  ROUND(MAX(`Mumbai_shortwave_radiation (W/m²)`) - MIN(`Mumbai_shortwave_radiation (W/m²)`), 4)                                               AS range_value,
  ROUND(
    AVG(POW(`Mumbai_shortwave_radiation (W/m²)` - (SELECT AVG(`Mumbai_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 3))
    / POW(STDDEV_POP(`Mumbai_shortwave_radiation (W/m²)`), 3)
  , 4)                                                                         AS skewness_value,
  ROUND(
    AVG(POW(`Mumbai_shortwave_radiation (W/m²)` - (SELECT AVG(`Mumbai_shortwave_radiation (W/m²)`) FROM iex_weather_raw), 4))
    / POW(VAR_POP(`Mumbai_shortwave_radiation (W/m²)`), 2) - 3
  , 4)                                                                         AS kurtosis_value
FROM iex_weather_raw;

-- 76B. Median
SELECT ROUND(AVG(`Mumbai_shortwave_radiation (W/m²)`), 4) AS median_value
FROM (
  SELECT `Mumbai_shortwave_radiation (W/m²)`,
         ROW_NUMBER() OVER (ORDER BY `Mumbai_shortwave_radiation (W/m²)`) AS rn,
         COUNT(*)     OVER ()              AS total
  FROM iex_weather_raw
  WHERE `Mumbai_shortwave_radiation (W/m²)` IS NOT NULL
) t
WHERE rn IN (FLOOR((total + 1) / 2), CEIL((total + 1) / 2));

-- 76C. Mode
SELECT `Mumbai_shortwave_radiation (W/m²)` AS mode_value, COUNT(*) AS frequency
FROM iex_weather_raw
WHERE `Mumbai_shortwave_radiation (W/m²)` IS NOT NULL
GROUP BY `Mumbai_shortwave_radiation (W/m²)`
ORDER BY frequency DESC
LIMIT 1;


-- ================================================================
-- END — 76 columns done
-- ================================================================