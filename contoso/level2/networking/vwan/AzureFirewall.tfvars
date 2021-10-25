# global_settings = {
#   default_region = "region1"
#   regions = {
#     region1 = "southeastasia"
#   }
# }

/* resource_groups = {
  dmz = {
    name = "gcc-git-con-dmz-dev-sea-01"
  }

} */

vnets = {
  vnet3 = {
    resource_group_key = "hub_re1"
    vnet = {
      name          = "gcc-git-con-dmz-dev-sea-01"
      address_space = ["10.189.224.128/26"]
    }
    specialsubnets = {
      AzureFirewallSubnet = {
        name = "AzureFirewallSubnet" # must be named AzureFirewallSubnet
        cidr = ["10.189.224.128/26"]
      }
    }
    subnets = {}
  }
}

/* public_ip_addresses = {
  pip1 = {
    name               = "gcc-git-con-dmz-dev-sea-01"
    resource_group_key = "hub_re1"
    sku                = "Standard" # must be 'Standard' SKU
    # Standard SKU Public IP Addresses that do not specify a zone are zone redundant by default.
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }
} */

azurerm_firewalls = {
  firewall1 = {
    name                = "gcc-git-con-dmz-dev-sea-01"
    resource_group_key  = "hub_re1"
    vnet_key            = "vnet3"
    sku_name           = "AZFW_Hub"
    sku_tier            = "Premium"
    zones               = [1, 2, 3]
    firewall_policy = {
      key = "policy1"
    }
    virtual_hub = {
      hub1 = {
        virtual_wan_key = "vwan_re1"
        virtual_hub_key = "hub_re1"
        #virtual_hub_id = "Azure_resource_id"
        #lz_key = "lz_key"
        public_ip_count = 1
      }
    }
    /* public_ips = {
      ip1 = {
        name          = "pip1"
        public_ip_key = "pip1"
        vnet_key      = "vnet3"
        subnet_key    = "AzureFirewallSubnet"
        # lz_key = "lz_key"
      }
    } */
  }
}

azurerm_firewall_policies = {
  policy1 = {
    name               = "gcc-git-con-dmz-dev-sea-01"
    resource_group_key = "hub_re1"
  }
}

azurerm_firewall_policy_rule_collection_groups = {
  group1 = {
    #firewall_policy_id = "Azure Resource ID"
    firewall_policy_key = "policy1"
    name                = "gcc-git-con-dmz-dev-sea-01"
    priority            = 500

    application_rule_collections = {
      rule1 = {
        name     = "app_rule_collection1"
        priority = 500
        action   = "Deny"
        rules = {
          rule1 = {
            name = "app_rule_collection1_rule1"
            protocols = {
              1 = {
                type = "Http"
                port = 80
              }
              2 = {
                type = "Https"
                port = 443
              }
            }
            source_addresses  = ["10.0.0.0/16"]
            destination_fqdns = ["*.microsoft.com"]
          }
        }
      }
    }

    network_rule_collections = {
      group1 = {
        name     = "network_rule_collection1"
        priority = 400
        action   = "Allow"
        rules = {
          rule1 = {
            name                  = "network_rule_collection1_rule1"
            protocols             = ["TCP", "UDP"]
            source_addresses      = ["10.0.0.0/16"]
            destination_addresses = ["0.0.0.0/0"]
            destination_ports     = ["80", "1000-2000"]
          }
        }
      }
    }

    # nat_rule_collections = {
    #   group1 = {
    #     name     = "nat_rule_collection1"
    #     priority = 300
    #     action   = "Dnat"
    #     rules = {
    #       rule1 = {
    #         name                = "nat_rule_collection1_rule1"
    #         protocols           = ["TCP"]
    #         source_addresses    = ["*"]
    #         destination_address = "192.168.1.1"
    #         # destination_address_public_ip_key = "pip_key"
    #         destination_ports   = ["80", "1000-2000"]
    #         translated_address  = "192.168.0.1"
    #         translated_port     = "8080"
    #       }
    #     }
    #   }
    # }
  }

}