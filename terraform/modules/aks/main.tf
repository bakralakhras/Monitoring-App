
resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = "k8swithacr"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D4ds_v4"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Testing"
  }
}

