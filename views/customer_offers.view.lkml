view: customer_offers {
  sql_table_name: "CUSTOMER"."CUSTOMER_OFFERS" ;;

  dimension: clicked_ind {
    type: yesno
    sql: ${TABLE}."CLICKED_IND" ;;
  }
  dimension: converted_ind {
    type: yesno
    sql: ${TABLE}."CONVERTED_IND" ;;
  }

  dimension: deleted_ind {
    type: yesno
    sql: ${TABLE}."DELETED_IND" ;;
  }
  dimension_group: last_update {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."LAST_UPDATE_TS" ;;
  }
  dimension: offer_category {
    type: string
    sql: ${TABLE}."OFFER_CATEGORY" ;;
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
  dimension: offer_name {
    type: string
    sql: ${TABLE}."OFFER_NAME" ;;
  }
  dimension_group: offer_shown {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OFFER_SHOWN_TS" AS TIMESTAMP_NTZ) ;;
  }
  dimension_group: offer_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: CAST(${TABLE}."OFFER_UPDATED_TS" AS TIMESTAMP_NTZ) ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${user_id}||' '||${offer_id} ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: offers_shown {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: offers_clicked {
    type: count_distinct
    sql: CASE WHEN ${clicked_ind} = True THEN ${user_id} END ;;
  }

  measure: offers_deleted {
    type: count_distinct
    sql: CASE WHEN ${deleted_ind} = True THEN ${user_id} END ;;
  }

  measure: deletion_rate {
    type: number
    sql: ${offers_deleted}/${offers_shown} ;;
    value_format_name: percent_1
  }

  measure: click_rate {
    type: number
    sql: ${offers_clicked}/${offers_shown} ;;
    value_format_name: percent_1
  }

  measure: deletions_to_click_rate {
    type: number
    sql: ${offers_deleted}/${offers_clicked} ;;
    value_format_name: percent_1
  }

}
