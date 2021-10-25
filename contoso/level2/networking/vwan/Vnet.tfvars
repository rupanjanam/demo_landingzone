
network_security_group_definition = {

  audit_nsg = {
    resource_group_key = "hub_re1"
    name               = "audit_nsg"
    nsg = []
  }

  cmp_nsg = {
    resource_group_key = "hub_re1"
    name               = "cmp_nsg"
    nsg = []
  }

  }

vnets = {
  vnet1 = {
    resource_group_key = "hub_re1"
    vnet = {
      name          = "gcc-git-mgmt-ntwk-aud-sea-01"
      address_space = ["10.189.225.160/27"]
    }
    specialsubnets = {}
    subnets = {
      example = {
        name = "gcc-git-mgmt-ntwk-aud-sea-01"
        cidr = ["10.189.225.160/27"]
        nsg_key = "audit_nsg"
      }
    }
  }

  vnet2 = {
    resource_group_key = "hub_re1"
    vnet = {
      name          = "gcc-git-mgmt-ntwk-cmp-sea-01"
      address_space = ["10.189.225.128/27"]
    }
    specialsubnets = {}
    subnets = {
      example = {
        name = "gcc-git-mgmt-ntwk-cmp-sea-01"
        cidr = ["10.189.225.128/27"]
        nsg_key = "cmp_nsg"
      }
    }
  }
}


