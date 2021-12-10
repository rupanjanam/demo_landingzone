landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "caf_gitops_aks"
  level               = "level1"
  key                 = "caf_gitops_aks_secure_baseline"
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