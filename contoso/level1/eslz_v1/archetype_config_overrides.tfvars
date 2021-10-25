archetype_config_overrides = {

  root = {
    archetype_id = "contoso_root"
    parameters = {
      "contoso-allowed-locations" = {
        "listOfAllowedLocations" = {
          values = [
            "southeastasia"
          ]
        }
      }
      "contoso-rg-locations" = {
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
      "contoso-Nsg-FlowLogs-to-LA" = {
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
          resource_key  = "network_watcher"
          attribute_key = "id"
          # value = "/subscriptions/072bae4a-22d7-4db2-bd6e-372cca8b8842/resourceGroups/rg-network-watcher-sea-mfc/providers/Microsoft.Storage/storageAccounts/stnetworkwatchercontosokyw"
        }
        "networkWatcherRG" = {
          value = "NetworkWatcherRG"
        }
        "networkWatcherName" = {
          value = "NetworkWatcher_southeastasia"
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
          value = "sean.lok@contosotaxi.com"
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
      "contoso-ASC-Export-LogAW" = {
        "workspaceResourceId" = {
          lz_key        = "caf_foundations_sharedservices"
          output_key    = "diagnostics"
          resource_type = "log_analytics"
          resource_key  = "sea_logs_sgp"
          attribute_key = "id"
        }
        "resourceGroupName" = {
          value = "rg-contoso-ASC-Export"
        }
        "resourceGroupLocation" = {
          value = "southeastasia"
        }
      }
      "contoso-Deploy-Def-OSS-DB" = {
        "pricingTier" = {
          value = "Standard"
        }
        "effect" = {
          value = "DeployIfNotExists"
        }
      }
      "contoso-Diag-AKS-EVH" = {
        "eventHubRuleId" = {
          value = "/subscriptions/072bae4a-22d7-4db2-bd6e-372cca8b8842/resourceGroups/rg-caf-ev-sea-sad/providers/Microsoft.EventHub/namespaces/ehn-evcontoso-hbs/AuthorizationRules/RootManageSharedAccessKey"
        }
      }
    }
    access_control = {
      "Contributor" = {
        # principal_ids = ["principal_id1", "principal_id2"]
        "managed_identities" = {
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "subscription_creation_platform"
          ]
        }
      } // Contributor

      "Owner" = {
        "managed_identities" = {
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "level1" // Required to manage the role assignments changes, Update of MG hierarchy settings
          ]
        }
        "principal_ids" = [
          // Azure AD Group caf-launchpad-maintainers-rw
          // "e2be2124-5552-4fa8-8655-1d7a5844a54c"
        ]
      } // "Management Group Contributor"

      # "[contoso] contoso-system-apex-build" = {
      #   "azuread_service_principals" = {
      #   lz_key        = "launchpad"
      #   attribute_key = "object_id"
      #   resource_keys = ["build_acr_client"]
      # }
      # principal_ids = ["37d7664c-bb21-4523-be11-88d555cf1234"]
      # "managed_identities" = {
      #   # principal_ids = ["principal_id1", "principal_id2"]
      #   lz_key        = "launchpad"
      #   attribute_key = "principal_id"
      #   resource_keys = [
      #     "subscription_creation_landingzones"
      #   ]
      # }
      # }
    }
  } //root

  # decommissioned = {
  #   archetype_id   = "es_decommissioned"
  #   parameters     = {}
  #   access_control = {}
  # }

  # sandboxes = {
  #   archetype_id   = "es_sandboxes"
  #   parameters     = {}
  #   access_control = {}
  # }

  landing-zones = {
    archetype_id = "contoso_landing_zones"
    parameters = {
      "Deny-Priv-Containers-AKS" = {
        "excludedNamespaces" = {
          values = [
            "kube-system", "gatekeeper-system", "azure-arc", "cluster-baseline-settings"
          ]
        }
      }
      "Deny-Priv-Escalation-AKS" = {
        "excludedNamespaces" = {
          values = [
            "kube-system", "gatekeeper-system", "azure-arc", "cluster-baseline-settings"
          ]
        }
      }
      "Deny-PublicIP" = {
        "effect" = {
          value = "Deny"
        }
      }
      "Deny-Subnet-Without-Nsg" = {
        "effect" = {
          value = "Audit"
        }
      }
      "contoso-Deny-AKSWithoutRBAC" = {
        "effect" = {
          value = "Deny"
        }
      }
    }
    access_control = {
      "Contributor" = {
        "managed_identities" = {
          # principal_ids = ["principal_id1", "principal_id2"]
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "level3", "subscription_creation_landingzones"
          ]
        }
      }
    }
  }

  # platform = {
  #   archetype_id   = "es_platform"
  #   parameters     = {}
  #   access_control = {}
  # }

  # contoso-finance = {
  #   archetype_id = "finance"
  #   parameters   = {}
  #   access_control = {}
  # }
  #contoso-staging = {
  #archetype_id = "staging"
  #parameters   = {
  #  "contoso-allow-registry-aks" = {

  #     "effect": {
  #    "value" : "audit"
  # },
  #"allowedContainerImagesRegex": {
  # "value" : "^.+(azurecr.io|mcr.microsoft.com)/.+$"
  #}

  #}
  #}
  # access_control = {

  #  }
  #}
  connectivity = {
    archetype_id = "connectivity"
    parameters   = {}
    access_control = {
      "Contributor" = {
        "managed_identities" = {
          # principal_ids = ["principal_id1", "principal_id2"]
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "level2"
          ]
        }
      } // Contributor

      "Reader" = {
        "managed_identities" = {
          # principal_ids = ["principal_id1", "principal_id2"]
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "subscription_creation_landingzones"
          ]
        }
      } //Reader

      "[contoso-CONNECTIVITY] contoso-subscription-creation-landingzones" = {
        "managed_identities" = {
          # principal_ids = ["principal_id1", "principal_id2"]
          lz_key        = "launchpad"
          attribute_key = "principal_id"
          resource_keys = [
            "subscription_creation_landingzones"
          ]
        }
      }
    }
  }

  # management = {
  #   archetype_id   = "es_management"
  #   parameters     = {}
  #   access_control = {}
  # }
}