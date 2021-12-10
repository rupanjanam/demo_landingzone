aks_clusters = {
  cluster_re1 = {
    name               = "caf-gitops-aks"
    resource_group_key = "gitops"
    os_type            = "Linux"

// Set to false if need to enable public cluster
    private_cluster_enabled = true

    identity = {
      type = "SystemAssigned"
    }

    kubernetes_version = "1.19.9"
    vnet_key           = "vnet_gitops"

    network_profile = {
      network_plugin    = "azure"
      load_balancer_sku = "Standard"
    }

    role_based_access_control = {
      enabled = true
      azure_active_directory = {
        managed = true
        
        azuread_groups = {
          keys = ["aks_cluster_re1_admins"]
        }
      }
    }

    outbound_type = "userDefinedRouting"

    addon_profile = {
      # oms_agent = {
      #   enabled = true
      #   log_analytics_key = "central_logs_region1"
      # }
      azure_policy = {
        enabled = true
      }
    }


    load_balancer_profile = {
      # Only one option can be set
      # managed_outbound_ip_count = []
      # outbound_ip_prefix_ids = []
      # outbound_ip_address_ids = []
    }

    default_node_pool = {
      name = "sharedsvc"
      # vm_size                      = "Standard_D4as_v4"
      vm_size                      = "Standard_DS2_v2"
      subnet_key                   = "aks_nodepool_system"
      enabled_auto_scaling         = false
      enable_node_public_ip        = false
      max_pods                     = 30
      node_count                   = 3
      os_disk_type                 = "Ephemeral"
      os_disk_size_gb              = 80
      orchestrator_version         = "1.19.9"
      only_critical_addons_enabled = "true"
      tags = {
        "project" = "system services"
      }
    }

    node_resource_group_name = "caf-gitops-aks-nodes"

    node_pools = {
      gitlab = {
        name                 = "npuser01"
        mode                 = "User"
        subnet_key           = "aks_gitlab"
        max_pods             = 30
        vm_size              = "Standard_D8as_v4"
        node_count           = 2
        os_disk_type         = "Ephemeral"
        enable_auto_scaling  = false
        os_disk_size_gb      = 90
        orchestrator_version = "1.19.9"
        tags = {
          "project" = "CAF ESLZ Gitlab runners"
        }
      }
    }

    tags = {

    }

  }
}