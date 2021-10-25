custom_landing_zones = {

  contoso-devops = {
    display_name               = "Devops"
    parent_management_group_id = "contoso-platform"
    subscription_ids = [
      // "072bae4a-22d7-4db2-bd6e-372cca8b8842" // contosotestmaster-apex-prd-caf-platform
    ]
    subscriptions = {}
    archetype_config = {
      archetype_id   = "default_empty"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-hr = {
    display_name               = "HR"
    parent_management_group_id = "contoso-landing-zones"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id   = "default_empty"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-finance = {
    display_name               = "Finance"
    parent_management_group_id = "contoso-landing-zones"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id   = "default_empty"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-engineering = {
    display_name               = "Engineering"
    parent_management_group_id = "contoso-landing-zones"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id   = "engineering"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-staging = {
    display_name               = "Staging"
    parent_management_group_id = "contoso-engineering"
    subscription_ids = [
      "a4d7705e-2475-419e-808a-255c266d9ac9"
    ]
    subscriptions = {}
    archetype_config = {
      archetype_id = "staging"
      parameters = {
        "contoso-allow-registry-aks" = {
          "effect" = {
            value = "audit"
          }
          "allowedContainerImagesRegex" = {
            value = "^.+(azurecr.io|mcr.microsoft.com)/.+$"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "namespaces" = {
            values = []
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
          "excludedContainers" = {
            values = []
          }
        }
        "contoso-aks-container-pid" = {
          "effect" = {
            value = "audit"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "namespaces" = {
            values = []
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
        }
        "contoso-acr-private-link" = {
          "effect" = {
            value = "Audit"
          }
        }
        "contoso-acr-RestrictNetwork" = {
          "effect" = {
            value = "Audit"
          }
        }
        "contoso-aks-capability" = {
          "effect" = {
            value = "audit"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "namespaces" = {
            values = []
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
          "allowedCapabilities" = {
            values = []
          }
          "requiredDropCapabilities" = {
            values = []
          }
          "excludedContainers" = {
            values = []
          }
        }
        "contoso-aksDisableAutomount" = {
          "effect" = {
            value = "deny"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "namespaces" = {
            values = []
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
        }
        "contoso-storage-soft-del" = {
          "effect" = {
            value = "AuditIfNotExists"
          }
          "retentionInDays" = {
            value = "10"
          }
        }
      }
      access_control = {}
    }
  }

  contoso-dev = {
    display_name               = "Dev"
    parent_management_group_id = "contoso-engineering"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id = "contoso-dev"
      parameters = {
        "contoso-allow-registry-aks" = {
          "effect" = {
            value = "audit"
          }
          "allowedContainerImagesRegex" = {
            value = "^.+(azurecr.io|mcr.microsoft.com|registry.hub.docker.com)/.+$"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "namespaces" = {
            values = []
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
          "excludedContainers" = {
            values = []
          }
        }
        "contoso-aks-container-pid" = {
          "effect" = {
            value = "audit"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
          "namespaces" = {
            values = []
          }
        }
        "contoso-acr-private-link" = {
          "effect" = {
            value = "Audit"
          }
        }
        "contoso-acr-RestrictNetwork" = {
          "effect" = {
            value = "Audit"
          }
        }
        "contoso-aks-capability" = {
          "effect" = {
            value = "audit"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "namespaces" = {
            values = []
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
          "allowedCapabilities" = {
            values = []
          }
          "requiredDropCapabilities" = {
            values = []
          }
          "excludedContainers" = {
            values = []
          }
        }
        "contoso-aksDisableAutomount" = {
          "effect" = {
            value = "deny"
          }
          "excludedNamespaces" = {
            values = ["kube-system", "gatekeeper-system", "azure-arc"]
          }
          "namespaces" = {
            values = []
          }
          "labelSelector" = {
            hcl_jsonencoded = "{}"
          }
        }
        "contoso-storage-soft-del" = {
          "effect" = {
            value = "AuditIfNotExists"
          }
          "retentionInDays" = {
            value = "7"
          }
        }
      }
      access_control = {}
    }
  }

  contoso-production = {
    display_name               = "Production"
    parent_management_group_id = "contoso-engineering"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id = "production"
      parameters = {

      }
      access_control = {}
    }
  }

  contoso-engplatform = {
    display_name               = "Engineering Platform"
    parent_management_group_id = "contoso-engineering"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id   = "default_empty"
      parameters     = {}
      access_control = {}
    }
  }

}