# The name of this view in Looker is "Gcma Demo Table"
view: gcma_demo_table {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `project_polaris_ai_ds.GCMA_DEMO_TABLE` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "A0 Offer Products" in Explore.

  dimension: a0_offer_products {
    type: string
    sql: ${TABLE}.a0_Offer_Products ;;
  }

  dimension: account_2023_gcp_greenfield_flag {
    type: string
    sql: ${TABLE}.Account_2023_GCP_Greenfield_Flag ;;
  }

  dimension: account_2023_gws_greenfield_flag {
    type: string
    sql: ${TABLE}.Account_2023_GWS_Greenfield_Flag ;;
  }

  dimension: account_2024_gcp_greenfield_flag {
    type: string
    sql: ${TABLE}.Account_2024_GCP_Greenfield_Flag ;;
  }

  dimension: account_2024_gws_greenfield_flag {
    type: string
    sql: ${TABLE}.Account_2024_GWS_Greenfield_Flag ;;
  }

  dimension: account_gcp_greenfield_flag {
    type: string
    sql: ${TABLE}.Account_GCP_Greenfield_Flag ;;
  }

  dimension: account_gws_greenfield_flag {
    type: string
    sql: ${TABLE}.Account_GWS_Greenfield_Flag ;;
  }

  dimension: account_key {
    type: string
    sql: ${TABLE}.Account_Key ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.Account_Name ;;
  }

  dimension: account_sales_team_region {
    type: string
    sql: ${TABLE}.Account_Sales_Team_Region ;;
  }

  dimension: inquiry_campaign_member_status {
    type: string
    sql: ${TABLE}.Inquiry_Campaign_Member_Status ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: inquiry_datetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Inquiry_Datetime ;;
  }

  dimension: inquiry_key {
    type: string
    sql: ${TABLE}.Inquiry_Key ;;
  }

  dimension: lead_product_family {
    type: string
    sql: ${TABLE}.Lead_Product_Family ;;
  }

  dimension: marketing_channel {
    type: string
    sql: ${TABLE}.Marketing_Channel ;;
  }

  dimension: marketing_program_end_date {
    type: string
    sql: ${TABLE}.Marketing_Program_End_Date ;;
  }

  dimension: marketing_program_event_first_or_third_party {
    type: string
    sql: ${TABLE}.Marketing_Program_Event_First_or_Third_Party ;;
  }

  dimension: marketing_program_event_target_buyer_segment {
    type: string
    sql: ${TABLE}.Marketing_Program_Event_Target_Buyer_Segment ;;
  }

  dimension: marketing_program_event_type {
    type: string
    sql: ${TABLE}.Marketing_Program_Event_Type ;;
  }

  dimension: marketing_program_key {
    type: string
    sql: ${TABLE}.Marketing_Program_Key ;;
  }

  dimension: marketing_program_name {
    type: string
    sql: ${TABLE}.Marketing_Program_Name ;;
  }

  dimension: marketing_program_owner_cost_center {
    type: string
    sql: ${TABLE}.Marketing_Program_Owner_Cost_Center ;;
  }

  dimension: marketing_program_owner_email {
    type: string
    sql: ${TABLE}.Marketing_Program_Owner_Email ;;
  }

  dimension: marketing_program_start_date {
    type: string
    sql: ${TABLE}.Marketing_Program_Start_Date ;;
  }

  dimension: offer_sfdc_campaign_id {
    type: string
    sql: ${TABLE}.Offer_Sfdc_Campaign_Id ;;
  }

  dimension: offer_sfdc_campaign_name {
    type: string
    sql: ${TABLE}.Offer_Sfdc_Campaign_Name ;;
  }

  dimension: offer_sfdc_program_instance_id {
    type: string
    sql: ${TABLE}.Offer_Sfdc_Program_Instance_Id ;;
  }

  dimension: opportunity_product_category {
    type: string
    sql: ${TABLE}.Opportunity_Product_Category ;;
  }

  dimension: opportunity_product_family {
    type: string
    sql: ${TABLE}.Opportunity_Product_Family ;;
  }

  dimension: person_buyer_segment {
    type: string
    sql: ${TABLE}.Person_Buyer_Segment ;;
  }

  dimension: person_buyer_segment_rollup {
    type: string
    sql: ${TABLE}.Person_Buyer_Segment_Rollup ;;
  }

  dimension: person_persona {
    type: string
    sql: ${TABLE}.Person_Persona ;;
  }

  dimension: sfdc_account_id {
    type: string
    sql: ${TABLE}.Sfdc_Account_Id ;;
  }
  measure: count {
    type: count
    drill_fields: [offer_sfdc_campaign_name, account_name, marketing_program_name]
  }
}
