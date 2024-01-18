locals {
  #Some resource types are globally unique, and name collisions are common.  To make that less likely, a component has been added ("srs") to certain resource types.
  #To get the special component into the name, split the list into normal types, and special types

  #This is the list of types that will be split
  client_specific_resource_types = ["azurerm_storage_account"]

  #This is the normal list.  Remove the special ones.
  normal_list = setsubtract(var.resource_types, local.client_specific_resource_types)
}