public_ip_addresses = {

  bastion_host_re1 = {
    name                    = "bastion-pip1"
    resource_group_key      = "gitops"
    sku                     = "Standard"
    allocation_method       = "Static"
    ip_version              = "IPv4"
    idle_timeout_in_minutes = "4"
  }

}
