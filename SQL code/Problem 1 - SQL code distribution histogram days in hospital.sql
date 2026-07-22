/* Query to find distribution of number of days spent in the hospital by
creating a quick histogram to show a distribution of the number of days each hospital stay was */

USE patient;

SELECT 
    CAST(time_in_hospital AS UNSIGNED) AS days_in_hospital,    /* time_in_hospital is varchar type */
    COUNT(*) AS encounters,                                    
    RPAD('', COUNT(*) / 500, '*') AS '* = 500 encounters'      /* Divide by 500 so each astricks reps 500 patient encounters */
FROM
    health
GROUP BY days_in_hospital
ORDER BY days_in_hospital;
