event_hub_namespaces = {
  ev_contoso = {
    name               = "ev_contoso"
    resource_group_key = "ev_sea_rg_01"
    sku                = "Standard"
    region             = "singapore"
  }
}

event_hubs = {
  ev = {
    name                    = "ev"
    resource_group_key      = "ev_sea_rg_01"
    event_hub_namespace_key = "ev_contoso"
    storage_account_key     = "ev_contoso"
    blob_container_name     = "evh"
    partition_count         = "2"
    message_retention       = "2"
  }
}

event_hub_auth_rules = {
  rule1 = {
    resource_group_key      = "ev_sea_rg_01"
    event_hub_namespace_key = "ev_contoso"
    event_hub_name_key      = "ev"
    rule_name               = "ev-rule"
    listen                  = true
    send                    = true
    manage                  = false
  }
}