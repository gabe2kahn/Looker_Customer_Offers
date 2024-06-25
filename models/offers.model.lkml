connection: "snowflake_credit"

datagroup: offers_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: offers_default_datagroup

label: "Arro Offer Monitoring"
