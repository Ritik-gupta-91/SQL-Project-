
CREATE TABLE Hospital_info(
	Hospital_Name VARCHAR(100),
	Location VARCHAR(100),
	Department VARCHAR(100),
	Doctors_Count INT,
	Patients_Count INT,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)
	);

SELECT* FROM Hospital_info;

--1. Total Number of Patients

SELECT SUM(patients_count) AS Total_Patients
FROM Hospital_info;


--2. Average Number of Doctors per Hospital

SELECT Hospital_Name, AVG(Doctors_Count) AS Avg_Doctors
FROM Hospital_info
GROUP BY Hospital_Name;

     
--3. Top 3 Departments with the Highest Number of Patients

SELECT Department, SUM(patients_count) AS Total_Patients
FROM Hospital_info
GROUP BY Department
ORDER BY Total_Patients DESC
LIMIT(3);


--4. Hospital with the Maximum Medical Expenses

SELECT Hospital_Name, SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_info
GROUP BY Hospital_name
ORDER BY Total_Medical_Expenses DESC
LIMIT(1);


--5. Daily Average Medical Expenses

SELECT Hospital_Name, AVG(Medical_Expenses / ((Discharge_Date - Admission_Date) + 1)) AS daily_avg_expenses
FROM Hospital_info
GROUP BY Hospital_name;


--6. Longest Hospital Stay

SELECT Hospital_Name, Patients_Count, 	Admission_Date, Discharge_Date,
(Discharge_Date - 	Admission_Date) AS Stay_Duration 
FROM Hospital_info
ORDER BY Stay_Duration DESC
LIMIT(1);


--7. Total Patients Treated Per City

SELECT Location, SUM(patients_Count) AS Total_Patients_per_City
FROM Hospital_info
GROUP BY Location;


--8. Average Length of Stay Per Department

SELECT Department, AVG(Discharge_Date - Admission_Date + 1) AS Avg_stay_department
FROM Hospital_info
GROUP BY Department;


--9. Identify the Department with the Lowest Number of Patients

SELECT Department, SUM(patients_Count) AS Total_Patients_per_Dept
FROM Hospital_info
GROUP BY Department ORDER BY Total_Patients_per_Dept 
LIMIT 1;


--10. Monthly Medical Expenses Report

SELECT DATE_TRUNC('month', Admission_Date) AS month,
SUM(Medical_Expenses) AS total_medical_expenses
FROM Hospital_info
GROUP BY month
ORDER BY month;

