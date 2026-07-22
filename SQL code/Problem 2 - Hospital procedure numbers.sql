/* Query to determine list of specialties and the average number of procedures per
encounter for each specialty that has more than 2.5 procedures per encounter */

USE patient;

SELECT
	medical_specialty AS specialty,
    /* Rounding to nearest tenth because director wants above 2.5 only
    No need for more decimal places in the output */
	ROUND(AVG(num_procedures), 1) AS mean_procedures_per_encounter,
	COUNT(num_procedures) AS tot_encounters
FROM 	
	health

/* Grouping to show the number of procedures for each specialty */
GROUP BY 
	specialty

/* Filtering to show only when a specialty an average of 2.5 procedures per encounter
 when the procedure count in a specialty is greater than 50 
 so that director can focus on impactful specialties */
HAVING 	
	mean_procedures_per_encounter > 2.5 AND
	tot_encounters > 50
ORDER BY 
	mean_procedures_per_encounter DESC;
