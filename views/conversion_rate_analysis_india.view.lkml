view: conversion_rate_analysis_india {
  sql_table_name: `google.com.project-polaris-ai.project_polaris_ai_ds.Conversion_Rate_Analysis_India` ;;

  dimension: inq_to_mql {
    type: number
    sql: ${TABLE}.Inq_to_MQL ;;
    description: "This attribute give details about Inquiries to MQL-'Marketing Qualified lead' conversion rate"
  }
  dimension: inq_to_qso {
    type: number
    sql: ${TABLE}.Inq_to_QSO ;;
    description: "This attribute give details about Inquiries to QSO-'Qualified Sales Opportunity' conversion rate"
  }
  dimension: mql_to_qso {
    type: number
    sql: ${TABLE}.MQL_to_QSO ;;
    description: "This attribute give details about MQL-'Marketing Qualified lead' to QSO-'Qualified Sales Opportunity' conversion rate"
  }
  dimension: mql_to_sal {
    type: number
    sql: ${TABLE}.MQL_to_SAL ;;
    description: "This attribute give details about MQL-'Marketing Qualified lead' to SAL-'Sales Accepted Lead' conversion rate"
  }
  dimension_group: quarter {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Quarter ;;
  }
  dimension: s0_to_qso {
    type: number
    sql: ${TABLE}.S0_to_QSO ;;
    description: "This attribute give details about S0 to QSO-'Qualified Sales Opportunity' conversion rate"
  }
  dimension: sal_to_qso {
    type: number
    sql: ${TABLE}.SAL_to_QSO ;;
    description: "This attribute give details about SAL-'Sales Accepted Lead' to QSO-'Qualified Sales Opportunity' conversion rate"
  }
  dimension: sal_to_s0 {
    type: number
    sql: ${TABLE}.SAL_to_S0 ;;
    description: "This attribute give details about SAL-'Sales Accepted Lead' to S0 conversion rate"
  }
  measure: count {
    type: count
  }
}
