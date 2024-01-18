/* Test one outputs **/
//"azurerm_resource_group", "azurerm_storage_account", "azurerm_key_vault", "azurerm_network_watcher", "azurerm_network_security_group", "azurerm_virtual_network", "azurerm_subnet", "azurerm_virtual_network_gateway", "azurerm_firewall"


output "test_one_app_service_output" {
  value = module.test_one
}

output "test_one_app_service" {
  value = module.test_one.instances["01"].names["azurerm_app_service"]
}

output "test_one_storage_account" {
  value = module.test_one.special_instances["01"].names["azurerm_storage_account"]
}

output "test_one_subnet" {
  value = module.test_one.instances["01"].names["azurerm_subnet"]
}

output "test_one_virtual_network" {
  value = module.test_one.instances["03"].names["azurerm_virtual_network"]
}

output "test_one_rg" {
  value = module.test_one.instances["01"].names["azurerm_resource_group"]
}

/* Test two outputs **/
# output "test_two_app_service" {
#   value = module.test_two.instances["02"].names["azurerm_app_service"]
# }

# output "test_two_storage_account" {
#   value = module.test_two.special_instances["02"].names["azurerm_storage_account"]
# }

# output "test_two_virtual_network" {
#   value = module.test_two.instances["02"].names["azurerm_virtual_network"]
# }

# output "test_two_subnet" {
#   value = module.test_two.instances["02"].names["azurerm_subnet"]
# }

# /* Test two random outputs **/
output "test_two_random_app_service_output" {
  value = module.test_two_random
}

output "test_two_random_app_service" {
  value = module.test_two_random.instances["02"].names["azurerm_app_service"]
}

output "test_two_random_storage_account" {
  value = module.test_two_random.special_instances["02"].names["azurerm_storage_account"]
}

output "test_two_random_rg" {
  value = module.test_two_random.instances["02"].names["azurerm_resource_group"]
}

output "test_two_random_virtual_network" {
  value = module.test_two_random.instances["02"].names["azurerm_virtual_network"]
}

# output "test_three_rg" {
#   value = module.test_three.instances["01"].names["azurerm_resource_group"]
# }
