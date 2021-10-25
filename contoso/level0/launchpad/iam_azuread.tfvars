#
# Available roles:
# az rest --method Get --uri https://graph.microsoft.com/v1.0/directoryRoleTemplates -o json | jq -r .value[].displayName
#
azuread_roles = {
  managed_identities = {
    level0 = {
      roles = [
        "Privileged Role Administrator"
      ]
    }
    level1 = {
      roles = [
        "Directory Readers",
        "User Administrator"
      ]
    }
    level2 = {
      roles = [
        "Directory Readers"
      ]
    }
    # level3 = {
    #   roles = [
    #     "Directory Readers",
    #     "Application Administrator",
    #     "Groups Administrator",
    #     "User Administrator"
    #   ]
    # }
  }
}