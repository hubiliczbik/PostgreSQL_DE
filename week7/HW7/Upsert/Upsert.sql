CREATE TABLE daily_metrics (
metric_name VARCHAR(100) NOT NULL,
date DATE NOT NULL,
value NUMERIC(12,2) NOT NULL,

UNIQUE (metric_name, date)
);

INSERT INTO daily_metrics (metric_name, date, value)
VALUES ('sales', CURRENT_DATE, 2200.00)
ON CONFLICT (metric_name, date)
DO UPDATE SET value = EXCLUDED.value;