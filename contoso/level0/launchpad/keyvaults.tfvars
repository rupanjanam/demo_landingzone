
keyvaults = {
  level0 = {
    name               = "caf-testmaster-l0"
    resource_group_key = "level0"
    sku_name           = "premium"
    tags = {
      tfstate     = "level0"
      environment = "nonprod"
    }

    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level1 = {
    name               = "caf-testmaster-l1"
    resource_group_key = "level1"
    sku_name           = "premium"
    tags = {
      tfstate     = "level1"
      environment = "nonprod"
    }

    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level2 = {
    name               = "caf-testmaster-l2"
    resource_group_key = "level2"
    sku_name           = "premium"
    tags = {
      tfstate     = "level2"
      environment = "nonprod"
    }

    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level3 = {
    name               = "caf-testmaster-l3"
    resource_group_key = "level3"
    sku_name           = "premium"
    tags = {
      tfstate     = "level3"
      environment = "nonprod"
    }

    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  level4 = {
    name               = "caf-testmaster-l4"
    resource_group_key = "level4"
    sku_name           = "premium"
    tags = {
      tfstate     = "level4"
      environment = "nonprod"
    }

    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

  # Used to store the Azure Devops PATS and Azure AD applications secrets
  secrets = {
    name               = "secrets"
    resource_group_key = "security"
    sku_name           = "premium"

    creation_policies = {
      logged_in_user = {
        secret_permissions = ["Set", "Get", "List", "Delete", "Purge", "Recover"]
      }
    }

  }

}
