view: segment_yoy {
  sql_table_name: `google.com:project-polaris-ai.project_polaris_ai_ds.segment_yoy` ;;

  dimension: segment {
    type: string
    sql: ${TABLE}.Segment ;;
  }
  dimension: select_period {
    type: number
    sql: ${TABLE}.`select period` ;;
  }
  dimension: selected_period__one_year {
    type: number
    sql: ${TABLE}.`selected period - one year` ;;
  }
  measure: count {
    type: count
  }
}
