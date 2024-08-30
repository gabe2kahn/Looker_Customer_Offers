view: user_offers_placement_bc {
  sql_table_name: "CUSTOMER"."USER_OFFERS_PLACEMENT_BC" ;;

  dimension_group: insert_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."INSERT_TS" ;;
  }
  dimension: offer_category {
    type: string
    sql: ${TABLE}."OFFER_CATEGORY" ;;
  }
  dimension_group: offer_created_ts {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OFFER_CREATED_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: offer_deleted_ts {
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
  dimension_group: offer_last_updated_ts {
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
    sql: ${TABLE}."PLACEMENT_NUMBER" ;;
  }
  dimension_group: snap {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SNAP_DATE" ;;
  }
  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }
  measure: count {
    type: count
    drill_fields: [offer_name]
  }
}
