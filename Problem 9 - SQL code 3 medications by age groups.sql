/* 	Query to rank insulin, metformin, and glipizide by age */ 
USE patient;

/* 	CTE of long version of health table to join with demographics table 
	Union all used to reshape wide health table to a long table 
	This will put medication as one column instead of three columns for each one */
WITH
  long_health_CTE AS (
    SELECT
      patient_nbr,
      'metformin' AS medication,
      metformin AS med_usage
    FROM
      health
    UNION ALL
    SELECT
      patient_nbr,
      'glipizide' AS medication,
      glipizide AS med_usage
    FROM
      health
    UNION ALL
    SELECT
      patient_nbr,
      'insulin' AS medication,
      insulin AS med_usage
    FROM
      health
  )

/* 	Main query begins here */
SELECT
  age,
  medication,
  COUNT(*) AS total_medication_use,
  /* Ranks within each age group. Partian restarts the counting when age group changes */
  RANK() OVER (PARTITION BY age ORDER BY COUNT(*) DESC) AS medication_rank
FROM
  long_health_cte
INNER JOIN demographics 
	ON long_health_cte.patient_nbr = demographics.patient_nbr
WHERE
	/* Only counting patient encounters that took the medication
		Filtering out no */
	med_usage != 'no'
GROUP BY
	medication,
    age
ORDER BY 
	age,
    medication_rank;