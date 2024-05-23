-- Create views for measures and unit_measure used 
-- for BALANCE OF PAYEMENT table
CREATE VIEW balance_of_payement_measures AS 
SELECT m.description AS "MEASURES" FROM measures m
JOIN balance_of_payement b ON b.measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

CREATE VIEW balance_of_payement_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN balance_of_payement b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

-- Accounting entries for BALANCE OF PAYEMENT table
CREATE VIEW balance_of_payement_accounting_entries AS 
SELECT a.description AS "ACCOUNTING ENTRIES" FROM accounting_entry a
JOIN balance_of_payement b ON b.accounting_entry_id =  a.id
GROUP BY a.id
ORDER BY a.description;


-- Create views for measures and unit_measure used 
-- for ECONOMIC OUTLOOK table
CREATE VIEW economic_outlook_measures AS 
SELECT m.description AS "MEASURES" FROM measures m
JOIN economic_outlook b ON b.measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

CREATE VIEW economic_outlook_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN economic_outlook b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

-- Create views for measures and unit_measure used 
-- for PRODUCTIVITY AND UNIT LABOUR COSTS table
CREATE VIEW productivity_measures AS 
SELECT m.description AS "MEASURES" FROM measures m
JOIN productivity b ON b.measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

CREATE VIEW productivity_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN productivity b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

-- Create views for measures and unit_measure used 
-- for COMPOSITE LEADING INDICATORS table
CREATE VIEW cli_measures AS
SELECT m.description AS "MEASURES" FROM measures m
JOIN composite_leading_indicators b ON b.measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

CREATE VIEW cli_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN composite_leading_indicators b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

-- Create views for measures and unit_measure used 
-- for FOREIGN DIRECT INVESTMENT table
CREATE VIEW fdi_measures AS 
SELECT m.description AS "MEASURES" FROM measures m
JOIN foreign_direct_investment b ON b.measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

CREATE VIEW fdi_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN foreign_direct_investment b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

-- Accounting entries for foreign direct investment table
CREATE VIEW fdi_accounting_entries AS 
SELECT a.description AS "ACCOUNTING ENTRIES" FROM accounting_entry a
JOIN foreign_direct_investment b ON b.accounting_entry_id =  a.id
GROUP BY a.id
ORDER BY a.description;

-- Create views for measures and unit_measure used 
-- for ANALYTICAL HOUSE PRICES INDICATORS table
CREATE VIEW house_prices_measures AS 
SELECT m.description AS "MEASURES" FROM measures m
JOIN house_prices_indicators b ON b.measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

CREATE VIEW house_prices_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN house_prices_indicators b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

-- Create views for measures used 
-- for ANNUAL GDP AND COMPONENTS - EXPENDITURES APPROACH table

CREATE VIEW gdp_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN gdp_expenditure_approach b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

-- Create views for measures and unit_measure used 
-- for FINANCIAL MARKET table
CREATE VIEW financial_market_measures AS 
SELECT m.description AS "MEASURES" FROM measures m
JOIN financial_market b ON b.measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;

CREATE VIEW financial_market_unit_measures AS
SELECT m.description AS "UNIT MEASURES" FROM unit_measures m
JOIN financial_market b ON b.unit_measure_id =  m.id
GROUP BY m.id
ORDER BY m.description;