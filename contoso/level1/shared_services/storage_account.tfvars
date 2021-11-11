storage_accounts = {
  sea_storage = {
    name                     = "stgarchivecontoso"
    resource_group_key       = "stg_contoso_sea_rg"
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
  
}
