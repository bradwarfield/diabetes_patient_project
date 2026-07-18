/* Query to calculate stats on the number of lab procedures
 Average [mean], standard deviation, minimum, and maximum */

USE 	patient;

SELECT 	AVG(num_lab_procedures),
		STDDEV(num_lab_procedures),
		MIN(num_lab_procedures),
		MAX(num_lab_procedures)
FROM	health;