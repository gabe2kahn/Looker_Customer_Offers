view: customer_offers_events {
  sql_table_name: "CUSTOMER"."CUSTOMER_OFFERS_EVENTS" ;;

  dimension: account_age {
    type: number
    sql: DATEDIFF(DAYS,${user_profile.application_approval_date},${event_date} ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}."EVENT_NAME" ;;
  }
  dimension_group: event {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."EVENT_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: offer_category {
    type: string
    sql: ${TABLE}."OFFER_CATEGORY" ;;
  }
  dimension: offer_description {
    type: string
    sql: ${TABLE}."OFFER_DESCRIPTION" ;;
  }
  dimension: offer_event_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."OFFER_EVENT_ID" ;;
  }
  dimension: offer_id {
    type: number
    sql: ${TABLE}."OFFER_ID" ;;
  }
  dimension: offer_name {
    type: string
    sql: ${TABLE}."OFFER_NAME" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: events {
    type: count_distinct
    sql: ${offer_event_id} ;;
  }

  measure: median_account_age {
    type: number
    sql: MEDIAN(${account_age} ;;
  }

}