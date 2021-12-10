
keyvaults = {
  secrets = {
    name               = "vm-secrets"
    resource_group_key = "gitops"
    sku_name           = "premium"

    creation_policies = {
      logged_in_user = {
        # object_id          =
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }
}

keyvault_access_policies = {
  secrets = {
    msi_launchpad_level1 = {
      lz_key               = "launchpad"
      managed_identity_key = "level1"
      secret_permissions   = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
    }
  }
}