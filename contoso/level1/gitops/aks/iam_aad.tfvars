
# Create Azure Active Directory Groups
azuread_groups = {

  # cluster_re1 AKS admin group
  #
  aks_cluster_re1_admins = {
    name        = "aks-cluster-re1-admins"
    description = "Provide read and write access to the AKS cluster admin"
    members = {
      object_ids = [
        // Add user or group object ID for permission to the AKS cluster
      ]
    }
    prevent_duplicate_name = false
  }

}
