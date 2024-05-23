-- ==== BALANCE OF PAYEMENT ====
/* Retrieves the time periods and the "Current account" balance  
as a percentage of GDP  for the United States, 
accounting for any necessary adjustments.*/
SELECT b.time_period, b.obs_value FROM balance_of_payement b
JOIN measures m ON b.measure_id = m.id
JOIN countries c ON c.id = b.country_id
JOIN accounting_entry a ON a.id = b.accounting_entry_id
JOIN unit_measures u ON u.id = b.unit_measure_id
WHERE m.description =  "Current account"
AND c.code = "USA"
AND b.adjustment = "Y"
AND a.measure =  "B"
AND u.description = "Percentage of GDP"
ORDER BY b.time_period;

-- ==== ECONOMIC OUTLOOK ====
/* Find the Consumer Price Index (CPI) 
expressed in percentage points for the United States.*/
SELECT e.time_period, e.obs_value FROM economic_outlook e
JOIN measures m ON e.measure_id = m.id
JOIN countries c ON c.id = e.country_id
JOIN unit_measures u ON u.id = e.unit_measure_id
WHERE m.description = "Consumer price index"
AND c.code = "USA"
AND u.description = "Index"
ORDER BY e.time_period;

-- ==== PRODUCTIVITY AND UNIT LABOUR COSTS ====
/* Find the GDP per person employed, 
expressed as a percentage change from period to period, 
for the United States.*/
SELECT p.time_period, p.obs_value FROM productivity p
JOIN measures m ON p.measure_id = m.id
JOIN countries c ON c.id = p.country_id
JOIN unit_measures u ON u.id = p.unit_measure_id
WHERE m.description = "GDP per person employed"
AND c.code = "USA"
AND u.description = "Percent per period"
AND p.price_base = "Constant prices"
AND p.transformation = "Growth rate, period on period"
ORDER BY p.time_period;

-- ==== COMPOSITE LEADING INDICATORS  =====
/* Find the Composite Leading Indicator (CLI) 
for the United States, where the data is normalized or adjusted */
SELECT c.time_period, c.obs_value FROM composite_leading_indicators c
JOIN measures m ON c.measure_id = m.id
JOIN countries cc ON cc.id = c.country_id
JOIN unit_measures u ON u.id = c.unit_measure_id
WHERE m.description = "Composite leading indicator (CLI)"
AND cc.code = "USA"
AND c.adjustment = "Normalized"
ORDER BY c.time_period;

-- ==== FOREIGN DIRECT INVESTMENT ==== 
/*  the total Foreign Direct Investment (FDI) 
financial flows in reported currency (net FDI) for the United States. */
SELECT f.time_period, f.obs_value FROM foreign_direct_investment f
JOIN measures m ON f.measure_id = m.id
JOIN countries c ON c.id = f.country_id
JOIN accounting_entry a ON a.id = f.accounting_entry_id
JOIN unit_measures u ON u.id = f.unit_measure_id
WHERE m.description =  "FDI financial flows - total"
AND f.obs_value != ""
AND c.code = "USA"
AND a.measure =  "NET_FDI"
AND u.description = "Reported currency"
ORDER BY f.time_period;

-- ==== ANALYTICAL HOUSE PRICES INDICATORS ===== 
/* Find the Real House Price Indices in the United States, expressed as an index.*/
SELECT h.time_period, h.obs_value FROM house_prices_indicators h
JOIN measures m ON h.measure_id = m.id
JOIN countries c ON c.id = h.country_id
JOIN unit_measures u ON u.id = h.unit_measure_id
WHERE m.description = "Real house price indices"
AND c.code = "USA"
AND u.description = "Index"
ORDER BY h.time_period;

-- ==== ANNUAL GDP AND COMPONENTS - EXPENDITURES APPROACH =====
/* Find the gross fixed assets component of GDP, 
expressed in the national currency, for the United States.*/
SELECT g.time_period, g.obs_value FROM gdp_expenditure_approach g
JOIN countries c ON c.id = g.country_id
JOIN unit_measures u ON u.id = g.unit_measure_id
WHERE g.assets = "Fixed assets, gross"
AND c.code = "USA"
AND u.description = "National currency"
AND g.price_base = "Current prices"
ORDER BY g.time_period;

-- ==== FINANCIAL MARKET ====
-- m = Short-term interest rates
-- u = Percent per annum
SELECT fm.time_period, fm.obs_value FROM financial_market fm
JOIN measures m ON fm.measure_id = m.id
JOIN countries c ON c.id = fm.country_id
JOIN unit_measures u ON u.id = fm.unit_measure_id
WHERE m.description = "Short-term interest rates"
AND c.code = "USA"
AND u.description = "Percent per annum"
ORDER BY fm.time_period;