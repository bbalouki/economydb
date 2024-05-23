-- sqlite3 economy.db

-- Drop existing tables
DROP TABLE IF EXISTS financial_market;
DROP TABLE IF EXISTS gdp_expenditure_approach;
DROP TABLE IF EXISTS house_prices_indicators;
DROP TABLE IF EXISTS foreign_direct_investment;
DROP TABLE IF EXISTS composite_leading_indicators;
DROP TABLE IF EXISTS productivity;
DROP TABLE IF EXISTS economic_outlook;
DROP TABLE IF EXISTS balance_of_payment;
DROP TABLE IF EXISTS accounting_entry;
DROP TABLE IF EXISTS unit_measures;
DROP TABLE IF EXISTS measures;
DROP TABLE IF EXISTS countries;


-- Create a countries table 
CREATE TABLE IF NOT EXISTS countries (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

-- Use this table to store differrents measures 
-- and their descriptions
CREATE TABLE measures (
    id INTEGER,
    measure TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

-- Use this table to store differrents unit measure 
-- and their descriptions
CREATE TABLE unit_measures (
    id INTEGER,
    measure TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

-- Use this table to store differrents accounting entries 
-- and their descriptions
CREATE TABLE accounting_entry (
    id INTEGER,
    measure TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

-- ==== BALANCE OF PAYEMENT ====
CREATE TABLE IF NOT EXISTS balance_of_payement(
    id INTEGER,
    country_id INTEGER,
    accounting_entry_id INTEGER,
    measure_id INTEGER,
    unit_measure_id INTEGER,
    adjustment TEXT NOT NULL CHECK(adjustment IN('N','Y')),
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(accounting_entry_id) REFERENCES accounting_entry(id) ON DELETE CASCADE,
    FOREIGN KEY(measure_id) REFERENCES measures(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);

-- ==== ECONOMIC OUTLOOK ====
CREATE TABLE IF NOT EXISTS economic_outlook(
    id INTEGER,
    country_id INTEGER,
    measure_id INTEGER,
    unit_measure_id INTEGER,
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(measure_id) REFERENCES measures(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);

-- ==== PRODUCTIVITY AND UNIT LABOUR COSTS ====
CREATE TABLE IF NOT EXISTS productivity (
    id INTEGER,
    country_id INTEGER,
    measure_id INTEGER,
    unit_measure_id INTEGER,
    price_base TEXT NOT NULL,
    transformation TEXT NOT NULL,
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(measure_id) REFERENCES measures(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);


-- ==== COMPOSITE LEADING INDICATORS  =====
CREATE TABLE IF NOT EXISTS composite_leading_indicators(
    id INTEGER,
    country_id INTEGER,
    measure_id INTEGER,
    unit_measure_id INTEGER,
    adjustment TEXT NOT NULL,
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(measure_id) REFERENCES measures(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);


-- ==== FOREIGN DIRECT INVESTMENT ==== 
CREATE TABLE IF NOT EXISTS foreign_direct_investment(
    id INTEGER,
    country_id INTEGER,
    accounting_entry_id INTEGER,
    measure_id INTEGER,
    unit_measure_id INTEGER,
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(accounting_entry_id) REFERENCES accounting_entry(id) ON DELETE CASCADE,
    FOREIGN KEY(measure_id) REFERENCES measures(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);

-- ==== ANALYTICAL HOUSE PRICES INDICATORS =====
CREATE TABLE IF NOT EXISTS house_prices_indicators(
    id INTEGER,
    country_id INTEGER,
    measure_id INTEGER,
    unit_measure_id INTEGER,
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(measure_id) REFERENCES measures(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);

-- ==== ANNUAL GDP AND COMPONENTS - EXPENDITURES APPROACH =====
CREATE TABLE IF NOT EXISTS gdp_expenditure_approach(
    id INTEGER,
    country_id INTEGER,
    unit_measure_id INTEGER,
    assets TEXT NOT NULL,
    price_base TEXT NOT NULL,
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);

-- ==== FINANCIAL MARKET ====
CREATE TABLE IF NOT EXISTS financial_market(
    id INTEGER,
    country_id INTEGER,
    measure_id INTEGER,
    unit_measure_id INTEGER,
    time_period TEXT,
    obs_value REAL,
    PRIMARY KEY(id),
    FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE,
    FOREIGN KEY(measure_id) REFERENCES measures(id) ON DELETE CASCADE,
    FOREIGN KEY(unit_measure_id) REFERENCES unit_measures(id) ON DELETE CASCADE
);