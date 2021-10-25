

virtual_hub_connections = {

  # Establish the peering with Virtual Hubs

   con1 = {
     name                      = "shared-con1"
     internet_security_enabled = true

     vhub = {
       virtual_wan_key = "vwan_re1"
       virtual_hub_key = "hub_re1"
     }

     vnet = {
  #     # If the virtual network is stored in another another landing zone, use the following attributes to refer the state file: lz_key = "state name"
  
       vnet_key = "vnet2"
     }

     routing = {
       route1 = {
         virtual_hub_route_table_key = "routetable1"

         propagated_route_table = {
           virtual_hub_route_table_keys = [
             "routetable1", "routetable2", "defaultRouteTable"
           ]
           /* labels = ["Prod_Private"] */
         }

       }
     }
   }

    con2 = {
    name                      = "Aud-con1"
    internet_security_enabled = true

    vhub = {
      virtual_wan_key = "vwan_re1"
      virtual_hub_key = "hub_re1"
    }

    vnet = {
      # If the virtual network is stored in another another landing zone, use the following attributes to refer the state file: lz_key = "state name"
      
      vnet_key = "vnet1"
    }
    routing = {
      route1 = {
        virtual_hub_route_table_key = "routetable2"

        propagated_route_table = {
          virtual_hub_route_table_keys = [
            "routetable1", "routetable2"
          ]
          /* labels = ["Prod_Public"] */
        }
        static_vnet_route = {
          crm = {
            name = "InternetRoute"
            address_prefixes  = [
              "0.0.0.0/0"
            ]
            next_hop = {
         
            key = "firewall1"
            interface_index = 0 # Required for AzureFirewall in vnet and Virtual appliances
          }
        }
      }  
    }
  }
  }

  # con3 = {
  #   name                      = "Comp-con1"
  #   internet_security_enabled = true

  #   vhub = {
  #     virtual_wan_key = "vwan_re1"
  #     virtual_hub_key = "hub_re1"
  #   }

  #   vnet = {
  #     # If the virtual network is stored in another another landing zone, use the following attributes to refer the state file:
  #     lz_key = "caf_compsub"
  #     vnet_key = "vnet1"
  #   }
    
  #    routing = {
  #     route1 = {
  #       virtual_hub_route_table_key = "routetable1"

  #       propagated_route_table = {
  #         virtual_hub_route_table_keys = [
  #           "routetable1", "routetable2", "Default"
  #         ]
  #         labels = ["Prod_Private"]
  #       }

  #     }
  #   }

  # }

  # con4 = {
  #   name                      = "Dmzcon1"
  #   internet_security_enabled = true

  #   vhub = {
  #     virtual_wan_key = "vwan_re1"
  #     virtual_hub_key = "hub_re1"
  #   }

  #   vnet = {
  #     # If the virtual network is stored in another another landing zone, use the following attributes to refer the state file:
  #     lz_key = "caf_dmz"
  #     vnet_key = "vnet1"
  #   }
  
  #   routing = {
  #     route1 = {
  #       virtual_hub_route_table_key = "routetable1"

  #       propagated_route_table = {
  #         virtual_hub_route_table_keys = [
  #           "routetable1", "routetable2", "Default"
  #         ]
  #         labels = ["Prod_Private"]
  #       }

  #     }
  #   }

  # }

  # con5 = {
  #   name                      = "ntwkmgmtcon1"
  #   internet_security_enabled = true

  #   vhub = {
  #     virtual_wan_key = "vwan_re1"
  #     virtual_hub_key = "hub_re1"
  #   }

  #   vnet = {
  #     # If the virtual network is stored in another another landing zone, use the following attributes to refer the state file:
  #     lz_key = "caf_ntwkmgmt"
  #     vnet_key = "vnet1"
  #   }

  #    routing = {
  #     route1 = {
  #       virtual_hub_route_table_key = "routetable1"

  #       propagated_route_table = {
  #         virtual_hub_route_table_keys = [
  #           "routetable1", "routetable2", "Default"
  #         ]
  #         labels = ["Prod_Private"]
  #       }

  #     }
  #   }

  # }

}

