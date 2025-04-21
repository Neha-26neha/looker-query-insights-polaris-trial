view: abc {
# The sql_table_name parameter indicates the underlying database table
  sql_table_name: `google.com:project-polaris-ai.explore_assistant.ME_MQL_Funnel`  ;;

# No mary key is defined for this view. In order to join this view in an Explore,
# define primary_key: yes on a dimension that has no repeated values.

# Account_Engagement_Type Type Dimension
  dimension: Account_Engagement_Type {
    type: string
    sql: ${TABLE}.Account_Engagement_Type ;;
    label: "Account Engagement Type"
    description: "For Inquiries & Leads, indicates Attribution 3.0 attribution eligibility by flagging whether it is a High Value exception, sourced                      from a currently High Engagement account, or sourced from a currently Low Engagement account. 'Not in Attribution 3.0 Scope'                            indicates that it is neither sourced from an A3.0-eligible account, the 6 OKR regions, nor associated with GCP/GWS products. "
    tags: ["Account_Engagement_Type"]
  }

# Account_Sales_Micro_Region Dimension
  dimension: Account_Sales_Micro_Region {
    type: string
    sql:${TABLE}.Account_Sales_Micro_Region;;
    label: "Account Sales Micro Region"
    description: "Sales microregion for which the account is assigned."
    tags: ["Account_Sales_Micro_Region"]
  }

# Account_Sales_Region Dimension
  dimension: Account_Sales_Region {
    type: string
    sql: ${TABLE}.Account_Sales_Region ;;
    label: "Account Sales Region"
    description: "Sales region for which the account is assigned."
    tags: ["Account_Sales_Region"]
  }

# Account_Sales_Sub_Region Dimension
  dimension: Account_Sales_Sub_Region {
    type: string
    sql: ${TABLE}.Account_Sales_Sub_Region ;;
    label: "Account Sales Sub Region"
    description: "Sales subregion for which the account is assigned."
    tags: ["Account_Sales_Sub_Region"]
  }

# Account_Sales_Team_NAL_Cluster Dimension
  dimension: Account_Sales_Team_NAL_Cluster {
    type: string
    sql: ${TABLE}.Account_Sales_Team_NAL_Cluster ;;
    label: "Account Sales Team NAL Cluster"
    description: "Sales NAL cluster for which the account is assigned."
    tags: ["Account_Sales_Team_NAL_Cluster"]
  }

# Account_Segment Dimension
  dimension: Account_Segment {
    type: string
    sql: ${TABLE}.Account_Segment ;;
    label: "Account Segment"
    description: "The segment of the parent Vector account sourced from Anaplan. This represents the spending potential of the Account on Cloud                           Products."
    tags: ["Account_Segment"]
  }

# Attributed_MQLs Dimension
  dimension: Attributed_MQLs {
    type: number
    sql:${TABLE}.Attributed_MQLs;;
    label: "Attributed MQLs"
    description: "Attributed number of MQLs (between 0 & 1) that indicates the fraction of the MQL that is attributable to each Inquiry that sourced                     it."
    tags: ["Attributed_MQLs"]
  }

# Attributed_QSOs Dimension
  dimension: Attributed_QSOs {
    type: number
    sql: ${TABLE}.Attributed_QSOs ;;
    label: "Attributed QSOs"
    description: "Attributed number (between 0 & 1) that indicates the fraction of the QSO that is attributable to eligible inquiries and/or leads                      (includes placeholders for outbound opportunities)."
    tags: ["Attributed_QSOs"]
  }

# Attributed_S0s Dimension
  dimension: Attributed_S0s {
    type: number
    sql: ${TABLE}.Attributed_S0s ;;
    label: "Attributed S0s"
    description: "Attributed number (between 0 & 1) that indicates the fraction of the S0 that is attributable to eligible inquiries and/or leads                       (includes placeholders for outbound opportunities)."
    tags: ["Attributed_S0s"]
  }

# Buyer_Segment_Rollup Dimension
  dimension: Buyer_Segment_Rollup {
    type: string
    sql: ${TABLE}.Buyer_Segment_Rollup ;;
    label: "Buyer Segment Rollup"
    description: "The propect's role at their company rolled up to Executive, Decision Maker, Practitioner, or Unknown based on the Buyer Segment                        model."
    tags: ["Buyer_Segment_Rollup"]
  }

# Demand_Type Dimension
  dimension: Demand_Type {
    type: string
    sql: ${TABLE}.Demand_Type ;;
    label: "Demand Type"
    description: "Indicates whether the marketing effort was part of the Inbound or Outbound funnel. Inbound starts the prospect journey with an                         inquiry while Outbound starts with opportunity creation from sales outreach assisted by Marketing."
    tags: ["Demand_Type"]
  }

# Greenfield_Status Dimension
  dimension: Greenfield_Status {
    type: string
    sql:${TABLE}.Greenfield_Status;;
    label: "Greenfield Status"
    description: "Arbitrates the Greenfield status of demand based on the funnel stage, product, and date the demand was sourced -- use Greenfield                       Status to keep it simple!"
    tags: ["Greenfield_Status"]
  }

# Inquiry_Source Dimension
  dimension: Inquiry_Source {
    type: string
    sql: ${TABLE}.Inquiry_Source ;;
    label: "Inquiry_Source"
    description: "Inquiry was sourced by Direct Marketing vs Partner Marketing. If there is overlap between Direct and Partner, credit is split evenly                   with multi-touch attribution."
    tags: ["Inquiry_Source"]
  }

# Lead_Initial_Routing_Team Dimension
  dimension: Lead_Initial_Routing_Team {
    type: string
    sql: ${TABLE}.Lead_Initial_Routing_Team ;;
    label: "Lead Initial Routing Team"
    description: "Due to incomplete and/or outdated Vector profiles, this field categorizes & abitrates the Lead Initial Routing Team (BDR,                              FSR/Specialist, Partner, SDR) based on account roles, xDR roster,  and manager hierarchy."
    tags: ["Lead_Initial_Routing_Team"]
  }

# Lead_Owner_Team Dimension
  dimension: Lead_Owner_Team {
    type: string
    sql: ${TABLE}.Lead_Owner_Team ;;
    label: "Lead Owner Team"
    description: "Due to incomplete and/or outdated Vector profiles, this field categorizes & abitrates the Lead Owner Team (BDR, FSR/Specialist,                        Partner, SDR) based on account roles, xDR roster,  and manager hierarchy."
    tags: ["Lead_Owner_Team"]
  }

# Lead_Owner_User_LDAP Dimension
  dimension: Lead_Owner_User_LDAP {
    type: string
    sql: ${TABLE}.Lead_Owner_User_LDAP ;;
    label: "Lead Owner User LDAP"
    description: "The LDAP of the Salesforce user who currently owns the lead."
    tags: ["Lead_Owner_User_LDAP"]
  }

# Lead_Owner_User_LDAP_Manager Dimension
  dimension: AttribLead_Owner_User_LDAP_Manageruted_MQLs {
    type: string
    sql:${TABLE}.Lead_Owner_User_LDAP_Manager;;
    label: "Lead Owner User LDAP Manager"
    description: "The LDAP of the manager of the Salesforce user who currently owns the lead."
    tags: ["Lead_Owner_User_LDAP_Manager"]
  }

# Lead_Owner_User_LDAP_Manager_Hierarchy Dimension
  dimension: Lead_Owner_User_LDAP_Manager_Hierarchy {
    type: string
    sql: ${TABLE}.Lead_Owner_User_LDAP_Manager_Hierarchy ;;
    label: "Lead Owner User LDAP Manager Hierarchy"
    description: "The LDAPs of the current Salesforce owner's manager's manager(s)."
    tags: ["Lead_Owner_User_LDAP_Manager_Hierarchy"]
  }

# Lead_Score Dimension
  dimension: Lead_Score {
    type: string
    sql: ${TABLE}.Lead_Score ;;
    label: "Lead Score"
    description: "Indicates the quality of the MQL based on the prospect's behavioral score (A1 is the highest, B2 is the lowest)."
    tags: ["Lead_Score"]
  }

# MQL_Aging_Bucket Dimension
  dimension: MQL_Aging_Bucket {
    type: string
    sql: ${TABLE}.MQL_Aging_Bucket ;;
    label: "MQL Aging Bucket"
    description: "Buckets MQLs by the number of days from qualification to disposition, or if the MQL is still in New, the number of days since                          qualification."
    tags: ["MQL_Aging_Bucket"]
  }

# MQL_Aging_Days Dimension
  dimension: MQL_Aging_Days {
    type: number
    sql: ${TABLE}.MQL_Aging_Days ;;
    label: "MQL Aging Days"
    description: "The number of days from qualification to disposition, or if the MQL is still in New, the number of days since qualification."
    tags: ["MQL_Aging_Days"]
  }

# MQL_Date Dimension
  dimension: MQL_Date {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.MQL_Date AS STRING));;
    type: date
    label: "MQL Date"
    description: "The date the MQL qualified the MQL scoring threshold or the PreMQL was accepted/worked by a sales rep."
    tags: ["MQL_Date"]
    datatype: date
  }

# MQL_Disposition Dimension
  dimension: MQL_Disposition {
    type: string
    sql: ${TABLE}.MQL_Disposition ;;
    label: "MQL Disposition"
    description: "The final outcome of the MQL (whether the MQL became an SAL or not)."
    tags: ["MQL_Disposition"]
  }

# MQL_Month Dimension
  dimension: MQL_Month {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.MQL_Month AS STRING));;
    type: date
    label: "MQL Month"
    description: "The month the MQL qualified the MQL scoring threshold or the PreMQL was accepted/worked by a sales rep."
    tags: ["MQL_Month"]
    datatype: date
  }

# MQL_Result Dimension
  dimension: MQL_Result {
    type: string
    sql: ${TABLE}.MQL_Result ;;
    label: "MQL Result"
    description: "Categorizes MQLs by their MQL SLA Result (Dispositioned without / in- / out-of-SLA, New without / in- / out-of-SLA, Auto Closed)."
    tags: ["MQL_Result"]
  }

# MQL_Week Dimension
  dimension: MQL_Week {
    sql: PARSE_DATE('%Y-%m-%d', CAST(${TABLE}.MQL_Week AS STRING));;
    type: date
    label: "MQL Week"
    description: "The week (starting Sunday) the MQL qualified the MQL scoring threshold or the PreMQL was accepted/worked by a sales rep."
    tags: ["MQL_Week"]
    datatype: date
  }

# Offer_Type Dimension
  dimension: Offer_Type {
    type: string
    sql: ${TABLE}.Offer_Type ;;
    label: "Offer_Type"
    description: "The type of proposed offer we are giving the prospect."
    tags: ["Offer_Type"]
  }

# OKR_Reporting_Scope Dimension
  dimension: OKR_Reporting_Scope {
    type: string
    sql: ${TABLE}.OKR_Reporting_Scope ;;
    label: "OKR Reporting Scope"
    description: "NA"
    tags: ["OKR_Reporting_Scope"]
  }

# SAL_Disposition Dimension
  dimension: SAL_Disposition {
    type: number
    sql: ${TABLE}.SAL_Disposition ;;
    label: "SAL Disposition"
    description: "The final outcome of the SAL, where either an opportunity was created or not (i.e. did the Lead reach the S0+ stage). This field                      does not apply for Attribution 3.0."
    tags: ["SAL_Disposition"]
  }



# Attributed_MQLs Dimension
  measure: Total_MQLs {
    type: number
    sql: SUM(${TABLE}.Attributed_MQLs) ;;
    label: "Total MQLs"
    description: "Total Attributed number of MQLs (between 0 & 1) that indicates the fraction of the MQL that is attributable to each Inquiry that                       sourced it."
    tags: ["Total Attributed MQLs"]
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
    tags: ["Rerouted_MQLs"]
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
    tags: ["Not_Rerouted_MQLs"]
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
    tags: ["MQL_Rerouted_Rate"]
  }


# Attributed_S0s Dimension
  measure: Total_Attributed_S0s {
    type: number
    sql: SUM(${TABLE}.Attributed_S0s) ;;
    label: "Total_Attributed_S0s"
    description: "This attribute give details about Total_Attributed_S0s"
    tags: ["Total_Attributed_S0s"]
  }

# S0_to_QSO Dimension
  measure: S0_to_QSO {
    type: number
    sql: SUM(${Attributed_QSOs}) / NULLIF(SUM(${Attributed_S0s}), 0) ;;
    label: "S0_to_QSO"
    description: "This attribute give details about S0_to_QSO"
    tags: ["S0_to_QSO"]
  }

# Attributed_QSOs Dimension
  measure: Total_Attributed_QSOs {
    type: number
    sql: SUM(${TABLE}.Attributed_QSOs) ;;
    label: "Total_Attributed_QSOs"
    description: "This attribute give details about Total_Attributed_QSOs"
    tags: ["Total_Attributed_QSOs"]
  }
}
