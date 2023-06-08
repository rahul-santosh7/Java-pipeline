terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.51.0"
    }
  }
}


terraform {
 backend "azurerm" {

resource_group_name= "newresource123"
storage_account_name= "statefile67"
container_name = "rahul"
key= "terraform.tfstate"
 }
}

provider "azurerm" {
  tenant_id = "0c45565b-c823-4469-9b6b-30989afb7a2e"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
   }
  }

}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East Us"
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "my-aks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}


resource "azurerm_kubernetes_cluster" "example" {
  name                = "tesdtingname12"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "tesdtingname12"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
    #temporary_name_for_rotation = "updatedvm"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"

    dns_service_ip      = "10.0.0.10"
    service_cidr        = "10.0.0.0/16"
    load_balancer_sku   = "standard"
    outbound_type       = "loadBalancer"

  }


}
resource "azurerm_kubernetes_cluster_node_pool" "example" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.example.id
  vm_size               = "Standard_B2s"
  node_count            = 1

  tags = {
    Environment = "Production"
  }
}


