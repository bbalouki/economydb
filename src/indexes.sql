 
CREATE INDEX bop_index 
ON "balance_of_payement"(country_id, accounting_entry_id, measure_id, unit_measure_id, adjustment, time_period);

CREATE INDEX eo_index  
ON "economic_outlook"(country_id, measure_id, unit_measure_id, time_period);

CREATE INDEX productivity_index  
ON "productivity"(country_id, measure_id, unit_measure_id, price_base, transformation, time_period);

CREATE INDEX cli_index 
ON "composite_leading_indicators"(country_id, measure_id, unit_measure_id, adjustment, time_period);

CREATE INDEX fdi_index 
ON "foreign_direct_investment"(country_id, measure_id, unit_measure_id, accounting_entry_id, time_period);

CREATE INDEX house_prices 
ON "house_prices_indicators"(country_id, measure_id, unit_measure_id, time_period);

CREATE INDEX gdb_index2
ON "gdp_expenditure_approach"(country_id, unit_measure_id);
CREATE INDEX gdb_index2
ON "gdp_expenditure_approach"(assets, price_base, time_period);

CREATE INDEX fm_index 
ON "financial_market"(country_id, measure_id, unit_measure_id, time_period);
