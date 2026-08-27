--Fraud vs Non Fraud analysis

SELECT
    CASE
        WHEN isFraud = 1 THEN 'Fraud'
        ELSE 'Non-Fraud'
    END AS Transaction_Status,
    COUNT(*) AS Transactions,
    ROUND(SUM(amount),2) AS Total_Amount,
    ROUND(AVG(amount),2) AS Avg_Amount

FROM dbo.Frauds
GROUP BY isFraud;

--Fraud Trend By Hour

SELECT hour, isFraud, COUNT(*) AS Transactions, ROUND(SUM(amount),2) AS Total_Amount, ROUND(AVG(amount),2) AS Avg_Amount
From dbo.Frauds
GROUP BY hour, isFraud
HAVING isFraud = 1
order by Total_Amount DESC

-- Fraud Trend by WeekDAY
SELECT Day_Name, isFraud, COUNT(*) AS Transactions, ROUND(SUM(amount),2) AS Total_Amount, ROUND(AVG(amount),2) AS Avg_Amount
From dbo.Frauds
GROUP BY Day_Name, isFraud
HAVING isFraud = 1
order by Total_Amount DESC

--High Value Transactions

SELECT TOP 20
    amount,
    nameOrig,
    nameDest,
    oldbalanceOrg,
    newbalanceOrig,
    oldbalanceDest,
    newbalanceDest,
    isFraud

FROM dbo.Frauds

ORDER BY amount DESC;

--High Value Fraud Transactions


SELECT TOP 20
    amount,
    nameOrig,
    nameDest,
    oldbalanceOrg,
    newbalanceOrig,
    oldbalanceDest,
    newbalanceDest,
    isFraud

FROM dbo.Frauds
WHERE isFraud = 1

ORDER BY amount DESC;

--Sender Analysis

SELECT TOP 20
    nameOrig AS Sender,
    COUNT(*) AS Transaction_Count,
    SUM(amount) AS Total_Amount,
    AVG(amount) AS Avg_Amount,
    SUM(isFraud) AS Fraud_Count

FROM dbo.Frauds
GROUP BY nameOrig
ORDER BY Total_Amount DESC;

--Most Fraudulent Senders

SELECT TOP 20
    nameOrig as Fraud_Senders,
    COUNT(*) as Transaction_Count,
    SUM(amount) as Total_Amount,
    SUM(isFraud) as Fraud_Count
FROM dbo.Frauds
GROUP BY nameOrig
HAVING SUM(isFraud) = 1
ORDER BY Total_Amount DESC;



