provider "azurerm" {
  features {}
}

# Use existing Resource Group from Udacity
data "azurerm_resource_group" "existing" {
  name      = "Azuredevops"
}


# Create Virtual Network and Subnet
resource "azurerm_virtual_network" "udacity" {
  name                = "udacity-vnet"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.existing.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "udacity" {
  name                 = "udacity-subnet"
  resource_group_name  = data.azurerm_resource_group.existing.name
  virtual_network_name = azurerm_virtual_network.udacity.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Network Security Group
resource "azurerm_network_security_group" "udacity" {
  name                = "udacity-nsg"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.existing.name

  security_rule {
    name                       = "allow-internal"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "10.0.1.0/24"
  }

  security_rule {
    name                       = "deny-external"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create Public IP
resource "azurerm_public_ip" "udacity" {
  name                = "udacity-pip"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.existing.name
  allocation_method   = "Dynamic"
}

# Create Load Balancer
resource "azurerm_lb" "udacity" {
  name                = "udacity-lb"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.existing.name

  frontend_ip_configuration {
    name                 = "udacity-frontend"
    public_ip_address_id = azurerm_public_ip.udacity.id
  }
}

resource "azurerm_lb_backend_address_pool" "udacity" {
  name                = "udacity-backend-pool"
  loadbalancer_id     = azurerm_lb.udacity.id
  resource_group_name = data.azurerm_resource_group.existing.name
}

# Create Virtual Machine Availability Set
resource "azurerm_availability_set" "udacity" {
  name                         = "udacity-availability-set"
  location                     = var.location
  resource_group_name          = data.azurerm_resource_group.existing.name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  managed                      = true
}

# Create Network Interface
resource "azurerm_network_interface" "udacity" {
  count               = var.vm_count
  name                = "udacity-vm-nic-${count.index}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.existing.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.udacity.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create Virtual Machines
resource "azurerm_linux_virtual_machine" "udacity" {
  count               = var.vm_count
  name                = "udacity-vm-${count.index}"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.existing.name
  size                = "Standard_B2s"
  availability_set_id = azurerm_availability_set.udacity.id

  admin_username = "adminuser"
  admin_password = "P@ssw0rdIsStr0ng1234!"

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.udacity[count.index].id
  ]
   

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    Environment = "Production",
    Project-name = "WebServer"
  }

  source_image_id = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
}
