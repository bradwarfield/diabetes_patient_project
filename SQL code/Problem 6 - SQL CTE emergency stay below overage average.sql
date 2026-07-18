/* A query to return all of the information for emergency encounters
whose stay was shorter than the average hospital stay */

USE 	patient;

/* CTE to calculate the mean length of time for all hospital encounters */
WITH 	avg_time 
		AS (
			SELECT 	AVG(time_in_hospital) AS avg_time_in_hospital
			FROM 	health)

/* Main query */
SELECT 	*
FROM 	health
WHERE 	admission_type_id = 1   /* 1 is for emergency admissions */
		AND time_in_hospital < (SELECT avg_time_in_hospital FROM avg_time);