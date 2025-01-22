terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.16.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "e9827085-0e2e-48c8-bccc-2cbf6f9b0226"
  features {
  }
}

module "resource" {
  source   = "./modules/resource_group"
  name     = var.name
  location = var.location
}

module "containerregistry" {
  source = "./modules/acr"
  # source             = "Azure/avm-containerregistry-registry/azurerm"
  name                     = var.acr_name
  resource_group_location  = module.resource.location
  resource_group_name      = module.resource.name
  sku                      = var.sku
}

module "kubernetes_cluster" {
  source                = "./modules/aks"
  name                  = var.aks_name
  resource_group_name   = module.resource.name
  resource_group_location = module.resource.location
  acr_id=module.containerregistry.acr_id
}

module "acrconnectaks" {
    source= "./modules/role_assignment"
    principal_id = module.kubernetes_cluster.object_id
    acr_id = module.containerregistry.acr_id

}
