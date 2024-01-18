terraform {
  required_version = ">= 1.1"
  required_providers {
    azurecaf = {
      source = "aztfmod/azurecaf"
      //version = "2.0.0-preview3"
      version = "~> 1"
    }
  }
}