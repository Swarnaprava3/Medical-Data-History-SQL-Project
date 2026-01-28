-- 1. Show first name, last name, and gender of patients who's gender is 'M'
select first_name, last_name, gender
from patients
where gender = 'M';

-- 2. Show first name and last name of patients who does not have allergies.
select first_name, last_name, allergies
from patients
where allergies is null;

-- 3. Show first name of patients that start with the letter 'C'
select first_name
from patients
where first_name like 'c%';

-- 4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)
select first_name, last_name, weight
from patients
where weight between 100 and 120;

-- 5. Update the patients table for the allergies column. If the patient's allergies is null then replace it with 'NKA'
select first_name, last_name, coalesce(allergies, 'NKA') as Allergies
from patients;

-- 6. Show first name and last name concatenated into one column to show their full name.
select first_name, last_name, concat(first_name, ' ', last_name) as full_name
from patients;

-- 7. Show first name, last name, and the full province name of each patient.
select p.first_name, p.last_name, pr.province_name as full_province_name
from patients as p
left join province_names as pr
on p.province_id = pr.province_id;

-- 8. Show how many patients have a birth_date with 2010 as the birth year.
select count(*) as Patientcount
from patients
where year(birth_date) = '2010';

-- 9. Show the first_name, last_name, and height of the patient with the greatest height.
select first_name, last_name, height
from patients where height = (select max(height) from patients);

-- 10. Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000
select * from patients
where patient_id in (1, 45, 534, 879, 1000);

-- 11. Show the total number of admissions
select count(*) as Totaladmissions
from admissions;

-- 12. Show all the columns from admissions where the patient was admitted and discharged on the same day.
select * from admissions
where admission_date = discharge_date;

-- 13. Show the total number of admissions for patient_id 579.
select patient_id, count(*) as totaladmission
from admissions
where patient_id = 579;

-- 14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'?
select distinct city
from patients
where province_id = 'NS';

-- 15. Write a query to find the first_name, last name and birth date of patients who have height more than 160 and weight more than 70
select first_name, last_name, birth_date
from patients
where height > 160 and weight > 70;

-- 16. Show unique birth years from patients and order them by ascending
select distinct year(birth_date) as birth_year, patient_id
from patients
order by birth_year asc;

-- 17. Show unique first names from the patients table which only occurs once in the list.
select distinct first_name
from patients
group by first_name
having count(*) = '1';

-- 18. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id, first_name
from patients
where first_name like 's%s'
and length(first_name) >= 6;

-- 19. Show patient_id, first_name, last_name from patients whose diagnosis is 'Dementia'. Primary diagnosis is stored in the admissions table.
select p.patient_id, p.first_name, p.last_name, a.diagnosis
from patients as p
left join admissions as a
on p.patient_id = a.patient_id
where a.diagnosis = 'Dementia';

-- 20. Display every patient's first_name. Order the list by the length of each name and then by alphabetically.
select first_name
from patients
order by length(first_name), first_name;


-- 21. Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row.
select count(case when gender='M' then 1 end) as Male_count,
			 count(case when gender='f' then 1 end) as female_count
from patients;

-- 22. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
select patient_id, diagnosis, count(*) as admission_count
from admissions
group by patient_id, diagnosis
having count(*) > 1;

-- 23. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.
select patient_id, diagnosis, count(*) as admission_count
from admissions
group by patient_id, diagnosis
having count(*) > 1;

-- 24. Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending.
select city, count(patient_id) as Total_patient_count
from patients
group by city
order by count(patient_id) desc, city asc;

-- 25. Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor"
SELECT first_name, last_name, 'Patient' AS role
FROM patients
UNION ALL
SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;

-- 26. Show all allergies ordered by popularity. Remove NULL values from query.
select allergies, count(*) as popularity
from patients
where allergies is not null
group by allergies
order by popularity desc;

-- 27. Show first_name, last_name, birth_date from patients born between 1970-01-01 and 1979-12-31, ordered by birth_date ascending.
Select first_name, last_name, birth_date
from patients
where birth_date between '1970-01-01' and '1979-12-31'
order by birth_date asc;

-- 28. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then a comma, then their first_name in all lower letters. Order by first_name descending.
select concat(upper(last_name),',',lower(first_name))
from patients
order by first_name desc;

-- 29. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000
select province_id, sum(height) as Total_patient_height
from patients
group by province_id
having Total_patient_height >= 7000;

-- 30. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'
select max(weight)-min(weight) as Weight_difference
from patients
where last_name='Maroni';

-- 31. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions, then by day ascending.
SELECT
	DAY(admission_date) AS day_of_month,
	COUNT(*) AS admission_count
FROM admissions
GROUP BY DAY(admission_date)
ORDER BY admission_count DESC, day_of_month ASC;

-- 32. Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as BMI >= 30
SELECT patient_id, weight, height, CASE WHEN (weight / POWER(height / 100.0, 2)) >= 30 THEN 1 ELSE 0 END AS isObese
FROM patients;

