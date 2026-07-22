/* Query to find distribution of number of days spent in the hospital by
creating a quick histogram to show a distribution of the number of days each hospital stay was */

USE patient;

SELECT
	/* Casting because time_in_hospital is varchar type */
    CAST(time_in_hospital AS UNSIGNED) AS days_in_hospital,    
    COUNT(*) AS encounters,
    /* Dividing by 500 so each astricks reps 500 patient encounters */
    RPAD('', COUNT(*) / 500, '*') AS '* = 500 encounters'      
FROM
    health
GROUP BY 
	days_in_hospital
ORDER BY 
	days_in_hospital;
