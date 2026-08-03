/* Query to count the number encounters that had a later readmission 
based on the number of days spent in the hospital */
USE patient;

SELECT
	/* Casting because time_in_hospital is varchar type */
	CAST(time_in_hospital AS UNSIGNED) AS days,
    COUNT(readmitted) AS patients_readmitted
FROM health
WHERE readmitted != 'NO'
GROUP BY days
ORDER BY days;