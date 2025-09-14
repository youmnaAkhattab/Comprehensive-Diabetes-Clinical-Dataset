create table race 
( race_id int primary key
, race varchar(50)
)

INSERT INTO race (race_id, race)
VALUES (1, 'AfricanAmerican'),
       (2,'Asian'),
	   (3,'Caucasian'),
	   (4,'Hispanic'),
	   (5,'Other');




create table location_Id
( location_id int primary key
, location1 varchar(50)
)

INSERT INTO location_Id (location_id, location1)
VALUES (1, 'Arkansas'),
       (2,'Alabama'),
	   (3,'Alaska'),
	   (4,'Arizona'),
	   (5,'California');

	   --glo
CREATE TABLE glucose_reference (
    glucose_id INT PRIMARY KEY,
    glucose_status VARCHAR(20),
    min_value INT,
    max_value INT
);

INSERT INTO glucose_reference (glucose_id, glucose_status, min_value, max_value) VALUES
(1, 'Normal', 0, 99),
(2, 'Prediabetic', 100, 125),
(3, 'Diabetic', 126, 9999);


ALTER TABLE patient
ADD glucose_id INT;


UPDATE p
SET p.glucose_id = g.glucose_id
FROM patient p
JOIN glucose_reference g
    ON p.blood_glucose_level BETWEEN g.min_value AND g.max_value;

ALTER TABLE patient
DROP COLUMN blood_glucose_level;

       --BMI
CREATE TABLE bmi_reference (
    bmi_id INT PRIMARY KEY,
    category VARCHAR(50),
    min_value DECIMAL(5,2),
    max_value DECIMAL(5,2)
);



INSERT INTO bmi_reference (bmi_id, category, min_value, max_value)
VALUES
(1, 'Underweight', 0, 18.4),
(2, 'Normal weight', 18.5, 24.9),
(3, 'Overweight', 25, 29.9),
(4, 'Obese', 30, 100);


ALTER TABLE patient
ADD bmi_id INT ;


UPDATE p
SET p.bmi_id = b.bmi_id
FROM patient p
JOIN bmi_reference b
    ON p.bmi BETWEEN b.min_value AND b.max_value;


ALTER TABLE patient
DROP COLUMN bmi;


--------------------------------------------
CREATE TABLE hba1c_reference (
    hba1c_id INT PRIMARY KEY,
    category VARCHAR(50),
    min_value DECIMAL(3,1),
    max_value DECIMAL(3,1)
);



INSERT INTO hba1c_reference (hba1c_id, category, min_value, max_value)
VALUES
(1, 'Normal', 0.0, 5.6),
(2, 'Prediabetes', 5.7, 6.4),
(3, 'Diabetes', 6.5, 15.0);




ALTER TABLE patient
ADD hba1c_id INT ;



UPDATE p
SET p.hba1c_id = h.hba1c_id
FROM patient p
JOIN hba1c_reference h
    ON p.hbA1c_level BETWEEN h.min_value AND h.max_value;



ALTER TABLE pro
DROP COLUMN hbA1c_level;

