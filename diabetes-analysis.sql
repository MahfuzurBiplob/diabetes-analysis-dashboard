-- =====================================
-- DIABETES DATA ANALYSIS (SQL)
-- =====================================

-- ⚠️ যদি table name আলাদা হয় (যেমন clean_diabetes)
-- তাহলে নিচের সব জায়গায় diabetes replace করো

-- =====================================
-- 1. TOTAL PATIENTS & DIABETIC COUNT
-- =====================================
SELECT 
    COUNT(*) AS total_patients,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS diabetic_patients
FROM diabetes;


-- =====================================
-- 2. DIABETES PERCENTAGE
-- =====================================
SELECT 
    ROUND(
        SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS diabetes_percentage
FROM diabetes;


-- =====================================
-- 3. AGE GROUP ANALYSIS
-- =====================================
SELECT 
    CASE 
        WHEN Age < 30 THEN '20-30'
        WHEN Age BETWEEN 30 AND 40 THEN '30-40'
        WHEN Age BETWEEN 40 AND 50 THEN '40-50'
        ELSE '50+'
    END AS age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS diabetic_count
FROM diabetes
GROUP BY age_group
ORDER BY age_group;


-- =====================================
-- 4. BMI CATEGORY ANALYSIS
-- =====================================
SELECT 
    CASE 
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,
    COUNT(*) AS total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS diabetic_count
FROM diabetes
GROUP BY bmi_category;


-- =====================================
-- 5. GLUCOSE LEVEL ANALYSIS
-- =====================================
SELECT 
    CASE 
        WHEN Glucose < 100 THEN 'Low'
        WHEN Glucose BETWEEN 100 AND 140 THEN 'Normal'
        ELSE 'High'
    END AS glucose_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS diabetic_count
FROM diabetes
GROUP BY glucose_group;


-- =====================================
-- 6. AVERAGE HEALTH METRICS
-- =====================================
SELECT 
    ROUND(AVG(Glucose),2) AS avg_glucose,
    ROUND(AVG(BMI),2) AS avg_bmi,
    ROUND(AVG(Age),2) AS avg_age
FROM diabetes;


-- =====================================
-- 7. HIGH RISK PATIENT GROUP
-- =====================================
SELECT 
    COUNT(*) AS high_risk_patients
FROM diabetes
WHERE Glucose > 140 
  AND BMI > 30 
  AND Outcome = 1;