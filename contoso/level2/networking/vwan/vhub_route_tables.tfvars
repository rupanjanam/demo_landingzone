# virtual_hub_route_tables = {
#   routetable1 = {
#     name = "RT_Prod_Private"

#     virtual_wan_key = "vwan_re1"
#     virtual_hub_key = "hub_re1"
    
#     labels = ["Prod_Private"]
#     routes = {
#       r1 = {
#         name              = "Internet-route"
#         destinations_type = "CIDR"
#         destinations      = ["0.0.0.0/0"] #Route Traffic (internet) 0.0.0.0/0 with Next hop as Virtual Appliance – Azure Firewall private address sitting in DMZ Spoke. 
#           next_hop = {
#           # lz_key = "caf_networking_vwan"  
#           resource_type = "virtual_hub_connection"  # Only supported value.
#           resource_key  = "con2"
#         }

#       }

#       r2 = {
#         name              = "NAT-route"
#         destinations_type = "CIDR"
#         destinations      = ["10.0.0.0/16"] # Route Traffic with On-Premises Address prefix /CIDR range to Next hop as Virtual Appliance directed to NVA /Linux server in the Spoke 2. 
#                 next_hop = {
#           resource_type = "virtual_hub_connection"  # Only supported value.
#           resource_key  = "con2"
#         }

#       }  

#     }
#   }

#   routetable2 = {
#     name = "RT_Prod_Public"

#     virtual_wan_key = "vwan_re1"
#     virtual_hub_key = "hub_re1"

#     labels = ["Prod_Public"]
#        routes = {
#       r1 = {
#         name              = "Internet-route"
#         destinations_type = "CIDR"

#         next_hop = {
#           resource_type = "virtual_hub_connection"  # Only supported value.
#           resource_key  = "con2"
#         }

#         destinations      = ["0.0.0.0/0"]

#       }
#     }
      
#   }

# }


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