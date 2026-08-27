import pandas as pd
import streamlit as st
import joblib


loaded_preprocessor = joblib.load("preprocessor.pkl")
loaded_model = joblib.load("rf_model.pkl")

st.set_page_config(page_title= "Banking Fraud Transaction", page_icon = "💳", layout = "wide", initial_sidebar_state="expanded")

st.title("Banking Fraud Prediction", text_alignment="center")



st.write("Please enter the transaction details")

st.divider()

#Feeding the Transaction Values

type = st.selectbox("Select the Transaction Type", ["CASH_IN", "CASH_OUT", "PAYMENT", "DEBIT", "TRANSFER"])

amount = st.number_input("Enter the amount", min_value = 0, max_value = 10000000)

oldbalanceOrg = st.number_input("Enter the Old Original balance")

newbalanceOrig = st.number_input("Enter the New Original balance")

oldbalanceDest = st.number_input("Enter old destination balance")

newbalanceDest = st.number_input("Enter new destination balance")

Desttype = st.selectbox("Destination", ["M", "C"])

hour = st.number_input("Enter the hour", min_value = 0, max_value = 23)

Day_Name = st.selectbox("Weekday", ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"])

Orginal_balance_diff = oldbalanceOrg - newbalanceOrig

Dest_balance_diff = oldbalanceDest - newbalanceDest

amount_to_orig_balance = amount / (oldbalanceOrg + 1)

amount_to_dest_balance = amount / (oldbalanceDest + 1)

if st.button("Transaction Data filled"):

    st.write("Data has been succeessfully feeded")


input_data = pd.DataFrame({
    "type": [type],
    "amount": [amount],
    "oldbalanceOrg": [oldbalanceOrg],
    "newbalanceOrig": [newbalanceOrig],
    "oldbalanceDest": [oldbalanceDest],
    "newbalanceDest": [newbalanceDest],
    "Desttype": [Desttype],
    "hour": [hour],
    "Day_Name":[Day_Name],
    "Orginal_balance_diff": [Orginal_balance_diff],
    "Dest_balance_diff": [Dest_balance_diff],
    "amount_to_orig_balance": [amount_to_orig_balance],
    "amount_to_dest_balance": [amount_to_dest_balance]
})


st.divider()
st.subheader("Transaction Details") 
st.dataframe(input_data, use_container_width=True)


if st.button("Check Transaction fraud", use_container_width=True):

    prediction = loaded_model.predict(input_data)[0]

    # Probability
    if hasattr(loaded_model, "predict_proba"):
        probability = loaded_model.predict_proba(input_data)[0][1]
    else:
        probability = None

    st.divider()


 
    if prediction == 1:

        st.error("🚨 FRAUDULENT TRANSACTION")

        if probability is not None:
            st.metric(
                "Fraud Probability",
                f"{probability * 100:.2f}%"
            )

        st.warning(
            "This transaction has been classified as potentially fraudulent."
        )

    else:

        st.success("✅ LEGITIMATE TRANSACTION")

        if probability is not None:
            st.metric(
                "Fraud Probability",
                f"{probability * 100:.2f}%"
            )

        st.info(
            "This transaction has been classified as legitimate."
        )   