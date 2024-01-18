variable "resource_types" {
  type        = list(string)
  description = "A list of resource type(s) that should be generated (output) using the same settings. Pick from this list: https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name#resource-types"
}

variable "name_components" {
  type        = list(string)
  description = "The components of the names.  Each compoent will be replaced with a value from one of the variables.  See the readme for further details.  The default value aligns with SRS naming conventions."
  default     = ["ResourceType", "ProjAppSvc", "Environment", "Location", "Instance"]
}

variable "environment" {
  type        = string
  description = "The value to replace the 'Environment' name components with.  Acceptable locations are con, idt, mgt, prd, tst, dev, shd."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The value to replace the 'Location' name components with.  Acceptable locations are scus, ncus, and glb."
  default     = "scus"

  validation {
    condition     = contains(["scus", "ncus", "glb"], var.location)
    error_message = "Acceptable locations are scus, ncus, and glb."
  }
}

variable "appname" {
  type        = string
  description = "The value to use as the application or workload name.  Replaces the 'ProjAppSvc' name component."
}

variable "organization" {
  type        = string
  description = "The value to replace the 'Org' name components with."
  default     = "srs"
}

variable "instances" {
  type        = list(string)
  description = "The values to replace the 'Instance' name components with."
  default     = ["01"]
}

variable "enable_random_name_component" {
  type        = bool
  description = "Add a random name component."
  default     = false
}