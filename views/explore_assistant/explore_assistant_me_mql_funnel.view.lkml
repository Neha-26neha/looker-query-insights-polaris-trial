# The name of this view in Looker is "Explore Assistant Me Mql Funnel"
view: explore_assistant_me_mql_funnel {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `explore_assistant.ME_MQL_Funnel` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account Engagement Type" in Explore.

  dimension: account_engagement_type {
    type: string
    sql: ${TABLE}.Account_Engagement_Type ;;
  }

  dimension: account_sales_micro_region {
    type: string
    sql: ${TABLE}.Account_Sales_Micro_Region ;;
  }

  dimension: account_sales_region {
    type: string
    sql: ${TABLE}.Account_Sales_Region ;;
  }

  dimension: account_sales_sub_region {
    type: string
    sql: ${TABLE}.Account_Sales_Sub_Region ;;
  }

  dimension: account_sales_team_nal_cluster {
    type: string
    sql: ${TABLE}.Account_Sales_Team_NAL_Cluster ;;
  }

  dimension: account_segment {
    type: string
    sql: ${TABLE}.Account_Segment ;;
  }

  dimension: attributed_mqls {
    type: number
    sql: ${TABLE}.Attributed_MQLs ;;
  }

  dimension: attributed_qsos {
    type: string
    sql: ${TABLE}.Attributed_QSOs ;;
  }

  dimension: attributed_s0s {
    type: string
    sql: ${TABLE}.Attributed_S0s ;;
  }

  dimension: buyer_segment {
    type: string
    sql: ${TABLE}.Buyer_Segment ;;
  }

  dimension: demand_type {
    type: string
    sql: ${TABLE}.Demand_Type ;;
  }

  dimension: greenfield_status {
    type: string
    sql: ${TABLE}.Greenfield_Status ;;
  }

  dimension: inquiry_source {
    type: string
    sql: ${TABLE}.Inquiry_Source ;;
  }

  dimension: lead_initial_routing_team {
    type: string
    sql: ${TABLE}.Lead_Initial_Routing_Team ;;
  }

  dimension: lead_owner_team {
    type: string
    sql: ${TABLE}.Lead_Owner_Team ;;
  }

  dimension: lead_owner_user_ldap {
    type: string
    sql: ${TABLE}.Lead_Owner_User_LDAP ;;
  }

  dimension: lead_owner_user_ldap_manager {
    type: string
    sql: ${TABLE}.Lead_Owner_User_LDAP_Manager ;;
  }

  dimension: lead_owner_user_ldap_manager_hierarchy {
    type: string
    sql: ${TABLE}.Lead_Owner_User_LDAP_Manager_Hierarchy ;;
  }

  dimension: lead_score {
    type: string
    sql: ${TABLE}.Lead_Score ;;
  }

  dimension: mql_aging_bucket {
    type: string
    sql: ${TABLE}.MQL_Aging_Bucket ;;
  }

  dimension: mql_aging_days {
    type: number
    sql: ${TABLE}.MQL_Aging_Days ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: mql {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MQL_Date ;;
  }

  dimension: mql_disposition {
    type: string
    sql: ${TABLE}.MQL_Disposition ;;
  }

  dimension_group: mql_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MQL_Month ;;
  }

  dimension: mql_result {
    type: string
    sql: ${TABLE}.MQL_Result ;;
  }

  dimension_group: mql_week {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.MQL_Week ;;
  }

  dimension: offer_type {
    type: string
    sql: ${TABLE}.Offer_Type ;;
  }

  dimension: okr_reporting_scope {
    type: string
    sql: ${TABLE}.OKR_Reporting_Scope ;;
  }

  dimension: sal_disposition {
    type: string
    sql: ${TABLE}.SAL_Disposition ;;
  }
  measure: count {
    type: count
  }
}
