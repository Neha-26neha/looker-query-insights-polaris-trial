# Define the database connection to be used for this model.
connection: "polaris-ai"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: polaris_ai_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: polaris_ai_default_datagroup
explore:Marketing_Engaged_MQL_Funnel{
  view_name: Marketing_Engaged_MQL_Funnel
  case_sensitive: no
}
explore:conversion_rate_analysis_india{
  view_name: conversion_rate_analysis_india
  case_sensitive: no
}
explore:segment_yoy{
  view_name: segment_yoy
  case_sensitive: no
}
explore:engagement_yoy{
  view_name: engagement_yoy
  case_sensitive: no
}
