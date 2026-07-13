/* Changing the data type for num_medications and num_lab_procedures from varchar to int */
/* Change approved by Database Administrator Ioreth */
use patient;

ALTER TABLE health
MODIFY COLUMN num_medications INT;

ALTER TABLE health
MODIFY COLUMN num_lab_procedures INT;

