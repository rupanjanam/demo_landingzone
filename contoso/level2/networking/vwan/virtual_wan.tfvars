resource_groups = {
  hub_re1 = {
    name   = "gcc-git-con-ops-sea-02"
    region = "region1"
  }
}
global_settings = {
  default_region = "region1"
  regions = {
    region1 = "southeastasia"
  }
}
virtual_wans = {
  vwan_re1 = {
    resource_group_key = "hub_re1"
    name               = "gcc-git-con-ops-vWAN-sea-re1"
    region             = "region1"

    hubs = {
      hub_re1 = {
        hub_name           = "hub-dev"
        region             = "region1"
        hub_address_prefix = "10.189.230.0/24"
        deploy_firewall    = false
        deploy_p2s         = false
        p2s_config         = {}
        deploy_s2s         = false
        s2s_config         = {}
        deploy_er          = true
        er_config          = {
          name        = "gcctestmaster-net-sea-vwan-01-vhub-01-er-vgw-dev"
          scale_units = 1
        }
      }

      hub_re2 = {
      hub_name           = "hub-npd"
      region             = "region1"
      hub_address_prefix = "10.189.228.0/24"
      deploy_firewall    = false
      deploy_p2s         = false
      p2s_config         = {}
      deploy_s2s         = false
      s2s_config         = {}
      deploy_er          = true
      er_config          = {
      name        = "gcctestmaster-net-sea-vwan-01-vhub-01-er-vgw-npd"
      scale_units = 1
       }
      }

      #   hub_re3 = {
      #   hub_name           = "hub-prd"
      #   region             = "region1"
      #   hub_address_prefix = "10.189.229.0/24"
      #   deploy_firewall    = false
      #   deploy_p2s         = false
      #   p2s_config         = {}
      #   deploy_s2s         = false
      #   s2s_config         = {}
      #   deploy_er          = true
      #   er_config          = {
      #     name        = "gcctestmaster-net-sea-vwan-01-vhub-01-er-vgw-prd"
      #     scale_units = 1
      #   }
      # }
    }
  }
}
