archetype_config_overrides = {

  root = {
    archetype_id = "contoso"
    parameters = {
      "contoso-allow-location" = {
        "listOfAllowedLocations" = {
          values = [
            "southeastasia"
          ]
        }
      }
      "contoso-rg-location" = {
        "listOfAllowedLocations" = {
          values = [
            "southeastasia"
          ]
        }
      }
      "Deploy-Resource-Diag" = {
        "logAnalytics" = {
          # value = "resource_id"
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "id"
        }
      }
      "Deploy-ASC-Defender" = {
        "logAnalytics" = {
          # value = "resource_id"
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "id"
        }
        "emailSecurityContact" = {
          # value = "resource_id"
          value = "sean.lok@grabtaxi.com"
        }
      }
      "Deploy-VM-Monitoring" = {
        "logAnalytics_1" = {
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "id"
        }
      }
      "Deploy-VMSS-Monitoring" = {
        "logAnalytics_1" = {
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "id"
        }
      }
      "contoso-Nsg-FlowLogs-LA" = {
        # "retention" = {
        #   value = 1
        # }
        "timeInterval" = {
          value = "10"
        }
        "workspaceResourceId" = {
          # value = "resource_id"
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "id"
        }
        "workspaceRegion" = {
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "location"
        }
        "workspaceId" = {
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "workspace_id"
        }
        "nsgRegion" = {
          value = "southeastasia"
        }
        "storageId" = {
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "objects"
          resource_type = "storage_accounts"
          resource_key  = "sea_storage"
          attribute_key = "id"
         
        }
        "networkWatcherRG" = {
          value = "NetworkWatcherRG"
        }
        "networkWatcherName" = {
          value = "NetworkWatcher_southeastasia"
        }
      }
      
      "Deploy-AzActivity-Log" = {
        "logAnalytics" = {
          # value = "resource_id"
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_region1"
          attribute_key = "id"
        }
      }
     
      "contoso-Def-OSSDB" = {
        "pricingTier" = {
          value = "Standard"
        }
        "effect" = {
          value = "DeployIfNotExists"
        }
      }
      
    }
    access_control = {
      
      "Owner" = {
        "managed_identities" = {
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "level1" // Required to manage the role assignments changes, Update of MG hierarchy settings
          ]
        }
        "principal_ids" = [
          // Azure AD Group ObjectID for Root Management Group Owner
          
        ]
      } // "Management Group Contributor"

      
    }
  } //root

   landing-zones = {
    archetype_id = "contoso_landing_zones"
    parameters = {
      
    }
    access_control = {
      "Contributor" = {
        "managed_identities" = {
          # principal_ids = ["principal_id1", "principal_id2"]
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "level3"
          ]
        }
      }
    }
  }

  management = {
    archetype_id = "default_empty"
    parameters = {
      
    }
    access_control = {
      
    }
  }

  connectivity = {
    archetype_id = "connectivity"
    parameters = {
      
    }
    access_control = {
      
    }
  }

  identity = {
    archetype_id = "default_empty"
    parameters = {
      
    }
    access_control = {
      
    }
  }
}