landingzone = {
  backend_type = "azurerm"
  level        = "level0"
  key          = "launchpad"
}

# Do not change the following values
passthrough   = false
random_length = 3
inherit_tags  = true
prefix        = ""

# Default region. When not set to a resource it will use that value
default_region = "singapore"

regions = {
  region1   = "southeastasia"
  region2   = "eastasia"
  singapore = "southeastasia"
}

launchpad_key_names = {
  keyvault = "level0"
  tfstates = [
    "level0",
    "level1",
    "level2",
    "level3",
    "level4"
  ]
}

resource_groups = {
  level0 = {
    name = "caf-launchpad-level0"
    tags = {
      level = "level0"
    }
  }
  level1 = {
    name = "caf-launchpad-level1"
    tags = {
      level = "level1"
    }
  }
  level2 = {
    name = "caf-launchpad-level2"
    tags = {
      level = "level2"
    }
  }
  level3 = {
    name = "caf-launchpad-level3"
    tags = {
      level = "level3"
    }
  }
  level4 = {
    name = "caf-launchpad-level4"
    tags = {
      level = "level4"
    }
  }
  security = {
    name = "caf-launchpad-security"
  }
}

tags = {
  project_code               = "CAF-TF"
  name                       = "CAF Terraform Landingzones and solutions"
  data_classification        = "Internal"
  application_classification = "Standard"
  mpnid                      = "994867"
  cuaid                      = "adb8eac6-989a-5354-8580-19055546ec74"
}
