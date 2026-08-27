# Banking-Transaction-Fraud-Analysis

:/Project Overview

This project focuses on analyzing banking transaction data to identify transaction patterns, detect fraudulent activities, and build machine learning models for fraud detection.The project combines Python, SQL, Machine Learning, Power BI, and Streamlit to create an end-to-end data analytics and machine learning workflow. 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:/Business Problem
Financial institutions process millions of transactions, making it difficult to manually identify fraudulent activities. Fraudulent transactions can result in significant financial losses.

The objective of this project is to:

1. Analyze banking transaction patterns.
2. Identify factors associated with fraudulent transactions.
3. Detect high-risk transactions.
4. Build and compare multiple machine learning models.
5. Handle the highly imbalanced fraud dataset.
6. Evaluate models using appropriate classification metrics.
7. Create SQL-based business insights.
8. Build an interactive Power BI dashboard.
9.Develop a Streamlit application for fraud prediction.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Project Workflow:

Banking Transaction Dataset
          │
          ▼
    Data Understanding
          │
          ▼
     Data Cleaning
          │
          ▼
 Exploratory Data Analysis
          │
          ▼
  Feature Engineering
          │
          ▼
      SQL Analysis
          │
          ▼
 Machine Learning Models
          │
          ▼
  Model Evaluation
          │
          ▼
   Fraud Prediction
          │
          ├──────────────► Power BI Dashboard
          │
          └──────────────► Streamlit Application

          

          Target Variable
              isFraud

    0 → Legitimate Transaction
    1 → Fraudulent Transaction

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Data Cleaning:

:/The following steps were performed during data preprocessing:

1. Checked dataset dimensions.
2. Inspected data types.
3. Checked for missing values.
4. Checked duplicate records.
5. Analyzed unique values.
6. Identified numerical and categorical features.
7. Examined class imbalance in the target variable.
8. Removed unnecessary identifier columns where appropriate.
9. Prepared features for machine learning pipelines.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

:/Exploratory Data Analysis in Python and SQL--->

The following analyses were performed:

Transaction Analysis
1. Total number of transactions.
2. Total transaction amount.
3. Average transaction amount.
4. Maximum transaction amount.
5. Transaction distribution by transaction type.
6. Transaction volume over time.
7. Transaction amount distribution.

Fraud Analysis
1. Total fraudulent transactions.
2. Fraud rate.
3. Fraud amount.
4. Average fraud amount.
5. Fraud distribution by transaction type.
6. Fraud transactions over time.
7. Fraud amount by hour/time step.
8. Comparison between legitimate and fraudulent transaction amounts.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Feature Engineering

Additional features were created to improve fraud detection.

Examples include:

    balanceDiffOrig = oldbalanceOrg - newbalanceOrig
    balanceDiffDest = newbalanceDest - oldbalanceDest
    logAmount = log1p(amount)

Potential engineered features include:

-Sender balance difference.
-Recipient balance difference.
-Log transaction amount.
-Transaction type encoding.
-Transaction time features.
-Balance inconsistency indicators.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Machine Learning Models

The following machine learning algorithms were trained and evaluated:

1. Logistic Regression
2. Decision Tree Classifier
3. Random Forest Classifier
4' Gradient Boosting Classifier
5. Extra Trees Classifier
6. GAUSIAN NB

The models were evaluated using:

Accuracy
Precision
Recall
F1 Score
ROC-AUC
PR-AUC
Confusion Matrix

Recall and Precision were the two important parameters here:
In fraud detection, Recall measures how many actual fraudulent transactions were successfully detected.

    Recall = TP / (TP + FN)
A higher recall means fewer fraudulent transactions are missed.

Precision measures how many transactions predicted as fraud were actually fraudulent.
    
    Precision = TP / (TP + FP)
This helps reduce unnecessary investigations of legitimate transactions.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Power BI Dashboard

An interactive Power BI dashboard was created to monitor banking transactions and fraudulent activities.

:/Dashboard KPIs

1. Total Transactions
2. Total Transaction Amount
3. Total Fraud Transactions
4. Fraud Rate
5. Total Fraud Amount
6. Average Fraud Amount

   
:/Dashboard Visualizations

1. Transaction count by type.
2. Transaction amount by type.
3. Fraud transactions by type.
4. Fraud rate by transaction type.
5. Fraud trend over time.
6. Transaction amount distribution.
7. Fraud vs legitimate transaction comparison.
8. Top high-value transactions.
9. Fraud amount analysis.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Streamlit Application

A Streamlit application was developed to make predictions using the trained machine learning model.

The user can enter transaction details such as:

1. Transaction type.
2. Transaction amount.
3. Sender balance.
4. Recipient balance.

The application returns:

Fraud Probability

Prediction:
Legitimate Transaction / Fraudulent Transaction

