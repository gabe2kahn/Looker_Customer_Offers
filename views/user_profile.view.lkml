view: user_profile {
  sql_table_name: "CUSTOMER"."USER_PROFILE" ;;

  dimension: activity_status {
    type: string
    sql: ${TABLE}."ACTIVITY_STATUS" ;;
  }
  dimension: application_annual_income {
    type: number
    sql: ${TABLE}."APPLICATION_ANNUAL_INCOME" ;;
  }
  dimension_group: application_approval {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."APPLICATION_APPROVAL_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: application_connected_bank_balance {
    type: number
    sql: ${TABLE}."APPLICATION_CONNECTED_BANK_BALANCE" ;;
  }
  dimension: approval_test_ind {
    type: string
    sql: ${TABLE}."APPROVAL_TEST_IND" ;;
  }
  dimension: appsflyer_attribution_source {
    type: string
    sql: ${TABLE}."APPSFLYER_ATTRIBUTION_SOURCE" ;;
  }
  dimension: arro_card_id {
    type: string
    sql: ${TABLE}."ARRO_CARD_ID" ;;
  }
  dimension: arro_risk_model_1_score {
    type: number
    sql: ${TABLE}."ARRO_RISK_MODEL_1_SCORE" ;;
  }
  dimension: arro_risk_model_2_score {
    type: number
    sql: ${TABLE}."ARRO_RISK_MODEL_2_SCORE" ;;
  }
  dimension_group: card_creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."CARD_CREATION_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: card_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."CARD_UPDATE_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: chargeoff {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."CHARGEOFF_DATE" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: closed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."CLOSED_DATE" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: credit_policy_version {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."CREDIT_POLICY_VERSION" ;;
  }
  dimension: current_balance {
    type: number
    sql: ${TABLE}."CURRENT_BALANCE" ;;
  }
  dimension: current_base_interest_rate {
    type: string
    sql: ${TABLE}."CURRENT_BASE_INTEREST_RATE" ;;
  }
  dimension: current_card_status {
    type: string
    sql: ${TABLE}."CURRENT_CARD_STATUS" ;;
  }
  dimension: current_credit_limit {
    type: string
    sql: ${TABLE}."CURRENT_CREDIT_LIMIT" ;;
  }
  dimension: current_level {
    type: string
    sql: ${TABLE}."CURRENT_LEVEL" ;;
  }
  dimension: docv_ind {
    type: string
    sql: ${TABLE}."DOCV_IND" ;;
  }
  dimension: galileo_account_status {
    type: string
    sql: ${TABLE}."GALILEO_ACCOUNT_STATUS" ;;
  }
  dimension: galileo_card_id {
    type: string
    sql: ${TABLE}."GALILEO_CARD_ID" ;;
  }
  dimension: galileo_payment_reference_number {
    type: string
    sql: ${TABLE}."GALILEO_PAYMENT_REFERENCE_NUMBER" ;;
  }
  dimension: highest_socure_fraud_risk_score {
    type: number
    sql: ${TABLE}."HIGHEST_SOCURE_FRAUD_RISK_SCORE" ;;
  }
  dimension: initial_base_interest_rate {
    type: number
    sql: ${TABLE}."INITIAL_BASE_INTEREST_RATE" ;;
  }
  dimension: initial_credit_limit {
    type: number
    sql: ${TABLE}."INITIAL_CREDIT_LIMIT" ;;
  }
  dimension_group: last_level_up_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LAST_LEVEL_UP_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: last_physical_card_ship {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LAST_PHYSICAL_CARD_SHIP_DATE" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: last_sign {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."LAST_SIGN_IN" AS TIMESTAMP_NTZ) ;;
  }

  dimension: line_test_ind {
    type: string
    sql: ${TABLE}."LINE_TEST_IND" ;;
  }
  dimension: loanpro_bank_id {
    type: number
    sql: ${TABLE}."LOANPRO_BANK_ID" ;;
  }
  dimension: loanpro_card_id {
    type: string
    sql: ${TABLE}."LOANPRO_CARD_ID" ;;
  }
  dimension: loanpro_customer_id {
    type: number
    sql: ${TABLE}."LOANPRO_CUSTOMER_ID" ;;
  }
  dimension: loanpro_loc_id {
    type: number
    sql: ${TABLE}."LOANPRO_LOC_ID" ;;
  }
  dimension: onboarded_ind {
    type: yesno
    sql: ${TABLE}."ONBOARDED_IND" ;;
  }
  dimension: onboarding_status {
    type: string
    sql: ${TABLE}."ONBOARDING_STATUS" ;;
  }
  dimension: peach_borrower_id {
    type: string
    sql: ${TABLE}."PEACH_BORROWER_ID" ;;
  }
  dimension: peach_draw_id {
    type: string
    sql: ${TABLE}."PEACH_DRAW_ID" ;;
  }
  dimension: peach_loan_id {
    type: string
    sql: ${TABLE}."PEACH_LOAN_ID" ;;
  }
  dimension: peach_loan_type_id {
    type: string
    sql: ${TABLE}."PEACH_LOAN_TYPE_ID" ;;
  }
  dimension: physical_card_status {
    type: string
    sql: ${TABLE}."PHYSICAL_CARD_STATUS" ;;
  }
  dimension: policy_20230929_approval_ind {
    type: string
    sql: ${TABLE}."POLICY_20230929_APPROVAL_IND" ;;
  }
  dimension: policy_20240117_approval_ind {
    type: string
    sql: ${TABLE}."POLICY_20240117_APPROVAL_IND" ;;
  }
  dimension: rollout_line_assignment {
    type: number
    sql: ${TABLE}."ROLLOUT_LINE_ASSIGNMENT" ;;
  }
  dimension: testing_stage {
    type: string
    sql: ${TABLE}."TESTING_STAGE" ;;
  }
  dimension: trueaccord_status {
    type: string
    sql: ${TABLE}."TRUEACCORD_STATUS" ;;
  }
  dimension_group: user_creation {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."USER_CREATION_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}."USER_ID" ;;
  }
  dimension: vantage_score {
    type: number
    sql: ${TABLE}."VANTAGE_SCORE" ;;
  }

  measure: median_application_income {
    type: number
    sql: ${application_annual_income} ;;
  }
}
