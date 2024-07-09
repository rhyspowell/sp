terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.111.0"
    }
  }
}

provider "azuread" {
  tenant_id = "64dc69e4-d083-49fc-9569-ebece1dd1408"
}
