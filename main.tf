module "names" {
  for_each = toset(var.instances)
  source   = "git::https://github.com/longviewsystems/terraform-azurerm-naming.git?ref=2.0.0"

  resource_types = local.normal_list

  name_components = var.name_components
  environment     = var.environment
  organization    = var.organization
  location        = local.geo_code_name
  proj_app_or_svc = var.appname
  unit_or_dept    = null
  instance        = each.key

  enable_random_name_component = var.enable_random_name_component

}

module "special_names" {
  for_each = toset(var.instances)
  source   = "git::https://github.com/longviewsystems/terraform-azurerm-naming.git?ref=2.0.0"

  resource_types = local.client_specific_resource_types

  name_components = var.name_components
  environment     = var.environment
  organization    = var.organization
  location        = local.geo_code_name
  proj_app_or_svc = "org${var.appname}" #org is the identifier used to make certain resource types more likely to be globally unique.
  unit_or_dept    = null
  instance        = each.key

  enable_random_name_component = var.enable_random_name_component
}