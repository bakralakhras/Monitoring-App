

## Connect ACRPULL TO AKS
resource "azurerm_role_assignment" "connect" {
  principal_id                     = var.principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}