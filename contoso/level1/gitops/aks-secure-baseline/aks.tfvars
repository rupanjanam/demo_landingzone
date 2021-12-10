# AKS cluster to deploy the Gitlab helm charts
aks_cluster_key      = "cluster_re1"
aks_cluster_vnet_key = "vnet_gitops"

aad_pod_identity = {
  namespace = "cluster-baseline-settings"
  yaml      = "yaml/aad-pod-identity.yaml"
}

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