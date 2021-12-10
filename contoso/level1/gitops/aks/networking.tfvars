vnets = {
  vnet_gitops = {
    resource_group_key = "gitops"
    region             = "singapore"
    vnet = {
      name          = "aks-gitlab"
      address_space = ["10.203.196.0/22"]
    }
    subnets = {
      aks_nodepool_system = {
        name                                           = "aks_system"
        cidr                                           = ["10.203.196.0/24"]
        nsg_key                                        = "azure_kubernetes_cluster_nsg"
        enforce_private_link_endpoint_network_policies = true
        # route_table_key = "default_to_firewall_re1"
      }
      aks_gitlab = {
        name                                           = "aks_gitlab"
        cidr                                           = ["10.203.197.0/24"]
        nsg_key                                        = "azure_kubernetes_cluster_nsg"
        enforce_private_link_endpoint_network_policies = true
        # route_table_key = "default_to_firewall_re1"
      }
      aks_ingress = {
        name    = "aks_ingress"
        cidr    = ["10.203.198.0/24"]
        nsg_key = "azure_kubernetes_cluster_nsg"
        # route_table_key = "default_to_firewall_re1"
      }
      jumpbox = {
        name    = "jumpbox"
        cidr    = ["10.203.199.64/28"]
        nsg_key = "azure_kubernetes_cluster_nsg"
        # route_table_key = "default_to_firewall_re1"
      }
      private_endpoints = {
        name                                           = "private_endpoints"
        cidr                                           = ["10.203.199.0/27"]
        enforce_private_link_endpoint_network_policies = true
      }
      AzureBastionSubnet = {
        name    = "AzureBastionSubnet" #Must be called AzureBastionSubnet
        cidr    = ["10.203.199.32/27"]
        nsg_key = "azure_bastion_nsg"
      }
      application_gateway = {
        name    = "agw"
        cidr    = ["10.203.199.96/27"]
        nsg_key = "application_gateway"
      }
    } //subnets


    specialsubnets = {
      AzureFirewallSubnet = {
        name = "AzureFirewallSubnet" #Must be called AzureFirewallSubnet
        cidr = ["10.203.199.128/26"]
      }
    } //specialsubnets

  }
} //vnets
