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
#
# Reference to the AAD managed identities to register to the AKS cluster
#
managed_identities = {
  launchpad_msi = {
    lz_key = "launchpad"
    msi_keys = [
      "level0",
      "level1",
      "level2"
      "subscription_creation_platform"
      /* "subscription_creation_landingzones" */
    ]
  }
}
namespaces = {
  flux = {
    name = "flux-system"
  }
}

flux_settings = {
  aks_secure_baseline = {
    namespace   = "flux-system"
    url         = "https://github.com/Azure/caf-terraform-landingzones-starter.git"
    branch      = "starter"
    target_path = "./enterprise_scale/construction_sets/aks/online/aks_secure_baseline/cluster-baseline-settings/flux"
  }
}