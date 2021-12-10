#### nonprod vhub

```bash
cd /tf/caf/landingzones
git checkout separate_vwan_from_vhub

caf_env="contoso-sandpit"
# contosotestmaster-apex-prd-caf-platform
TF_VAR_tfstate_subscription_id="072bae4a-22d7-4db2-bd6e-372cca8b8842"
target_subscription="072bae4a-22d7-4db2-bd6e-372cca8b8842"
### AKS construction set
####Set-up the aks cluster

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