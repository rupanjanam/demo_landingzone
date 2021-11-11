## Level 0 Launchpad
The Level 0 launchpad is meant to host platform resources needed for:
- Resources meant for Terraform state file storage 
- Vaulting of secrets
- Role based access control
- DevOps solution integration

We modify the values within each configuration files i.e. tfvars files as per the environment to be set up. 

Each deployment has its individual Terraform state  (tfsate) file created and stored within the appropriate level Storage Account tfstate container. 
Let's take a look at the code below:
<pre>
landingzone = {
  backend_type = "azurerm"      // This implies Terraform backend
  level        = "level0"      // This refers to the Level 0 Storage account to store tfstate 
  key          = "launchpad"  // This is referring to the name of the tfstate file that will be created.
}
</pre>

In this code for launchpad, we are creating the following:

- Level 0 to Level 4 Storage Accounts
- Level 0 to Level 4 Azure KeyVaults and 1 Secrets KeyVault
- KeyVault Access Policies as required
- Level 0 to Level 4 MSI accounts
- RBAC for Subscription, Storage accounts and KeyVault.

The MSI accounts are used by CI/CD pipelines runners to deploy into Azure. But for the scope of this lab, we will be excluding that part.