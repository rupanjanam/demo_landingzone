
virtual_hub_route_tables = {

  routetable1 = {
    name = "RT_Prod_Private"
    virtual_wan_key = "vwan_re1"
    virtual_hub_key = "hub_re1"
    labels = [
      "RT_Prod_Private"
    ]
  }

  routetable2 = {
    name = "RT_Prod_Public"
    virtual_wan_key = "vwan_re1"
    virtual_hub_key = "hub_re1"
    labels = [
      "RT_Prod_Public"
    ]
     routes = {
      r1 = {
        name              = "Internet-route"
        destinations_type = "CIDR"
        destinations      = ["0.0.0.0/0"]
        next_hop_id = "/subscriptions/72d5d2d5-98b2-41c2-8010-b1b6ad00a17e/resourceGroups/rg-gcc-git-con-ops-sea-02-tgy/providers/Microsoft.Network/virtualHubs/vhub-hub-dev-cwr/hubVirtualNetworkConnections/Aud-con1"       

      }
    }
  }

}