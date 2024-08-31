view: user_offers_placement_pt {
  sql_table_name: "CUSTOMER"."USER_OFFERS_PLACEMENT_PT" ;;

  dimension_group: insert {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."INSERT_TS" ;;
  }
  dimension: offer_category {
    type: string
    sql: ${TABLE}."OFFER_CATEGORY" ;;
  }
  dimension_group: offer_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OFFER_CREATED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: offer_deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OFFER_DELETED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: offer_description {
    type: string
    sql: ${TABLE}."OFFER_DESCRIPTION" ;;
  }
  dimension: offer_id {
    type: number
    sql: ${TABLE}."OFFER_ID" ;;
  }
  dimension_group: offer_last_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OFFER_LAST_UPDATED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension: offer_name {
    type: string
    sql: ${TABLE}."OFFER_NAME" ;;
  }
  dimension: placement_number {
    type: number
    sql: ${TABLE}."PLACEMENT_NUMBER" + 1;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id}||${offer_id}||${snap_date} ;;
  }

  dimension_group: snap {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SNAP_DATE" ;;
  }
  dimension: snap_order {
    type: number
    sql: ${TABLE}."SNAP_ORDER" ;;
  }
  dimension: snap_recency {
    type: number
    sql: ${TABLE}."SNAP_RECENCY" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: users {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: deletions {
    type: count_distinct
    sql: CASE WHEN ${offer_deleted_raw} IS NOT NULL THEN ${user_id} END ;;
  }
}
