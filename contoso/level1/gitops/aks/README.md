#The steps mentioned here are meant to create AKS hosted Gitlab runners, to run Gitlab Project CI/CD pipeline jobs.
#The steps should be followed after having created an AKS Cluster with MSI Identity.

#Perform the following steps:

1. Create AKS and additional MSI for pod identity:
    az identity create --resource-group <my-resource-group> --name <identity-name>

   Assign Roles:
    Managed Identity Operator (Kubelet MSI to additional MSI) (allows pods to take the additional MSI identity)
    Managed Identity Operator (Kubelet MSI on Node RG) 
    VM Contributor (Kubelet MSI on Node RG)
    Network Contributor (Kubelet MSI to AKS Cluster VNET)

2. Login to rover/shell using-
    az login
   Set Subscription:
    az account set --subscription <subscription id>

   Get credentials of AKS cluster:
    az aks get-credentials --resource-group <myRG> --name <my-AKS-Cluster>

3. //Run the following with tools available to customer

    kubectl create ns pod-identity-system
    kubectl apply -f aad-pod-identity.yaml -n pod-identity-system

    kubectl create ns gitlab-runners
    kubectl apply -f aad-msi-binding.yaml -n gitlab-runners

4. #Helm commands:
    helm repo add gitlab https://charts.gitlab.io

    helm install --namespace gitlab-helm gitlab-runner -f values.yaml gitlab/gitlab-runner
    
    helm install -n gitlab-runners caf-platform-level0 -f /tf/caf/contoso/level0/gitlab/charts/gitlab-runner-caf-platform-level0.yaml gitlab/gitlab-runner




