view: Marketing_Engaged_MQL_Funnel {
  # The sql_table_name parameter indicates the underlying database table
  sql_table_name: `google.com:project-polaris-ai.project_polaris_ai_ds.ME_MQL_Funnel` ;;

  # No mary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Account_Engagement_Type Type Dimension
  dimension: Account_Engagement_Type {
    type: string
    sql: ${TABLE}.Account_Engagement_Type ;;
    label: "Account Engagement Type"
    description: "For Inquiries & Leads, indicates Attribution 3.0 attribution eligibility by flagging whether it is a High Value exception, sourced from a currently High Engagement account, or sourced from a currently Low Engagement account. 'Not in Attribution 3.0 Scope' indicates that it is neither sourced from an A3.0-eligible account, the 6 OKR regions, nor associated with GCP/GWS products. "
    tags: ["Account Engagement Type","Engagement Type","Engagement"]
  }

  # Account_Sales_Micro_Region Dimension
  dimension: Account_Sales_Micro_Region {
    type: string
    sql:${TABLE}.Account_Sales_Micro_Region;;
    label: "Account Sales Micro Region"
    description: "Sales microregion for which the account is assigned."
    tags: ["Account Sales Micro Region","Sales Micro Region","Micro Region"]
  }

  # Account_Sales_Region Dimension
  dimension: Account_Sales_Region {
    type: string
    sql: ${TABLE}.Account_Sales_Region ;;
    label: "Account Sales Region"
    description: "Sales region for which the account is assigned."
    tags: ["Account Sales Region","Sales Region","Region"]
  }

  # Account_Sales_Sub_Region Dimension
  dimension: Account_Sales_Sub_Region {
    type: string
    sql: ${TABLE}.Account_Sales_Sub_Region ;;
    label: "Account Sales Sub Region"
    description: "Sales subregion for which the account is assigned."
    tags: ["Account Sales Sub Region","Sales Sub Region","Sub Region"]
  }

  # Account_Sales_Team_NAL_Cluster Dimension
  dimension: Account_Sales_Team_NAL_Cluster {
    type: string
    sql: ${TABLE}.Account_Sales_Team_NAL_Cluster ;;
    label: "Account Sales Team NAL Cluster"
    description: "Sales NAL cluster for which the account is assigned."
    tags: ["Account Sales Team NAL Cluster","Sales NAL Cluster"]
  }

  # Account_Segment Dimension
  dimension: Account_Segment {
    type: string
    sql: ${TABLE}.Account_Segment ;;
    label: "Account Segment"
    description: "The segment represents the spending potential of the Account on Cloud Products."
    tags: ["Account Segment","Segment"]
  }

  # Attributed_MQLs Dimension
  dimension: Attributed_MQLs {
    type: number
    sql:${TABLE}.Attributed_MQLs;;
    label: "Attributed MQLs"
    description: "Attributed number of MQLs (between 0 & 1) that indicates the fraction of the MQL that is attributable to each Inquiry that sourced it."
    tags: ["Attributed MQLs","MQLs"]
  }

  # Attributed_MQLs Measure
  measure: Total_MQLs {
    type: number
    sql: SUM(${TABLE}.Attributed_MQLs) ;;
    label: "Total MQLs"
    description: "Sum of Attributed number of MQLs (between 0 & 1) that indicates the fraction of the MQL that is attributable to each Inquiry that sourced it."
    tags: ["Sum of Attributed MQLs","Sum of MQLs","Count of MQLs","Total MQLs"]
  }

  # MQL_Result Dimension
  dimension: MQL_Result {
    type: string
    sql: ${TABLE}.MQL_Result ;;
    label: "MQL Result"
    description: "Categorizes MQLs by their MQL SLA Result like Dispositioned without / in- / out-of-SLA, New without / in- / out-of-SLA, Auto Closed."
    tags: ["MQL Result","MQL Dispositioned"]
  }

  # Lead_Score Dimension
  dimension: Lead_Score {
    type: string
    sql: ${TABLE}.Lead_Score ;;
    label: "Lead Score"
    description: "Indicates the quality of the MQL based on the prospect's behavioral score."
    tags: ["Lead Score"]
  }

  # MQL_SLA_Rate Dimension
  measure: MQL_SLA_Rate {
    type: number
    sql: SUM(
        CASE
          WHEN ${MQL_Result} = 'Dispositioned In-SLA' THEN ${Attributed_MQLs}
          ELSE 0
          END)
        / NULLIF(
          SUM(
            CASE
              WHEN ${Lead_Score} IN ('A1', 'A2', 'A3') THEN ${Attributed_MQLs}
              ELSE 0
              END),
          0) ;;
    label: "MQL_SLA_Rate"
    description: "This attribute give details about MQLs Dispositioned In-SLA (%)"
    tags: ["MQL SLA Rate"]
  }

  # Rerouted_MQLs Dimension
  measure: Rerouted_MQLs {
    type: number
    sql: SUM(
        CASE
          WHEN ${Lead_Initial_Routing_Team} <> ${Lead_Owner_Team} THEN ${Attributed_MQLs}
          ELSE NULL
          END) ;;
    label: "Rerouted_MQLs"
    description: "This attribute give details about Rerouted_MQLs"
    tags: ["Rerouted MQLs"]
  }

  # Not_Rerouted_MQLs Dimension
  measure: Not_Rerouted_MQLs {
    type: number
    sql: SUM(
        CASE
          WHEN ${Lead_Initial_Routing_Team} = ${Lead_Owner_Team} THEN ${Attributed_MQLs}
          ELSE NULL
          END) ;;
    label: "Not_Rerouted_MQLs"
    description: "This attribute give details about Not_Rerouted_MQLs"
    tags: ["Not Rerouted MQLs"]
  }

  # MQL_Rerouted_Rate Dimension
  measure: MQL_Rerouted_Rate {
    type: number
    sql: SUM(
        CASE
          WHEN ${Lead_Initial_Routing_Team} <> ${Lead_Owner_Team} THEN ${Attributed_MQLs}
          ELSE NULL
          END)
        / NULLIF(SUM(${Attributed_MQLs}), 0) ;;
    label: "MQL_Rerouted_Rate"
    description: "This attribute give details about MQL_Rerouted_Rate"
    tags: ["MQL Rerouted Rate"]
  }

  # MQL_Auto_Close_Rate Dimension
  measure: MQL_Auto_Close_Rate {
    type: number
    sql: SUM(
        CASE
          WHEN ${MQL_Result} = 'Not Dispositioned (Auto Closed)'
            THEN ${Attributed_MQLs}
          ELSE NULL
          END)
        / NULLIF(SUM(${Attributed_MQLs}), 0) ;;
    label: "MQL_Auto_Close_Rate"
    description: "This attribute give details about Auto Closed MQLs (%)"
    tags: ["MQL Auto Close Rate"]
  }

  # SFDC_Account_ID Dimension
  dimension: SFDC_Account_ID {
    type: string
    sql: ${TABLE}.SFDC_Account_ID ;;
    label: "SFDC Account ID"
    description: "The Salesforce ID for the account that the person belongs to. "
    tags: ["SFDC Account ID"]
  }

  # MQL_Accounts Dimension
  measure: MQL_Accounts {
    type: number
    sql: COUNT(
        DISTINCT
          CASE
            WHEN ${Attributed_MQLs} > 0 THEN ${SFDC_Account_ID}
            ELSE NULL
            END) ;;
    label: "MQL_Accounts"
    description: "This attribute give details about MQL Accounts"
    tags: ["MQL Accounts"]
  }

  # Dispositioned_MQL_Accounts Dimension
  measure: Dispositioned_MQL_Accounts {
    type: number
    sql: COUNT(
        DISTINCT
          CASE
            WHEN
              ${Attributed_MQLs} > 0
              AND (
                ${MQL_Disposition} = 'Rejected'
                OR ${SAL_Disposition} IN ('Opp Created', 'No Opp Created'))
              THEN ${SFDC_Account_ID}
            ELSE NULL
            END) ;;
    label: "Dispositioned_MQL_Accounts"
    description: "This attribute give details about Dispositioned MQL Accounts"
    tags: ["Dispositioned MQL Accounts"]
  }

  # QSO_Accounts Dimension
  measure: QSO_Accounts {
    type: number
    sql: COUNT(
        DISTINCT
          CASE
            WHEN ${Attributed_QSOs} > 0 THEN ${SFDC_Account_ID}
            ELSE NULL
            END) ;;
    label: "QSO_Accounts"
    description: "This attribute give details about count of QSO Accounts"
    tags: ["count of QSO Accounts","total QSO account"]
  }

  # ATO Dimension
  measure: ATO {
    type: number
    sql: `IF`(
        COUNT(
          DISTINCT
            CASE
              WHEN
                ${Attributed_MQLs} > 0
                AND (
                  ${MQL_Disposition} = 'Rejected'
                  OR ${SAL_Disposition} IN ('Opp Created', 'No Opp Created'))
                THEN ${SFDC_Account_ID}
              ELSE NULL
              END)
          = 0,
        NULL,
        COUNT(
          DISTINCT
            CASE
              WHEN ${Attributed_QSOs} > 0 THEN ${SFDC_Account_ID}
              ELSE NULL
              END)
          / COUNT(
            DISTINCT
              CASE
                WHEN
                  ${Attributed_MQLs} > 0
                  AND (
                    ${MQL_Disposition} = 'Rejected'
                    OR ${SAL_Disposition} IN ('Opp Created', 'No Opp Created'))
                  THEN ${SFDC_Account_ID}
                ELSE NULL
                END)) ;;
    label: "ATO"
    description: "This attribute give details about ATO (Accounts with a QSO/Accounts with a Dispositioned Lead)"
    tags: ["ATO"]
  }

  # Attributed_SALs Dimension
  dimension: Attributed_SALs {
    type: string
    sql:${TABLE}.Attributed_SALs;;
    label: "Attributed SALs"
    description: "Attributed number of SALs (between 0 & 1) that indicates the fraction of the SAL that is attributable to the Inquiries that sourced it. "
    tags: ["Attributed SALs"]
  }

  # MQL_to_SAL Dimension
  measure: MQL_to_SAL {
    type: number
    sql: SUM(${Attributed_SALs}) / NULLIF(SUM(${Attributed_MQLs}), 0) ;;
    label: "MQL_to_SAL"
    description: "This attribute give details about MQL to SAL"
    tags: ["MQL to SAL"]
  }

  # Attributed_SALs Dimension
  measure: Total_Attributed_SALs {
    type: number
    sql: SUM(${TABLE}.Attributed_SALs) ;;
    label: "Total_Attributed_SALs"
    description: "This attribute give details about sum of Attributed SALs"
    tags: ["sum of Attributed SALs","Sum of SALs"]
  }

  # SAL_to_S0 Dimension
  measure: SAL_to_S0 {
    type: number
    sql: SUM(${Attributed_S0s}) / NULLIF(SUM(${Attributed_SALs}), 0) ;;
    label: "SAL_to_S0"
    description: "This attribute give details about SAL to S0"
    tags: ["SAL to S0"]
  }

  # Attributed_S0s Dimension
  measure: Total_Attributed_S0s {
    type: number
    sql: SUM(${TABLE}.Attributed_S0s) ;;
    label: "Total_Attributed_S0s"
    description: "This attribute give details about Total_Attributed_S0s"
    tags: ["sum of Attributed S0s","Sum of S0s"]
  }

  # S0_to_QSO Dimension
  measure: S0_to_QSO {
    type: number
    sql: SUM(${Attributed_QSOs}) / NULLIF(SUM(${Attributed_S0s}), 0) ;;
    label: "S0_to_QSO"
    description: "This attribute give details about S0 to QSO"
    tags: ["S0 to QSO"]
  }

  # Attributed_QSOs Dimension
  measure: Total_Attributed_QSOs {
    type: number
    sql: SUM(${TABLE}.Attributed_QSOs) ;;
    label: "Total_Attributed_QSOs"
    description: "This attribute give details about Total_Attributed_QSOs"
    tags: ["sum of Attributed QSOs","Sum of QSOs"]
  }

  # MQL_to_QSO Dimension
  measure: MQL_to_QSO{
    type: number
    sql: SUM(${Attributed_QSOs}) / NULLIF(SUM(${Attributed_MQLs}), 0) ;;
    label: "MQL_to_QSO"
    description: "This attribute give details about MQL to QSO"
    tags: ["MQL to QSO"]
  }

# Attributed_QSOs Dimension
  dimension: Attributed_QSOs {
    type: number
    sql: ${TABLE}.Attributed_QSOs ;;
    label: "Attributed QSOs"
    description: "Attributed number (between 0 & 1) that indicates the fraction of the QSO that is attributable to eligible inquiries and/or leads (includes placeholders for outbound opportunities)."
    tags: ["Attributed QSOs"]
  }

# Attributed_S0s Dimension
  dimension: Attributed_S0s {
    type: number
    sql: ${TABLE}.Attributed_S0s ;;
    label: "Attributed S0s"
    description: "Attributed number (between 0 & 1) that indicates the fraction of the S0 that is attributable to eligible inquiries and/or leads (includes placeholders for outbound opportunities)."
    tags: ["Attributed S0s"]
  }

# Buyer_Segment_Rollup Dimension
  dimension: Buyer_Segment_Rollup {
    type: string
    sql: ${TABLE}.Buyer_Segment_Rollup ;;
    label: "Buyer Segment Rollup"
    description: "The propect's role at their company rolled up to Executive, Decision Maker, Practitioner, or Unknown based on the Buyer Segment model."
    tags: ["Buyer Segment Rollup"]
  }

# Demand_Type Dimension
  dimension: Demand_Type {
    type: string
    sql: ${TABLE}.Demand_Type ;;
    label: "Demand Type"
    description: "Indicates whether the marketing effort was part of the Inbound or Outbound funnel. Inbound starts the prospect journey with an inquiry while Outbound starts with opportunity creation from sales outreach assisted by Marketing."
    tags: ["Demand Type"]
  }

# Greenfield_Status Dimension
  dimension: Greenfield_Status {
    type: string
    sql:${TABLE}.Greenfield_Status;;
    label: "Greenfield Status"
    description: "Arbitrates the Greenfield status of demand based on the funnel stage, product, and date the demand was sourced -- use Greenfield Status to keep it simple!"
    tags: ["Greenfield Status"]
  }

# Inquiry_Source Dimension
  dimension: Inquiry_Source {
    type: string
    sql: ${TABLE}.Inquiry_Source ;;
    label: "Inquiry_Source"
    description: "Inquiry was sourced by Direct Marketing vs Partner Marketing. If there is overlap between Direct and Partner, credit is split evenly with multi-touch attribution."
    tags: ["Inquiry Source"]
  }

# Lead_Initial_Routing_Team Dimension
  dimension: Lead_Initial_Routing_Team {
    type: string
    sql: ${TABLE}.Lead_Initial_Routing_Team ;;
    label: "Lead Initial Routing Team"
    description: "Due to incomplete and/or outdated Vector profiles, this field categorizes & abitrates the Lead Initial Routing Team (BDR,FSR/Specialist, Partner, SDR) based on account roles, xDR roster,  and manager hierarchy."
    tags: ["Lead Initial Routing Team"]
  }

# Lead_Owner_Team Dimension
  dimension: Lead_Owner_Team {
    type: string
    sql: ${TABLE}.Lead_Owner_Team ;;
    label: "Lead Owner Team"
    description: "Due to incomplete and/or outdated Vector profiles, this field categorizes & abitrates the Lead Owner Team (BDR, FSR/Specialist,Partner, SDR) based on account roles, xDR roster,  and manager hierarchy."
    tags: ["Lead Owner Team","Lead Owner"]
  }

# Lead_Owner_User_LDAP Dimension
  dimension: Lead_Owner_User_LDAP {
    type: string
    sql: ${TABLE}.Lead_Owner_User_LDAP ;;
    label: "Lead Owner User LDAP"
    description: "The LDAP of the Salesforce user who currently owns the lead."
    tags: ["Lead Owner User LDAP","Lead Owner User"]
  }

# Lead_Owner_User_LDAP_Manager Dimension
  dimension: Lead_Owner_User_LDAP_Manager {
    type: string
    sql:${TABLE}.Lead_Owner_User_LDAP_Manager;;
    label: "Lead Owner User LDAP Manager"
    description: "The LDAP of the manager of the Salesforce user who currently owns the lead."
    tags: ["Lead Owner User LDAP Manager","Lead Owner User Manager"]
  }

# Lead_Owner_User_LDAP_Manager_Hierarchy Dimension
  dimension: Lead_Owner_User_LDAP_Manager_Hierarchy {
    type: string
    sql: ${TABLE}.Lead_Owner_User_LDAP_Manager_Hierarchy ;;
    label: "Lead Owner User LDAP Manager Hierarchy"
    description: "The LDAPs of the current Salesforce owner's manager's manager(s)."
    tags: ["Lead Owner User LDAP Manager Hierarchy","Lead Owner User Manager Hierarchy"]
  }

# MQL_Aging_Bucket Dimension
  dimension: MQL_Aging_Bucket {
    type: string
    sql: ${TABLE}.MQL_Aging_Bucket ;;
    label: "MQL Aging Bucket"
    description: "Buckets MQLs by the number of days from qualification to disposition, or if the MQL is still in New, the number of days since qualification."
    tags: ["MQL Aging Bucket","Aging Bucket"]
  }

# MQL_Aging_Days Dimension
  dimension: MQL_Aging_Days {
    type: number
    sql: ${TABLE}.MQL_Aging_Days ;;
    label: "MQL Aging Days"
    description: "The number of days from qualification to disposition, or if the MQL is still in New, the number of days since qualification."
    tags: ["MQL Aging Days","Aging Days"]
  }

# MQL_Date Dimension
  dimension: MQL_Date {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.MQL_Date AS STRING));;
    type: date
    label: "MQL Date"
    description: "The date the MQL qualified the MQL scoring threshold or the PreMQL was accepted/worked by a sales rep."
    tags: ["MQL Date","date"]
    datatype: date
  }

# MQL_Disposition Dimension
  dimension: MQL_Disposition {
    type: string
    sql: ${TABLE}.MQL_Disposition ;;
    label: "MQL Disposition"
    description: "The final outcome of the MQL (whether the MQL became an SAL or not)."
    tags: ["MQL Disposition"]
  }

# MQL_Disposition measure
  measure: Count_MQL_Disposition {
    type: count
    drill_fields: [MQL_Disposition]
    label: "Count_MQL_Disposition"
    description: "This attribute give details about count of MQL Disposition"
    tags: ["MQL Disposition Count","count of MQL Disposition"]
  }

# MQL_Month Dimension
  dimension: MQL_Month {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.MQL_Month AS STRING));;
    type: date
    label: "MQL Month"
    description: "The month the MQL qualified the MQL scoring threshold or the PreMQL was accepted/worked by a sales rep."
    tags: ["MQL Month","month"]
    datatype: date
  }

# MQL_Week Dimension
  dimension: MQL_Week {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.MQL_Week AS STRING));;
    type: date
    label: "MQL Week"
    description: "The week (starting Sunday) the MQL qualified the MQL scoring threshold or the PreMQL was accepted/worked by a sales rep."
    tags: ["MQL Week","week"]
    datatype: date
  }

# Offer_Type Dimension
  dimension: Offer_Type {
    type: string
    sql: ${TABLE}.Offer_Type ;;
    label: "Offer_Type"
    description: "The type of proposed offer we are giving the prospect."
    tags: ["Offer Type"]
  }

# OKR_Reporting_Scope Dimension
  dimension: OKR_Reporting_Scope {
    type: string
    sql: ${TABLE}.OKR_Reporting_Scope ;;
    label: "OKR Reporting Scope"
    description: "This attribute give details about OKR Reporting Scope"
    tags: ["OKR Reporting Scope"]
  }

# SAL_Disposition Dimension
  dimension: SAL_Disposition {
    type: number
    sql: ${TABLE}.SAL_Disposition ;;
    label: "SAL Disposition"
    description: "The final outcome of the SAL, where either an opportunity was created or not (i.e. did the Lead reach the S0+ stage). This field does not apply for Attribution 3.0."
    tags: ["SAL Disposition"]
  }

# SFDC_Campaign_ID Dimension
  dimension: SFDC_Campaign_ID {
    type: string
    sql: ${TABLE}.SFDC_Campaign_ID ;;
    label: "SFDC Campaign ID"
    description: "The unique identifier of the Salesforce campaign."
    tags: ["SFDC Campaign ID"]
  }

# SFDC_Campaign_Name Dimension
  dimension: SFDC_Campaign_Name {
    type: string
    sql: ${TABLE}.SFDC_Campaign_Name ;;
    label: "SFDC Campaign Name"
    description: "The name of the Salesforce campaign."
    tags: ["SFDC_Campaign_Name", "Campaign Name", "Campaign"]
  }

# Inquiry_Key Dimension
  dimension: Inquiry_Key {
    type: string
    sql: ${TABLE}.Inquiry_Key ;;
    label: "Inquiry Key"
    description: "The unique identifier (primary key) for the inquiry."
    tags: ["Inquiry Key","inquiry","inquiries"]
  }

# Offer_Products Dimension
  dimension: Offer_Products {
    type: string
    sql: ${TABLE}.Offer_Products ;;
    label: "Offer Products"
    description: "The individual product family's associated with the campaign."
    tags: ["Offer Products"]
  }

# Product Dimension
  dimension: Product {
    type: string
    sql: ${TABLE}.Product ;;
    label: "Product"
    description: "Flags the product family of the demand based on the funnel stage's cohort (i.e. if 'Google Cloud Platform' is selected, only inquiries, leads, and opportunities with 'Google Cloud Platform' as the product family will be selected)."
    tags: ["Product"]
  }

# MQL_Quarter Dimension
  dimension: MQL_Quarter {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.MQL_Quarter AS STRING));;
    type: date
    label: "MQL Quarter"
    description: "The quarter the MQL qualified the MQL scoring threshold or the PreMQL was accepted/worked by a sales rep."
    tags: ["MQL Quarter","quarter"]
  }

# Inquiry_Quarter Dimension
  dimension: Inquiry_Quarter {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.Inquiry_Quarter AS STRING));;
    type: date
    label: "Inquiry Quarter"
    description: "The quarter the inquiry was submitted."
    tags: ["Inquiry Quarter"]
  }

# Attributed_Pipeline Dimension
  dimension: Attributed_Pipeline {
    type: string
    sql: ${TABLE}.Attributed_Pipeline ;;
    label: "Attributed Pipeline"
    description: "Attributed pipeline ($) that indicates the fraction of the current S1+ pipeline that is attributable to eligible inquiries and/or leads (includes placeholders for outbound opportunities). "
    tags: ["Attributed Pipeline"]
  }

# Attributed_Pipeline Dimension
  measure: Total_Attributed_Pipeline {
    type: number
    sql: SUM(${TABLE}.Attributed_Pipeline) ;;
    label: "Total_Attributed_Pipeline"
    description: "This attribute give details about sum of Attributed Pipeline"
    tags: ["Total Attributed Pipeline","Sum of attributed pipeline"]
  }

# Inquiry_Key_Count measure
  measure: Inquiry_Key_Count {
    type: count
    drill_fields: [Inquiry_Key]
    label: "Inquiry_Key_Count"
    description: "This attribute give details about count of Inquiry Key"
    tags: ["Inquiry Count","count of Inquiries"]
  }

# MQL_Date Dimension Group
  dimension_group: MQL_Date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.MQL_Date ;;
    label: "MQL Date"
    description: "the MQL qualified"
    tags: ["MQL Date","date"]
  }

  # Previous Week, Month, Quarter and Year Dimensions
  dimension: previous_week {
    type: date
    sql: DATE_SUB(DATE_TRUNC(CURRENT_DATE(), WEEK), INTERVAL 1 WEEK) ;;
    label: "Previous Week"
    description: "Date one week prior to the current date"
    tags: ["previous week","last week"]
  }

  dimension: previous_month {
    type: date
    sql: DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH), MONTH) ;;
    label: "Previous Month"
    description: "Date one month prior to the current date"
    tags: ["previous month","last month"]
  }

  dimension: previous_quarter {
    type: date
    sql: DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL 3 MONTH), QUARTER) ;;
    label: "Previous Quarter"
    description: "Date one quarter prior to the current date"
    tags: ["previous month","last month"]
  }

  dimension: previous_year {
    type: date
    sql: DATE(FORMAT_DATE('%Y-01-01', DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR))) ;;
    label: "Previous Year"
    description: "Date one year prior to the current date"
    tags: ["previous year","last year"]
  }

  #  rank_by_preferred_grouping measure
  measure: rank_by_preferred_grouping {
    type: number
    sql: ROW_NUMBER() OVER (PARTITION BY ${TABLE}.{{ _user_attributes['preferred_grouping'] }} ORDER BY SUM(${Attributed_MQLs}) DESC) ;;
    label: "rank_by_preferred_grouping"
    description: "This attribute give details about rank by preferred grouping"
    tags: ["rank by preferred grouping","best performed"]
  }
  dimension: period_label {
    type: string
    sql: CASE
          WHEN ${MQL_Date} BETWEEN _FILTER_START(${MQL_Date}) AND _FILTER_END(${MQL_Date})
            THEN 'selected_period'
          WHEN ${MQL_Date} BETWEEN DATE_SUB(_FILTER_START(${MQL_Date}), INTERVAL 1 YEAR)
                         AND DATE_SUB(_FILTER_END(${MQL_Date}), INTERVAL 1 YEAR)
            THEN 'previous_year'
          ELSE NULL
        END ;;
  }



}
