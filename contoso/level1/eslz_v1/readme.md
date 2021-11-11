## Level 1 Enterprise Scale Landing Zone
The Enterprise Scale deploys the following features:
- Management Group hierarchy
- Azure Policies
- Custom Azure RBAC roles
- Subscription organisation 

The ESLZ uses Archetypes to deploy Policy assignments, Policy definitions and any custom roles, under the scope of a Management Group. Let's consider the following archetype JSON code:
<pre>
{
    "connectivity": {
      // Lists the policy assignments to be applied on Connectivity Management Group
        "policy_assignments": [],  

      // Lists the policy definitions deployed at Connectivity Management Group level
        "policy_definitions": [],  

      // Lists the policy set definitions deployed at Connectivity Management Group level      
        "policy_set_definitions": [],

      // Lists the role definitions deployed at Connectivity Management Group level  
        "role_definitions": [
            "contoso-subscription-creation-landingzones"
        ],
        "archetype_config": {
            "parameters": {},
            "access_control": {}
        }
    }
}
</pre>

The policy assignments, policy definitions, policy set-definitions and custom role definitions are all found under the respective folders under /tf/caf/contoso/level1/eslz_v1/lib.

#### <b>Note: </b>
As a best practice, all custom policy definitions are deployed at the Root Management Group level. In this case we have named the Root Management Group as 'Contoso'.

Now let's go through each of the tfvars files:

#### <b> enterprise_scale.tfvars</b>
This supplies the following:
- path to all policy and role definition files
- name and id of the Root Management Group
- values for deploying core Enterprise Scale landing zone (true/false). This is recommended as 'true' for all customers.

#### <b> subscription_id_overrides.tfvars</b>
This supplies the following:
- pass any subscription IDs of subscriptions that needs to be placed under the built-in Management groups.

#### <b> custom_landing_zones.tfvars</b>
This supplies the following:
- Custom Management Groups that needs to be added over and above the built-in Management groups
- Archetypes that needs to apply to the Custom Management Groups
- Parameters to be passed to policies applied to the custom Management groups
- RBAC permissions to be applied to an object at the custom Management group level
- Subscriptions to be passed under custom Management groups.

#### <b> archetype_config_overrides.tfvars</b>
This supplies the following:
- Any overrides to be passed to the built-in Management groups in terms of policy assignments, parameters passed to policy assignments, RBAC permissions.


For more information on Enterprise Scale best practices, refer [CAF Enterprise Scale](https://github.com/Azure/terraform-azurerm-caf-enterprise-scale) documentation.