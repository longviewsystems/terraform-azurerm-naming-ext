# Overview
This module canbe used to simplify Azure Resource naming.  Following the naming convention can be error prone, and time consuming.  This module outputs names that conform with the ORG naming requirements.  

Note: There are some limitations and so names should be double checked.

Features:
* Generates a list of resource names by type (e.g. Virtual Wan name vwan-rog-mtx-dev-wu-01)
* Location and environment are validated, and only accept pre-defined architecturally acceptable values.
  * For example, the location variable can only be set to "scus", "ncus", "glb".
* Names are output for use in larger Terraform projects.
* Names are truncated based on the length the Resource Type supports.
* Names are validated against allowed Azure naming values.
* Resources that do not support special characters like hyphens have them removed (e.g. Azure Storage Account names).
* Uses the Microsoft maintained Azure CAF naming module (aztfmod/azurecaf).
  * Supports the list of resources supported by [Azure CAF Module](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name).
* Limit the output to just the required resources.
* Randomize names flag: A flag that randomizes the names without changing the code.
  * Uses hashicorp/random provider to control randomization.
* Supports a 'general' resource type that does not include the Resource type code (e.g. Virtual Wan name vwan-rog-mtx-dev-wu-01, and general name rog-mtx-dev-wu-01)

These name components align with the [Azure Naming Tool](https://github.com/microsoft/CloudAdoptionFramework/tree/master/ready/AzNamingTool) which is part of the Azure Cloud Adoption Framework list of [tools](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/resources/tools-templates).  The Azure Naming Tool is very useful for generating full naming conventions.

# Notes
* Some resources need to be globally unique, and common names are used by other organizations and so naming collisions are common.  To avoid this scenario, certain resource types have a special ORG specific identifier added.  These resource types are output from the **special_instances output**, and not from the **instances**.
  * Identifier: org
  * Specially handled resources
    * azurerm_storage_account

# Limitations

* If names are too long for the requested resource type, then they will be truncated.  
  * This issue can happen when the variable appname is too long, and/or then enable_random_name_component is true.
  * Certain Resource types (e.g. Virtual Machines) support very short names, and the naming convention will be truncated to the length of the Resource Type.  This may remove naming components that are important.  
* Maintaining the list of resources is challenging and requires a lot of manual work.  In some cases the names produced by this module may not match the [Azure Naming Tool](https://github.com/microsoft/CloudAdoptionFramework/tree/master/ready/AzNamingTool).  Names should be double checked.


------------

## Usage

```hcl

module "test_one" {
  source          = source = "git::https://lvs1code.visualstudio.com/CloudManagementPlatform/_git/terraform-azurerm-naming"
  resource_types  = ["general", "azurerm_resource_group", "azurerm_app_service", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet"]
  environment     = "mgt"
  location        = "scus"
  appname         = "pa"
  instances       = ["01"]  #multi-instance sample ["01", "02", "03"]
}

Outputs:

test_one_app_service_output = {
  "instances" = {
    "01" = {
      "debug" = null /* object */
      "names" = tomap({
        "azurerm_app_service" = "app-pa-mgt-scus-01"
        "azurerm_firewall" = "fw-pa-mgt-scus-01"
        "azurerm_key_vault" = "kv-pa-mgt-scus-01"
        "azurerm_network_security_group" = "nsg-pa-mgt-scus-01"
        "azurerm_network_watcher" = "nw-pa-mgt-scus-01"
        "azurerm_resource_group" = "rg-pa-mgt-scus-01"
        "azurerm_subnet" = "snet-pa-mgt-scus-01"
        "azurerm_virtual_network" = "vnet-pa-mgt-scus-01"
        "azurerm_virtual_network_gateway" = "vgw-pa-mgt-scus-01"
        "general" = "pa-mgt-scus-01"
      })
    }
  }
  "special_instances" = {
    "01" = {
      "debug" = null /* object */
      "names" = tomap({
        "azurerm_storage_account" = "storgpamgtscus01"
      })
    }
  }
}

```

------------
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.8 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_names"></a> [names](#module\_names) | git::https://github.com/longviewsystems/terraform-azurerm-naming.git | 2.0.0 |
| <a name="module_special_names"></a> [special\_names](#module\_special\_names) | git::https://github.com/longviewsystems/terraform-azurerm-naming.git | 2.0.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appname"></a> [appname](#input\_appname) | The value to use as the application or workload name.  Replaces the 'ProjAppSvc' name component. | `string` | n/a | yes |
| <a name="input_enable_random_name_component"></a> [enable\_random\_name\_component](#input\_enable\_random\_name\_component) | Add a random name component. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The value to replace the 'Environment' name components with.  Acceptable locations are con, idt, mgt, prd, tst, dev, shd. | `string` | `"dev"` | no |
| <a name="input_instances"></a> [instances](#input\_instances) | The values to replace the 'Instance' name components with. | `list(string)` | <pre>[<br>  "01"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The value to replace the 'Location' name components with.  Acceptable locations are scus, ncus, and glb. | `string` | `"scus"` | no |
| <a name="input_name_components"></a> [name\_components](#input\_name\_components) | The components of the names.  Each compoent will be replaced with a value from one of the variables.  See the readme for further details.  The default value aligns with ORG naming conventions. | `list(string)` | <pre>[<br>  "ResourceType",<br>  "ProjAppSvc",<br>  "Environment",<br>  "Location",<br>  "Instance"<br>]</pre> | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The value to replace the 'Org' name components with. | `string` | `"org"` | no |
| <a name="input_resource_types"></a> [resource\_types](#input\_resource\_types) | A list of resource type(s) that should be generated (output) using the same settings. Pick from this list: https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name#resource-types | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instances"></a> [instances](#output\_instances) | The names to be output by the naming module. |
| <a name="output_special_instances"></a> [special\_instances](#output\_special\_instances) | The names to be output by the naming module. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->