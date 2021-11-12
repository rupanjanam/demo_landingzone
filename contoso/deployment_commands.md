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


