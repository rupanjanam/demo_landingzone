# AKS cluster to deploy the Gitlab helm charts
aks_cluster_key      = "cluster_re1"
aks_cluster_vnet_key = "vnet_gitops"

aks_clusters = {
  cluster_re1 = {
    lz_key = "caf_gitops_aks"
    key    = "cluster_re1"
  }
}

# aks_namespaces = {
#   gitlab_runners = "caf-gitlab-runners"
# }

helm_charts = {
  level0 = {
    name       = "caf-runner-level0"
    repository = "https://charts.gitlab.io/"
    chart      = "gitlab-runner"
    value_file = "../../../../contoso/level1/gitops/charts/gitlab-runner-caf-platform-level0.yaml"
    namespace  = "caf-gitlab-runners"
  }
  level1 = {
    name       = "caf-runner-level1"
    repository = "https://charts.gitlab.io/"
    chart      = "gitlab-runner"
    value_file = "../../../../contoso/level1/gitops/charts/gitlab-runner-caf-platform-level1.yaml"
    namespace  = "caf-gitlab-runners"
  }
  level2 = {
    name       = "caf-runner-level2"
    repository = "https://charts.gitlab.io/"
    chart      = "gitlab-runner"
    value_file = "../../../../contoso/level1/gitops/charts/gitlab-runner-caf-platform-level2.yaml"
    namespace  = "caf-gitlab-runners"
  }
  subscription_creation_platform = {
    name       = "caf-runner-subscription-creation-platform"
    repository = "https://charts.gitlab.io/"
    chart      = "gitlab-runner"
    value_file = "../../../../contoso/level1/gitops/charts/gitlab-runner-caf-subscription-creation-platform.yaml"
    namespace  = "caf-gitlab-runners"
  }
   /*subscription_creation_landingzones = {
    name       = "caf-runner-subscription-creation-landingzones"
    repository = "https://charts.gitlab.io/"
    chart      = "gitlab-runner"
    value_file = "../../../../contoso/level1/gitops/charts/gitlab-runner-caf-subscription-creation-landingzones.yaml"
    namespace  = "caf-gitlab-runners"
  }
  subscription_creation_lz_vm = {
    name       = "caf-runner-subscription-creation-lz-vm2"
    repository = "https://charts.gitlab.io/"
    chart      = "gitlab-runner"
    value_file = "../../../../contoso/level1/gitops/charts/gitlab-runner-caf-subscription-creation-lz-vm.yaml"
    namespace  = "caf-gitlab-runners"
  }
  subscription_creation_infra_vm = {
    name       = "caf-runner-subscription-creation-infra-vm"
    repository = "https://charts.gitlab.io/"
    chart      = "gitlab-runner"
    value_file = "../../../../contoso/level1/gitops/charts/gitlab-runner-caf-subscription-creation-infra-vm.yaml"
    namespace  = "caf-gitlab-runners"
  } */
}