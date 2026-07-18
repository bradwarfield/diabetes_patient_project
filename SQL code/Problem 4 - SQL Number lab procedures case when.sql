/* Query to see overview of average length of hospital stay based on number of procedures 
Dividing procedure frequency into 5 groups */

USE patient;

SELECT 
/* CASE section to divide into 5 groups based on mean and standard deviation of procedures
 Another query calculated mean = 40 & StdDev = 20 rounded to nearest integer */
    CASE
        WHEN
				num_lab_procedures >= 0
			AND num_lab_procedures <= 4
		THEN
            'Well below average (0-4)'
        WHEN
				num_lab_procedures > 4
			AND num_lab_procedures <= 24
        THEN
            'Below average (5-24)'
        WHEN
				num_lab_procedures > 24
			AND num_lab_procedures <= 64
        THEN
            'Average (25-64)'
        WHEN
				num_lab_procedures > 64
			AND num_lab_procedures <= 84
        THEN
			'Above average (65-84)'
        ELSE 'Well above average (85+)'
    END AS Procedure_frequency,
/* Resuming SELECT after the END of CASE */	
    ROUND(AVG(time_in_hospital), 2) AS Avg_days_in_hospital,
	COUNT(*) AS Num_encounters
FROM
    health
GROUP BY Procedure_frequency
ORDER BY Avg_days_in_hospital;