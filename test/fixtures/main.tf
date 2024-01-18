module "test_one" {
  source         = "../../"
  resource_types = ["general", "azurerm_resource_group", "azurerm_app_service", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_watcher", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet", "azurerm_virtual_network_gateway", "azurerm_firewall"]
  environment    = "mgt"
  location       = "scus"
  appname        = "pa"
  instances      = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
}

module "test_two" {
  source         = "../../"
  resource_types = ["general", "azurerm_resource_group", "azurerm_app_service", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_watcher", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet", "azurerm_virtual_network_gateway", "azurerm_firewall"]
  environment    = "prd"
  location       = "ncus"
  appname        = "rh"
  instances      = ["01", "02", "03"]
}

module "test_two_random" {
  source                       = "../../"
  resource_types               = ["general", "azurerm_resource_group", "azurerm_app_service", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_watcher", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet", "azurerm_virtual_network_gateway", "azurerm_firewall"]
  environment                  = "prd"
  location                     = "ncus"
  appname                      = "rh"
  instances                    = ["01", "02", "03"]
  enable_random_name_component = true
}

module "test_three" {
  source         = "../../"
  resource_types = ["general", "azurerm_resource_group", "azurerm_app_service", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_watcher", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet", "azurerm_virtual_network_gateway", "azurerm_firewall"]
  environment    = "idt"
  location       = "scus"
  appname        = "ad"
  instances      = ["01", "02", "03"]
  #enable_random_name_component = true
}