/* Query to create a clean list of patients who are African American
or their metformin was increased */

USE patient;

SELECT 	DISTINCT(h.patient_nbr)
FROM	demographics AS d
INNER JOIN	health AS h 
	ON d.patient_nbr = h.patient_nbr
WHERE	race = 'AfricanAmerican'
        OR metformin = 'Up';