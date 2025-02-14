SELECT
'' AS "EXTERNAL CASE ID"
RPT_DISPENSE.ENCRYPTED_PATIENT_ID AS "EXTERNAL PATIENT ID"
RPT_DISPENSE.PATIENT_FIRST_NAME AS "PATIENT FIRST NAME"
RPT_DISPENSE.PATIENT_LAST_NAME AS "PATIENT LAST NAME"
RPT_DISPENSE.PATIENT_DOB AS "PATIENT DOB"
CASE WHEN RPT_DISPENSE.PATIENT_GENDER = ''M'' THEN ''M'' WHEN RPT_DISPENSE.PATIENT_GENDER = ''F'' THEN ''F'' ELSE ''U'' END  AS "PATIENT GENDER"
RPT_DISPENSE.PATIENT_ADDRESS_1 AS "PATIENT ADDRESS"
RPT_DISPENSE.PRIMARY_PAYER_NAME AS "PRIMARY PAYER NAME"
RPT_DISPENSE.PRIMARY_PAYER_IDENTIFIER AS "PRIMARY PAYER MEMBER ID"
RPT_DISPENSE.PRIMARY_PAYER_BIN AS "PRIMARY PAYER RX BIN"
RPT_DISPENSE.PRIMARY_PAYER_PCN AS "PRIMARY PAYER RX PCN"
RPT_DISPENSE.PRIMARY_GROUP AS "PRIMARY PAYER RX GROUP"
RPT_DISPENSE.PRESCRIBER_FIRST_NAME AS "PROVIDER FIRST NAME"
RPT_DISPENSE.PRESCRIBER_LAST_NAME AS "PROVIDER LAST NAME"
RPT_DISPENSE.PRESCRIBER_NPI AS "PROVIDER NPI"
'' AS "PRACTICE TAX ID"
RPT_DISPENSE.PRESCRIBER_FACILITY AS "PRACTICE NAME"
RPT_DISPENSE.PRESCRIBER_ADDRESS_1 AS "PRACTICE ADDRESS"
RPT_DISPENSE.DRUG_NAME AS "DRUG NAME"
RPT_DISPENSE.DRUG_NDCD  AS "DRUG NDC"
'' AS "APPOINTMENT DATE"


FROM DEV_BIO_MLS_IL_SP_DB.BIO_STAGE.RPT_DISPENSE
WHERE RPT_DISPENSE.DRUG_NDCD NOT IN (51285020401,51285020401,59365512801)
AND RPT_DISPENSE.SHIP_DATE >= GETDATE() - 60
AND RPT_DISPENSE.PATIENT_DO_NOT_USE_FLAG = 0