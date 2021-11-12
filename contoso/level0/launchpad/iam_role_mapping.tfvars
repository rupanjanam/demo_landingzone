
#
# Services supported: subscriptions, storage accounts and resource groups
# Can assign roles to: AD groups, AD object ID, AD applications, Managed identities
#

role_mapping = {
  built_in_role_mapping = {
    subscriptions = {
      logged_in_subscription = {
        "Owner" = {
          object_ids = {
            // Azure AD Group caf-launchpad-maintainers-rw
            keys = [] // 
          }
          managed_identities = {
            keys = [
              "level0",
              "level1",
              "level2",
              "level3",
              "level4"
            ]
          }
        }
      }
    }
    
    storage_accounts = {
      level0 = {
        "Storage Blob Data Contributor" = {
          object_ids = {
            // Azure AD Group caf-launchpad-maintainers-rw
            keys = []
          }
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }

        "Storage Blob Data Reader" = {
          managed_identities = {
            keys = [
              "level1"
              
            ]
          }
        }

        "Storage Account Key Operator Service Role" = {
          managed_identities = {
            keys = [
              
            ]
          }
        }

      }

      level1 = {
        "Storage Blob Data Contributor" = {
          object_ids = {
            // Azure AD Group caf-launchpad-maintainers-rw
            keys = []
          }
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = [
              "level1"
              
            ]
          }
        }
        "Storage Account Key Operator Service Role" = {
          managed_identities = {
            keys = [
             
            ]
          }
        }

        "Storage Blob Data Reader" = {
          managed_identities = {
            keys = ["level2"]
          }
        }

      }

      level2 = {
        "Storage Blob Data Contributor" = {
          object_ids = {
            // Azure AD Group caf-launchpad-maintainers-rw
            keys = []
          }
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = ["level2"]
          }
        }
        "Storage Blob Data Reader" = {
          managed_identities = {
            keys = ["level3"]
          }
        }
        "Storage Account Key Operator Service Role" = {
          managed_identities = {
            keys = [
              
            ]
          }
        }

      }
      level3 = {
        "Storage Blob Data Contributor" = {
          object_ids = {
            // Azure AD Group caf-launchpad-maintainers-rw
            keys = []
          }
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = ["level3"]
          }
        }
        "Storage Account Key Operator Service Role" = {
          managed_identities = {
            keys = [
              
            ]
          }
        }

      }
      level4 = {
        "Storage Blob Data Contributor" = {
          object_ids = {
            // Azure AD Group caf-launchpad-maintainers-rw
            keys = []
          }
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = ["level4"]
          }
        }

      }
    }

    keyvaults = {
      secrets = {
        "Key Vault Administrator" = {
          object_ids = {
            // Azure AD Group caf-launchpad-maintainers-rw
            keys = []
          }
          logged_in = {
            keys = ["user"]
          }
          managed_identities = {
            keys = ["level0"]
          }
        }

        # "Key Vault Secrets Officer" = {
        #   azuread_groups = {
        #     keys = ["keyvault_level0_r"]
        #   }
        # }

        "Key Vault Secrets User" = {
          managed_identities = {
            keys = ["level1", "level2", "level3", "level4"]
          }
        }
      }
    }

  }

}