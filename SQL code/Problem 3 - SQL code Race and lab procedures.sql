/* Query to find average number of lab procedures broken down by race */

USE 	patient;

SELECT	race,
		ROUND(AVG(num_lab_procedures), 1) AS avg_lab_procedures,
		COUNT(encounter_id) AS tot_encounters

/* Race is in the demographics table and the number of lab procedures 
is in the health table. hose tables need to be joined */
FROM	health AS h
		INNER JOIN	demographics AS d 
				ON h.patient_nbr = d.patient_nbr
GROUP BY 	race
ORDER BY 	AVG(num_lab_procedures);