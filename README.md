# 🏥 Medical Data History SQL Project

## 📑 Table of Contents
- 📌 Project Overview
- 📂 Datasets Used
- 🎯 Project Objectives
- ⭕ Business Problems Addressed
- 🛠️ Methodology
- 🔍 Key Insights & Solutions
- 📈 Sample SQL Queries Used
- 🧠 Skills Gained
- ✅ Conclusion




## 📌 Project Overview
This project analyzes medical data from a fictional hospital system using SQL. It explores patient demographics, admissions, diagnoses, and doctor assignments to uncover operational insights and support data-driven healthcare decisions. The project demonstrates SQL skills in querying, reporting, and healthcare analytics.

## 📂 Datasets Used
- **patients.csv**: Patient demographics and health metrics (ID, name, gender, birth date, city, province, allergies, height, weight)
- **doctors.csv**: Doctor information (ID, name, specialty)
- **admission.csv**: Admission records (patient ID, admission/discharge dates, diagnosis, attending doctor)
- **province names.csv**: Province codes and names

## 🎯 Project Objectives
- Analyze patient demographics and health metrics
- Track admissions and diagnoses for patient flow and common conditions
- Evaluate doctor specialties and assignments
- Aggregate and report on healthcare data for operational insights

## ⭕ Business Problems Addressed
- What is the gender and age distribution of patients?
- Which cities and provinces have the most patients?
- What are the most common diagnoses and repeat admissions?
- Which doctors handle specific cases and specialties?
- How do patient metrics (height, weight, allergies) vary across the population?
- What are the trends in admissions by day, month, and diagnosis?

## 🛠️ Methodology
- Data imported from CSV files into SQL tables
- ER diagram defines relationships between patients, doctors, admissions, and provinces
- SQL queries for basic exploration, advanced analytics, and reporting
- Use of joins, aggregations, date functions, and conditional logic

## 🔍 Key Insights & Solutions
- Gender distribution and unique patient names identified
- Obesity rates calculated using BMI
- Repeat admissions for same diagnosis detected
- Most common allergies and diagnoses reported
- Patient distribution by city and province visualized
- Doctor specialties and assignments mapped to cases
- Admission trends by day/month analyzed

## 📈 Sample SQL Queries Used
- List male patients: `SELECT first_name, last_name FROM patients WHERE gender = 'M';`
- Find patients without allergies: `SELECT first_name, last_name FROM patients WHERE allergies IS NULL;`
- Count admissions: `SELECT COUNT(*) FROM admissions;`
- Patients admitted multiple times for same diagnosis: `SELECT patient_id, diagnosis, COUNT(*) FROM admissions GROUP BY patient_id, diagnosis HAVING COUNT(*) > 1;`
- City-wise patient count: `SELECT city, COUNT(patient_id) FROM patients GROUP BY city;`
- Calculate obesity: `SELECT patient_id, weight, height, CASE WHEN (weight / POWER(height / 100.0, 2)) >= 30 THEN 1 ELSE 0 END AS isObese FROM patients;`

## 🧠 Skills Gained
- Writing business-focused SQL queries
- Using joins, aggregations, and date functions
- Translating healthcare KPIs into SQL metrics
- Data cleaning and reporting in SQL
- Analytical thinking in healthcare data context

## ✅ Conclusion
This SQL project provides a strong foundation in healthcare data analytics. By querying hospital datasets, actionable insights were delivered around patient care, resource management, and operational efficiency. The project demonstrates how structured data can drive real-world decisions in healthcare.

## 📬 Connect with Me
- [LinkedIn](https://www.linkedin.com/in/swarnaprava-lenka-50b1b922b)
- [GitHub](https://github.com/Swarnaprava3)

## 📸 Project Preview
![ER Diagram]](https://github.com/Swarnaprava3/Medical-Data-History-SQL-Project/blob/main/Entity%20Relationship%20Diagram.png)

---

*For more details, see the SQL script and datasets included in this repository.*
