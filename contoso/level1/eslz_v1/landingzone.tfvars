landingzone = {
  backend_type        = "azurerm"
  global_settings_key = "caf_foundations_sharedservices"
  level               = "level1"
  key                 = "caf_foundations_enterprise_scale"
  tfstates = {
    caf_foundations_sharedservices = {
      level   = "current"
      tfstate = "caf_foundations_sharedservices.tfstate"
    }
    launchpad = {
      level   = "lower"
      tfstate = "caf_launchpad.tfstate"
    }
  }
}