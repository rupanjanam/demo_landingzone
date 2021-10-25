/* virtual_hub_er_gateway_connections = {
sgp-er-1 = {
   name                     = "ergw-net-sea-vwan-01-vhub-01-er-vgw-01-rww-TO-sgp-er-1"
   resource_group_key       = "hub_re1"
   routing_weight           = 20
   enable_internet_security = true

    virtual_wan = {
      key             = "vwan_re1"
      virtual_hub_key = "hub_re1"
    }

     express_route_circuit = {
#       id = ""
     }

     express_route_circuit_authorization = {
#       authorization_key = ""
     }

     route_table = {
       key = "routetable1"
#       # id = ""
     }


     propagated_route_tables = {
       keys = ["routetable1"]
#       # ids = [
#       #   ""
#       # ]
       labels = ["default"]
     }

#     # vnet_routes = {
#     #   crm = {
#     #     name = "crm"
#     #     address_prefixes  = [
#     #
#     #     ]
#     #     next_hop_ip_address = ""
#     #   }
#     # }
   }


} */