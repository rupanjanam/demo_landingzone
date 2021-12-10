subscription_billing_role_assignments = {

  # Delegate the Enrollment account owner role to subscription_creation_platform msi
   

  # Delegated accounts who can create subscriptions.
  # Used by Gitlab pipelines
  contosotestmaster_subscription_creators = {
    billing_account_name         = ""
    enrollment_account_name      = ""
    billing_role_definition_name = "Enrollment account subscription creator"

    principals = {
      managed_identities = {
        subscription_creation_platform = {
          lz_key = "launchpad"
          key    = "subscription_creation_platform"
        }
        
      }
    }

  }

}