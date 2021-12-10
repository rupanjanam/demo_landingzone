subscriptions = {

  # Create new subscription
  #  Requires enrollment_account, agreement_type and offer_type
  #  To update the Enrollment Account name and Billing Account name.


  networking_vwan = {
    name                    = "contoso-platform"
    billing_account_name    = ""
    enrollment_account_name = ""
    management_group_id     = "contoso-devops"
    workload                = "Production"

    tags = {
      Application_Classification = "Standard"
      cProject_Code              = "CAF-TF"
      cuaID                      = "adb8eac6-989a-5354-8580-19055546ec74"
      Data_Classification        = "Internal"
      MPNID                      = "994867"
      Name                       = "CAF Terraform Landingzones and solutions"
      caf_environment            = "Contoso Sandpit"
    }

  }

}