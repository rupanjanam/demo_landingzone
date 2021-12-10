landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "launchpad"
  level               = "level1"
  key                 = "caf_gitops_aks_gitlab_runners"
  tfstates = {
    launchpad = {
      level   = "lower"
      tfstate = "caf_launchpad.tfstate"
    }
    caf_gitops_aks = {
      level   = "current"
      tfstate = "caf_gitops_aks.tfstate"
    }
  }
}