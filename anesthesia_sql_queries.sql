CREATE DATABASE surgery_db;
USE surgery_db;

SELECT * FROM surgery_db.anesthesia_dataset;

#1. Find the total number of patients in the dataset.
SELECT COUNT(*) AS TotalPatients FROM anesthesia_dataset;

#2. Get the average BMI for each type of surgery.
SELECT SurgeryType, AVG(BMI) AS AverageBMI 
FROM anesthesia_dataset 
GROUP BY SurgeryType;

#3. Identify the number of patients with each type of anesthesia.
SELECT AnesthesiaType, COUNT(*) AS PatientCount 
FROM anesthesia_dataset 
GROUP BY AnesthesiaType;

#4. Find the patients who experienced complications after surgery.
SELECT * 
FROM anesthesia_dataset 
WHERE Complications IS NOT NULL AND Complications != 'None';

#5. Get the distribution of pain levels across all patients.
SELECT PainLevel, COUNT(*) AS PainLevelDistribution 
FROM anesthesia_dataset 
GROUP BY PainLevel 
ORDER BY PainLevel;

#6. List the top 5 longest surgeries performed.
SELECT * 
FROM anesthesia_dataset 
ORDER BY CAST(SurgeryDuration AS SIGNED) DESC 
LIMIT 5;

#7. Find patients with a BMI greater than 30 who underwent Neurological surgery.
SELECT * 
FROM anesthesia_dataset 
WHERE BMI > 30 AND SurgeryType = 'Neurological';

#8. Calculate the percentage of successful surgeries (Outcome = 0) vs unsuccessful surgeries (Outcome = 1).
SELECT Outcome, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM anesthesia_dataset) AS Percentage 
FROM anesthesia_dataset 
GROUP BY Outcome;

#9. Find the most common preoperative condition among patients.
SELECT PreoperativeNotes, COUNT(*) AS ConditionCount 
FROM anesthesia_dataset 
GROUP BY PreoperativeNotes 
ORDER BY ConditionCount DESC 
LIMIT 1;

#10. Get the average pain level for each type of surgery.
SELECT SurgeryType, AVG(PainLevel) AS AveragePainLevel 
FROM anesthesia_dataset 
GROUP BY SurgeryType;