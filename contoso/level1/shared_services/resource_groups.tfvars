resource_groups = {

  #
  # Log Analytics resource group
  #

  la_sea_rg_01 = {
    name   = "caf-la-sea"
    region = "region1"
    tags   = {}
  }

# Storage Account resource group

  stg_contoso_sea_rg = {
    name   = "stg-contoso-rg-sea"
    region = "singapore"
    tags   = {}
  }

# Event Hub resource group

  ev_sea_rg_01 = {
    name   = "caf-ev-sea"
    region = "singapore"
    tags   = {}
  }
}
