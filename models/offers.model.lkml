connection: "snowflake_credit"

include: "/views/*.view"

datagroup: offers_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: offers_default_datagroup

label: "Arro Offer Monitoring"

explore: customer_offers_events {
  join: user_profile {
    type: inner
    sql_on: ${customer_offers_events.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  join: user_offers_placement_pt {
    type: left_outer
    sql_on: ${customer_offers_events.user_id} = ${user_offers_placement_pt.user_id}
      and ${customer_offers_events.event_date} = ${user_offers_placement_pt.snap_date}
      and ${customer_offers_events.offer_id} = ${user_offers_placement_pt.offer_id} ;;
    relationship: many_to_many
  }
}

explore: user_offers_placement_pt {
  join: user_profile {
    type: inner
    sql_on: ${user_offers_placement_pt.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_one
  }

  join: customer_offers_events {
    type: left_outer
    sql_on: ${customer_offers_events.user_id} = ${user_offers_placement_pt.user_id}
      and ${customer_offers_events.event_date} = ${user_offers_placement_pt.snap_date}
      and ${customer_offers_events.offer_id} = ${user_offers_placement_pt.offer_id} ;;
    relationship: many_to_many
  }
}

explore: user_profile {
  join: customer_offers_events {
    type: left_outer
    sql_on: ${customer_offers_events.user_id} = ${user_profile.user_id} ;;
    relationship: one_to_many
  }

  join: user_offers_placement_pt {
    type: left_outer
    sql_on: ${user_offers_placement_pt.user_id} = ${user_profile.user_id} ;;
    relationship: many_to_many
  }
}
