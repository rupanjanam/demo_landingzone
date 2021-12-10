# Deployment steps

## Clone the CAF Landing zones modules
```bash
lz_branch="2111.0"
git clone --branch ${lz_branch} https://github.com/Azure/caf-terraform-landingzones.git /tf/caf/landingzones

# Or refresh an existing clone
cd /tf/caf/landingzones
git fetch origin
git checkout ${lz_branch}
git pull
git status

cd /tf/caf
git pull
```

## Set the CAF environment of the launchpad

```bash
caf_env="contoso-sandpit"
```
## Set the subscription IDs for Terraform state hosting and target deployments:

```bash
TF_VAR_tfstate_subscription_id=""
target_subscription=""
```

## Level 0

### Launchpad
Set-up the launchpads for level0 to level4

```bash


rover \
  -lz /tf/caf/landingzones/caf_launchpad \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level0/launchpad \
    -launchpad \
    -env ${caf_env} \
    -level level0 \
    -a [plan|apply|destroy]

```
### Subscription role creation delegations (only execute if you have an EA)

#  Get billing roles definitions
az rest --method GET --url https://management.azure.com/providers/Microsoft.Billing/billingAccounts/7516237/enrollmentAccounts/279001/billingRoleDefinitions?api-version=2019-10-01-preview --query "value[?properties.roleName=='Enrollment account subscription creator'].{id:id}" -o tsv

# Run the below role delegation command with an EA Account Owner account

```bash

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level0/billing_subscription_role_delegations \
  -tfstate billing_subscription_role_delegations.tfstate \
    -launchpad \
    -env ${caf_env} \
    -level level0 \
    -a plan
```

## Level 1


### Foundation - Shared Services

```bash

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/shared_services \
  -tfstate caf_foundations_sharedservices.tfstate \
  -env ${caf_env} \
  -level level1 \
  -a [plan|apply|destroy]

```

### Enterprise Scale

```bash
## Elevate Global Admin and Subscription Owner to User Access Administrator:

az rest --method post --url "/providers/Microsoft.Authorization/elevateAccess?api-version=2016-07-01"

# Check Access:

az role assignment list --role "User Access Administrator" --scope "/"

rover \
  -lz /tf/caf/landingzones/caf_solution/add-ons/caf_eslz \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/eslz_v1 \
  -tfstate caf_foundations_enterprise_scale.tfstate \
  -env ${caf_env} \
  -level level1 \
  -parallelism 50 \
  -a [plan|apply|destroy]

```
#### Enterprise Agreement subscriptions - to be created only when you have an EA agreement 
```bash

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/subscriptions \
  -tfstate platform_subscriptions_contosotestmaster.tfstate \
  -env ${caf_env} \
  -level level1 \
  -a plan

```

### GitLab Integration- 
# Steps to integrate with Gitlab can only be followed after this repository code is copied and pushed to your https://gitlab.com or Gitlab server repositories.

# AKS construction set
Set-up the aks cluster

```bash

rover \
  -lz /tf/caf/landingzones/caf_solution \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/gitops/aks \
  -tfstate caf_gitops_aks.tfstate \
  -env ${caf_env} \
  -level level1 \
  -a plan

```

NOTE -> The following steps must be executed from the private vnet (jumbox, vpn, line of sight)s

#### AKS Secure Baseline

```bash

rover \
  -lz /tf/caf/landingzones/caf_solution/add-ons/aks-secure-baseline \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/gitops/aks-secure-baseline \
  -tfstate caf_gitops_aks_secure_baseline.tfstate \
  -env ${caf_env} \
  -level level1 \
  -a plan

rover \
  -lz /tf/caf/landingzones/caf_solution/add-ons/aks_secure_baseline_v2 \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/gitops/aks-secure-baseline_v2 \
  -tfstate caf_gitops_aks_secure_baseline_v2.tfstate \
  -env ${caf_env} \
  -level level1 \
  -a plan

```

#### AKS AAD Pod Identity Binding

```bash

rover \
  -lz /tf/caf/landingzones/caf_solution/add-ons/aad-pod-identity \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/gitops/aad-pod-identity \
  -tfstate caf_gitops_aks_aad_pod_identity.tfstate \
  -env ${caf_env} \
  -parallelism=1 \
  -level level1 \
  -a plan

```

#### Deploy Gitlab runners

# Copy and replace your Gitlab URL and Runner Registration token in the gitlab-runner-caf-platform yaml files in contoso-> level1-> gitops-> charts.
# Update the image in the gitlab-runner-caf-platform yaml file as per requirement.

```bash

rover \
  -lz /tf/caf/landingzones/caf_solution/add-ons/helm-charts\
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level1/gitops/charts \
  -tfstate caf_gitops_aks_gitlab_runners.tfstate \
  -env ${caf_env} \
  -level level1 \
  -a plan

```
# Post successful integration of Gitlab with the AKS pod hosted runners, the runners will start appearing on the Gitlab Settings page on: Settings-> CI/CD-> Runners.
# The Gitlab pipeline definitions can then be created for each individual deployment. All the pipelines can be referenced by a master pipeline which is placed at the root of the repository. 

## Level2

### Networking Layer creation

```bash

#vWAN infrastructure creation with 2 vHUBs
rover \
  -lz /tf/caf/landingzones/caf_solution \
  -tfstate_subscription_id ${TF_VAR_tfstate_subscription_id} \
  -target_subscription ${target_subscription} \
  -var-folder /tf/caf/contoso/level2/networking/vwan \
  -tfstate caf_networking_vwan.tfstate \
  -env ${caf_env} \
  -level level2 \
  -a [plan|apply|destroy]


