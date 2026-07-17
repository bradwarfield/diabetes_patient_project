/* Query to create a summary of patient encounters based on the
most medications, then most lab procedures, then least diagnoses.
Patient ID, race, and readmittance included in the summary */

USE patient;

SELECT 
    CONCAT('Patient ',
            health.patient_nbr,
            ' was ',
            demographics.race,
            ' and ',
            /* Conditional CASE so summary statement will state whether the patient was
            not readmitted, readmitted within 30 days, readmitted 30 or later, or unknown */
            (CASE
                WHEN readmitted = 'NO' THEN ' was not readmitted. They had '
                WHEN readmitted = '<30' THEN 'was readmitted within 30 days. They had '
				WHEN readmitted = '>30' THEN 'was readmitted after 30 days. They had '
				ELSE 'had an unknown readmission status. They had '
            END),
            num_medications,
            ' different medications and ',
            num_lab_procedures,
            ' lab procedures.'
            ) AS Summary
FROM
    health
        INNER JOIN
    patient.demographics ON demographics.patient_nbr = health.patient_nbr
ORDER BY 
/* Casting because data types are varchar and need to be numerical */
	CAST(num_medications as UNSIGNED) DESC, 
    CAST(num_lab_procedures as UNSIGNED) DESC
LIMIT 50;
