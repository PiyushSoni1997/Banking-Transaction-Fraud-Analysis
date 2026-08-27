--Total Transactions
SELECT COUNT(*) AS Total_Tranactions
FROM dbo.Frauds

--Total Transaction amount
SELECT SUM(amount) AS Total_Transactions_Amount
FROM dbo.Frauds

--Average Transactions Amount
SELECT ROUND(AVG(amount), 2) AS Avg_Transactions_Amount
FROM dbo.Frauds

--Fraud Transactions and Fraud Rate
SELECT SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END) AS Fraud_Transactions, CAST(SUM(CASE WHEN isFraud = 1 THEN 1 ELSE 0 END)AS FLOAT) *100 / COUNT(*)  AS Fraud_Rate
FROM dbo.Frauds

--Fraud Amount 
SELECT SUM(amount) as Fraud_Amount
FROM dbo.Frauds
WHERE isFraud = 1

--Fraud Amount percent
SELECT (SUM(CASE WHEN isFraud = 1 THEN amount ELSE 0 END))*100/SUM(amount) as Fraud_Percent
FROM dbo.Frauds

--Flagged Transactions
SELECT SUM(isFlaggedFraud) as Flagged_Fraud
FROM dbo.Frauds

--Unique SENDERS and Destinations

SELECT COUNT(DISTINCT nameOrig) as No_of_Senders, COUNT(DISTINCT nameDest) as No_of_Recievers
FROM dbo.Frauds
