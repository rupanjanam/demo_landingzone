resource_groups = {

  #
  # Log Analytics resource groups
  #

  la_sea_rg_01 = {
    name   = "caf-la-sea"
    region = "region1"
    tags   = {}
  }

  la_sea_rg_asc_export = {
    name   = "caf-la-asc"
    region = "region1"
    tags   = {}
  }

  network_watcher_sea_rg = {
    name   = "network-watcher-sea"
    region = "singapore"
    tags   = {}
  }

  ev_sea_rg_01 = {
    name   = "caf-ev-sea"
    region = "singapore"
    tags   = {}
  }
}
