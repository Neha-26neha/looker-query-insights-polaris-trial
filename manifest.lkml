application: query_insights {
  label: "Query Insights"
  # url: "https://localhost:3000/bundle.js"
  file: "bundle.js"
  mount_points: {
    dashboard_vis: yes
    dashboard_tile: yes
    standalone: no
  }
  entitlements: {
    core_api_methods: ["create_sql_query","run_sql_query","run_query","create_query"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
  }
}

application: deep_insights {
  label: "Deep Insights"
  # url: "https://localhost:3000/bundle.js"
  file: "deep_insights_2.js"
  mount_points: {
    dashboard_vis: yes
    dashboard_tile: yes
    standalone: no
  }
  entitlements: {
    core_api_methods: ["create_sql_query","run_sql_query","run_query","create_query"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
  }
}

application: Conversion_rate_2 {
  label: "Conversion rate 2"
  # url: "https://localhost:3000/bundle.js"
  file: "conversion_rate_2.js"
  mount_points: {
    dashboard_vis: yes
    dashboard_tile: yes
    standalone: no
  }
  entitlements: {
    core_api_methods: ["create_sql_query","run_sql_query","run_query","create_query"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
  }
}

application: yoy_insights {
  label: "YOY insights"
  # url: "https://localhost:3000/bundle.js"
  file: "yoy_insights.js"
  mount_points: {
    dashboard_vis: yes
    dashboard_tile: yes
    standalone: no
  }
  entitlements: {
    core_api_methods: ["create_sql_query","run_sql_query","run_query","create_query"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
  }
}
