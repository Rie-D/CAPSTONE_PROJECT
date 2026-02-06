SET SQL_SAFE_UPDATES = 0;

-- Remove 'mr' or so
UPDATE healthcare_dataset.healthcare_dataset
SET name = LTRIM(SUBSTRING(name, LOCATE(' ', name) +1))
WHERE LOWER(LTRIM(name)) LIKE 'mr.%'
	OR LOWER(LTRIM(name))LIKE 'mrs.%'
	OR LOWER(LTRIM(name)) LIKE 'ms.%'
	OR LOWER(LTRIM(name)) LIKE 'dr.%';
    
    -- Capitalization
UPDATE healthcare_dataset.healthcare_dataset

SET name = CONCAT(
	UPPER(SUBSTRING(name,1,1)),
    LOWER(SUBSTRING(name,2, LOCATE(' ',name) -2)),
    ' ',
    UPPER(SUBSTRING(name, LOCATE(' ', name) +1, 1)),
    LOWER(SUBSTRiNG(name, LOCATE(' ', name) +2))
)
WHERE name LIKE '% %';

SET SQL_SAFE_UPDATES = 1;

-- Check low number
-- SELECT count(*) FROM healthcare_dataset.healthcare_dataset;

-- Check null or empty
-- SELECT * WHERE Name IS NULL OR Name = '';