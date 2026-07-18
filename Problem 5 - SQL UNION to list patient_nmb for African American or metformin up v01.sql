/* Query to create a clean list of patients who are African American 
 or their metformin was increased */

USE 	patient;

SELECT 	(patient_nbr)
FROM	demographics
WHERE	race = 'AfricanAmerican' 
UNION 
	SELECT	patient_nbr
	FROM	health
	WHERE	metformin = 'Up';