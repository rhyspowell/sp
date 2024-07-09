resource "azuread_application" "example" {
  display_name = var.sp_app_name
  owners       = [data.azurerm_client_config.current.object_id]
}

resource "azuread_service_principal" "example" {
  client_id = azuread_application.example.client_id
  owners    = [data.azurerm_client_config.current.object_id]
}

resource "azuread_service_principal_password" "example" {
  service_principal_id = azuread_service_principal.example.object_id
}
