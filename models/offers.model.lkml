connection: "snowflake_credit"

include: "/views/*.view"

datagroup: offers_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: offers_default_datagroup

label: "Arro Offer Monitoring"

explore: customer_offers {
  join: user_profile {
    type: inner
    sql_on: ${customer_offers.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }
}
