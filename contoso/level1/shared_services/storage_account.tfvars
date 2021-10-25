storage_accounts = {
  network_watcher = {
    name                     = "networkwatchercontoso"
    resource_group_key       = "network_watcher_sea_rg"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"

    blob_properties = {
      delete_retention_policy = {
        days = "7"
      }
      container_delete_retention_policy = {
        days = "7"
      }
    }
  }
  # evh1 = {
  #  name = "evh1"
  #    resource_group_key = "ev_sea_rg_01"
  #    account_kind = "BlobStorage"
  #    account_tier = "Standard"
  #    account_replication_type = "LRS"
  #    containers = {
  #      evh = {
  #        name = "evh"
  #      }
  #  }
  # }
}
