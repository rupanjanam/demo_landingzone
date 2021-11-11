custom_landing_zones = {

  contoso-devops = {
    display_name               = "Devops"
    parent_management_group_id = "contoso-platform"
    subscription_ids = []
    subscriptions = {}
    archetype_config = {
      archetype_id   = "devops"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-hr = {
    display_name               = "HR"
    parent_management_group_id = "contoso-landing-zones"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id   = "hr"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-finance = {
    display_name               = "Finance"
    parent_management_group_id = "contoso-landing-zones"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id   = "finance"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-engineering = {
    display_name               = "Engineering"
    parent_management_group_id = "contoso-landing-zones"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id   = "engineering"
      parameters     = {}
      access_control = {}
    }
  }

  contoso-staging = {
    display_name               = "Staging"
    parent_management_group_id = "contoso-engineering"
    subscription_ids = []
    subscriptions = {}
    archetype_config = {
      archetype_id = "staging"
      parameters = {}
      access_control = {}
    }
  }

  contoso-dev = {
    display_name               = "Dev"
    parent_management_group_id = "contoso-engineering"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id = "contoso-dev"
      parameters = {}
      access_control = {}
    }
  }

  contoso-production = {
    display_name               = "Production"
    parent_management_group_id = "contoso-engineering"
    subscription_ids           = []
    subscriptions              = {}
    archetype_config = {
      archetype_id = "production"
      parameters = {

      }
      access_control = {}
    }
  }


}