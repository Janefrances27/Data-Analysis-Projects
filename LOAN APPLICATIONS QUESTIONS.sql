-- SQL PROJECT: LOAN APPLICATIONS ANALYSIS
-- ________________________________________
-- ✅ Project Title
-- Loan Applications Analysis
-- ________________________________________
-- ✅ Problem Statement
-- A bank wants to analyze its recent loan applications to improve decision-making and risk assessment. The data includes details about applicants’ demographics, income, loan amounts, purposes, credit scores, and approval outcomes.
-- Your task is to write SQL queries to extract meaningful insights from this dataset. You will help answer key business questions such as average loan amounts, high-risk applicants, approval patterns, and income analysis.
-- By completing this project, you'll demonstrate your ability to use SQL for aggregations, filtering, logical conditions, subqueries, and simple reporting.
-- ________________________________________
-- Below is an example of its columns:
-- •	ApplicationID
-- •	CustomerName
-- •	Age
-- •	Gender
-- •	MaritalStatus
-- •	EmploymentStatus
-- •	AnnualIncome
-- •	LoanAmount
-- •	LoanPurpose
-- •	ApprovalStatus
-- •	CreditScore
-- •	ApplicationDate
-- ________________________________________
-- ✅ Tasks
-- You must complete the following 10 SQL tasks. Write one query for each. Include clear comments or headings to identify which task your query solves.

-- 🔹 1. View All Data
-- Write a query to select all records from the loan_applications table.
SELECT * FROM LOAN_APPLICATIONS;

-- 🔹 2. Count Total Applications
-- Count the total number of loan applications.
SELECT COUNT(APPLICATION_ID) AS TOTAL_APPLICATIONS FROM LOAN_APPLICATIONS;

-- 🔹 3. Average Loan Amount
-- Calculate the average LoanAmount across all applications.
SELECT AVG(LOAN_AMOUNT_REQUESTED) AS AVG_LOAN_AMOUNT FROM LOAN_APPLICATIONS;

-- 🔹 4. Total Loan Amount by Purpose
-- List LoanPurpose and the total LoanAmount for each purpose.
-- Order the results by total LoanAmount in descending order
SELECT PURPOSE_OF_LOAN SUM,(LOAN_AMOUNT_REQUESTED) AS TOTAL_LOAN FROM LOAN_APPLICATIONS
GROUP BY PURPOSE_OF_LOAN ORDER BY TOTAL_LOAN DESC;

-- 🔹 5. Identify High-Income Applicants
-- Retrieve all applications where AnnualIncome is greater than 100,000.
SELECT APPLICATION_ID, APPLICATION_DATE, PURPOSE_OF_LOAN, GENDER FROM LOAN_APPLICATIONS WHERE MONTHLY_INCOME > 100000;

-- 🔹 6. Use Logical Conditions
-- Show all applications approved with LoanAmount over 50,000.
SELECT APPLICATION_ID, LOAN_TYPE, PURPOSE_OF_LOAN FROM LOAN_APPLICATIONS WHERE LOAN_AMOUNT_REQUESTED >
 50000 AND LOAN_STATUS = 'APPROVED' LIMIT 5;
 

-- 🔹 7. Classify Credit Scores
-- Add a new column called CreditCategory with the following logic:
-- •	'Excellent' if CreditScore ≥ 750
-- •	'Good' if 650–749
-- •	'Fair' if 550–649
-- •	'Poor' if below 550

ALTER TABLE LOAN_APPLICATIONS
ADD COLUMN CREDIT_CATEGORY VARCHAR(20);
UPDATE LOAN_APPLICATIONS
SET CREDIT_CATEGORY =
CASE
WHEN CREDIT_SCORE = 750 THEN 'EXCELLENT'
WHEN CREDIT_SCORE BETWEEN 650 AND 749 THEN 'GOOD'
WHEN CREDIT_SCORE BETWEEN 550 AND 649 THEN 'FAIR'
ELSE 'POOR'
END;
SET SQL_SAFE_UPDATES = 0;

-- 🔹 8. Subquery – Above Average Loan Amount
-- Retrieve all applications with LoanAmount higher than the overall average LoanAmount.
SELECT AVG(LOAN_AMOUNT_REQUESTED) FROM LOAN_APPLICATIONS;
SELECT APPLICATION_ID, AVG(LOAN_AMOUNT_REQUESTED) FROM LOAN_APPLICATIONS WHERE LOAN_AMOUNT_REQUESTED 
>'509563.634' GROUP BY APPLICATION_ID LIMIT 5;

-- 🔹 9. Applications by Approval Status
-- Show ApprovalStatus and count of applications for each status.
SELECT LOAN_STATUS, COUNT(APPLICATION_ID) AS APPLICATION_COUNT FROM LOAN_APPLICATIONS GROUP BY LOAN_STATUS;

-- 🔹 10. Sort by Risk
-- List all applications ordered by CreditScore ascending (to see higher risk first).
SELECT APPLICATION_DATE, LOAN_TYPE, CREDIT_SCORE FROM LOAN_APPLICATIONS ORDER BY CREDIT_SCORE ASC LIMIT 5;

-- ✅ Deliverable
-- Prepare a single SQL script or document containing all 10 queries, clearly labeled and easy to read.
-- You may also include:
-- •	Comments explaining your logic.
-- •	Screenshots of your query results (optional).

-- ✅ Notes
-- •	Ensure your queries run correctly.
-- •	Test with sample data if needed
