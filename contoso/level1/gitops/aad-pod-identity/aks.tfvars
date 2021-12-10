# AKS cluster to deploy the Gitlab helm charts
aks_cluster_key      = "cluster_re1"
aks_cluster_vnet_key = "vnet_gitops"

aks_clusters = {
  cluster_re1 = {
    lz_key = "caf_gitops_aks"
    key    = "cluster_re1"
  }
}

vnets = {
  vnet_gitops = {
    lz_key = "caf_gitops_aks"
    key    = "vnet_gitops"
    subnet_keys = [
      "aks_gitlab",
      "jumpbox"
    ]
  }
}

managed_identities = {
  launchpad_msi = {
    lz_key = "launchpad"
    msi_keys = [
      "level0",
      "level1",
      "level2",
      "subscription_creation_platform"
      /* "subscription_creation_landingzones" */
    ]
    # aad_msi_binding key is the concatanation of the managed _identity_key and msi_key
    # the path is a relative path to the lz path or full path
    aad_msi_bindings = {
      level0 = {
        azureIdentity = "podmi-caf-rover-platform-level0"
        selector      = "podmi-caf-rover-platform-level0"
      }
      level1 = {
        azureIdentity = "podmi-caf-rover-platform-level1"
        selector      = "podmi-caf-rover-platform-level1"
      }
      level2 = {
        azureIdentity = "podmi-caf-rover-platform-level2"
        selector      = "podmi-caf-rover-platform-level2"
      }
       subscription_creation_platform = {
        azureIdentity = "podmi-caf-rover-platform-subscription-creation"
        selector      = "podmi-caf-rover-platform-subscription-creation"
      }
      /*subscription_creation_landingzones = {
        azureIdentity = "podmi-caf-rover-landingzones-subscription-creation"
        selector      = "podmi-caf-rover-landingzones-subscription-creation"
      } */
      /* landingzones_service_user = {
        azureIdentity = "podmi-caf-rover-landingzones-service-user"
        selector      = "podmi-caf-rover-landingzones-service-user"
      } */
    }
  }
}

aad_pod_identity = {
  namespace     = "caf-gitlab-runners"
  yaml_template = "aad-pod-identity.yaml"
}