azure_container_registries = {
  acr1 = {
    name               = "caf-rover"
    resource_group_key = "gitops"
    sku                = "Premium"
  }
}

# sudo az acr import --name crcafroverepi.azurecr.io --source docker.io/aztfmod/rover:0.14.10-2104.0806 --image rover:0.14.10-2104.0806