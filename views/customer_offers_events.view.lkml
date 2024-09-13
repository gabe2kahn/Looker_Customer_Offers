view: customer_offers_events {
  sql_table_name: "CUSTOMER"."CUSTOMER_OFFERS_EVENTS" ;;

  dimension: account_age {
    type: number
    sql: DATEDIFF(DAYS,${user_profile.application_approval_date},${event_date}) ;;
  }

  dimension: account_age_bucket {
    type: string
    sql: CASE
      WHEN ${account_age} <= 30 THEN 'a. 0-30'
      WHEN ${account_age} <= 60 THEN 'b. 31-60'
      WHEN ${account_age} <= 90 THEN 'c. 61-90'
      WHEN ${account_age} <= 180 THEN 'd. 91-180'
      WHEN ${account_age} <= 365 THEN 'e. 181-365'
      WHEN ${account_age} > 365 THEN 'f. 365+'
    END ;;
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

  measure: user_rate {
    type: number
    sql: ${users}/${user_offers_placement_pt.users} ;;
  }

  measure: events {
    type: count_distinct
    sql: ${offer_event_id} ;;
  }

  measure: median_account_age {
    type: number
    sql: MEDIAN(${account_age}) ;;
  }

  measure: offers_viewed {
    type: count_distinct
    sql: CASE WHEN ${event_name} = 'visible' THEN ${offer_event_id} END ;;
  }

  measure: offers_clicked {
    type: count_distinct
    sql: CASE WHEN ${event_name} = 'clicked' THEN ${offer_event_id} END ;;
  }

  measure: offers_hidden {
    type: count_distinct
    sql: CASE WHEN ${event_name} = 'hidden' THEN ${offer_event_id} END ;;
  }

  measure: offers_converted {
    type: count_distinct
    sql: CASE WHEN ${event_name} = 'converted' THEN ${offer_event_id} END ;;
  }

}
