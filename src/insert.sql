
-- Import counties data in a temporary table
.import --csv countries.csv temp_countries
-- Add countries data
INSERT INTO countries(name, code)
SELECT name, code FROM temp_countries;

DROP TABLE temp_countries;
VACUUM;

-- ==== BALANCE OF PAYEMENT ====
.import --csv BOP.csv temp
INSERT INTO measures (measure, description)
SELECT MEASURE, Measure_d FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM measures 
    WHERE measures.measure = temp.MEASURE
      AND measures.description = temp.Measure_d
)
GROUP BY MEASURE, Measure_d;

INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO accounting_entry (measure, description) VALUES
    ('B', 'Balance (Revenu minus expenditure)'),
    ('C', 'Revenu'),
    ('D', 'Expenditures'),
    ('N', 'Net (assets minus liabilities)'),
    ('A', 'Assets (or net acquisitions of assets)'),
    ('L', 'Liabilities (or net incurrence of liabilities)'),
    ('NET_FDI', 'Net FDI');

INSERT INTO balance_of_payement(country_id, accounting_entry_id, measure_id, unit_measure_id, adjustment, time_period, obs_value)
SELECT c.id, a.id, m.id, u.id, b.ADJUSTMENT, b.TIME_PERIOD, b.OBS_VALUE FROM temp b
JOIN countries c ON c.code = b.REF_AREA
JOIN accounting_entry a ON a.measure = b.ACCOUNTING_ENTRY
JOIN measures m ON m.measure = b.MEASURE
JOIN unit_measures u ON u.measure = b.UNIT_MEASURE;

DROP TABLE temp;
VACUUM;

-- ==== ECONOMIC OUTLOOK ====
.import --csv economic_outlook.csv temp
INSERT INTO measures (measure, description)
SELECT MEASURE, Measure_d FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM measures 
    WHERE measures.measure = temp.MEASURE
      AND measures.description = temp.Measure_d
)
GROUP BY MEASURE, Measure_d;

INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO economic_outlook(country_id, measure_id, unit_measure_id, time_period, obs_value)
SELECT c.id , m.id, u.id, eo.TIME_PERIOD, eo.OBS_VALUE FROM temp eo
JOIN countries c ON c.code = eo.REF_AREA
JOIN measures m ON m.measure = eo.MEASURE
JOIN unit_measures u ON u.measure = eo.UNIT_MEASURE;

DROP TABLE temp;
VACUUM;

-- ==== PRODUCTIVITY AND UNIT LABOUR COSTS ====
.import --csv productivity temp
INSERT INTO measures (measure, description)
SELECT MEASURE, Measure_d FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM measures 
    WHERE measures.measure = temp.MEASURE
      AND measures.description = temp.Measure_d
)
GROUP BY MEASURE, Measure_d;

INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO productivity(country_id, measure_id, unit_measure_id, price_base, transformation, time_period, obs_value)
SELECT c.id , m.id, u.id, "eo"."Price base", eo.Transformation_d, eo.TIME_PERIOD, eo.OBS_VALUE FROM temp eo
JOIN countries c ON c.code = eo.REF_AREA
JOIN measures m ON m.measure = eo.MEASURE
JOIN unit_measures u ON u.measure = eo.UNIT_MEASURE;

DROP TABLE temp;
VACUUM;

-- ==== Composite leading indicators =====
.import --csv CLI.csv temp
INSERT INTO measures (measure, description)
SELECT MEASURE, Measure_d FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM measures 
    WHERE measures.measure = temp.MEASURE
      AND measures.description = temp.Measure_d
)
GROUP BY MEASURE, Measure_d;

INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO composite_leading_indicators(country_id, measure_id, unit_measure_id, adjustment, time_period, obs_value)
SELECT c.id , m.id, u.id, eo.Adjustment_d, eo.TIME_PERIOD, eo.OBS_VALUE FROM temp eo
JOIN countries c ON c.code = eo.REF_AREA
JOIN measures m ON m.measure = eo.MEASURE
JOIN unit_measures u ON u.measure = eo.UNIT_MEASURE;

DROP TABLE temp;
VACUUM;

-- ==== Foreign Direct Investment ==== 
.import --csv FDI_1.csv temp
.import --csv FDI_2.csv temp1
INSERT INTO measures (measure, description)
SELECT MEASURE, Measure_d FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM measures 
    WHERE measures.measure = temp.MEASURE
      AND measures.description = temp.Measure_d
)
GROUP BY MEASURE, Measure_d;

INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO foreign_direct_investment(country_id, accounting_entry_id, measure_id, unit_measure_id, time_period, obs_value)
SELECT c.id, a.id, m.id, u.id, b.TIME_PERIOD, b.OBS_VALUE FROM temp b
JOIN countries c ON c.code = b.REF_AREA
JOIN accounting_entry a ON a.measure = b.ACCOUNTING_ENTRY
JOIN measures m ON m.measure = b.MEASURE
JOIN unit_measures u ON u.measure = b.UNIT_MEASURE;

INSERT INTO foreign_direct_investment(country_id, accounting_entry_id, measure_id, unit_measure_id, time_period, obs_value)
SELECT c.id, a.id, m.id, u.id, b.TIME_PERIOD, b.OBS_VALUE FROM temp1 b
JOIN countries c ON c.code = b.REF_AREA
JOIN accounting_entry a ON a.measure = b.ACCOUNTING_ENTRY
JOIN measures m ON m.measure = b.MEASURE
JOIN unit_measures u ON u.measure = b.UNIT_MEASURE;

DROP TABLE temp;
DROP TABLE temp1;
VACUUM;

-- ==== Analytical house prices indicators =====
.import --csv house_prices.csv temp
INSERT INTO measures (measure, description)
SELECT MEASURE, Measure_d FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM measures 
    WHERE measures.measure = temp.MEASURE
      AND measures.description = temp.Measure_d
)
GROUP BY MEASURE, Measure_d;

INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO house_prices_indicators(country_id, measure_id, unit_measure_id, time_period, obs_value)
SELECT c.id , m.id, u.id, eo.TIME_PERIOD, eo.OBS_VALUE FROM temp eo
JOIN countries c ON c.code = eo.REF_AREA
JOIN measures m ON m.measure = eo.MEASURE
JOIN unit_measures u ON u.measure = eo.UNIT_MEASURE;

DROP TABLE temp;
VACUUM;

-- ==== Annual GDP and components - expenditure approach =====
.import --csv GDP.csv temp
INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO gdp_expenditure_approach(country_id, unit_measure_id, assets, price_base, time_period, obs_value)
SELECT c.id , u.id, eo.ASSETS, "eo"."Price base",  eo.TIME_PERIOD, eo.OBS_VALUE FROM temp eo
JOIN countries c ON c.code = eo.REF_AREA
JOIN unit_measures u ON u.measure = eo.UNIT_MEASURE;

DROP TABLE temp;
VACUUM;

-- ==== Financial market ====
.import --csv financial_market.csv temp
INSERT INTO measures (measure, description)
SELECT MEASURE, Measure_d FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM measures 
    WHERE measures.measure = temp.MEASURE
      AND measures.description = temp.Measure_d
)
GROUP BY MEASURE, Measure_d;

INSERT INTO unit_measures (measure, description)
SELECT UNIT_MEASURE, "Unit of measure" FROM temp
WHERE NOT EXISTS (
    SELECT 1 
    FROM unit_measures 
    WHERE unit_measures.measure = temp.UNIT_MEASURE
      AND unit_measures.description = "temp"."Unit of measure" 
)
GROUP BY UNIT_MEASURE, "Unit of measure";

INSERT INTO financial_market(country_id, measure_id, unit_measure_id, time_period, obs_value)
SELECT c.id , m.id, u.id, eo.TIME_PERIOD, eo.OBS_VALUE FROM temp eo
JOIN countries c ON c.code = eo.REF_AREA
JOIN measures m ON m.measure = eo.MEASURE
JOIN unit_measures u ON u.measure = eo.UNIT_MEASURE;

DROP TABLE temp;
VACUUM;