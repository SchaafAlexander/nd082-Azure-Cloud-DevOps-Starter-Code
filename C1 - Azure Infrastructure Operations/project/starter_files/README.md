# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, I will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone the starter repository

2. Create infrastructure as code

3. Update the README to reflect how someone can use my code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions

### Add Policy
1. Write policy
2. Add Policy
3. Assign Policy

### Packer
1. Create a Packer Resource Group (Windows Server)
2. Adapt the server.json file provided, following the task list
3. Open the Powershell on Packer VM and enter the env variables accordingly
4. Install via Powershell: packer plugins install github.com/hashicorp/azure
5. Run "packer build server.json"

### Terraform
1. Create a Terraform Resource Group (Windows Server)
2. Create main.tf
3. Create vars.tf. Here you can specifiy variables. Like region, resource group name and number of VM's.
4. Install Azure CLI
5. Terraform init
6. Terraform plan -out solution.plan
7. Terraform apply "solution.plan"
8. Terraform destroy

### Output

This is the terraform output plan:
```
An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_availability_set.udacity will be created
  + resource "azurerm_availability_set" "udacity" {
      + id                           = (known after apply)
      + location                     = "eastus"
      + managed                      = true
      + name                         = "udacity-availability-set"
      + platform_fault_domain_count  = 2
      + platform_update_domain_count = 2
      + resource_group_name          = "Azuredevops"
    }

  # azurerm_lb.udacity will be created
  + resource "azurerm_lb" "udacity" {
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-lb"
      + private_ip_address   = (known after apply)
      + private_ip_addresses = (known after apply)
      + resource_group_name  = "Azuredevops"
      + sku                  = "Basic"

      + frontend_ip_configuration {
          + id                            = (known after apply)
          + inbound_nat_rules             = (known after apply)
          + load_balancer_rules           = (known after apply)
          + name                          = "udacity-frontend"
          + outbound_rules                = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = (known after apply)
          + private_ip_address_version    = "IPv4"
          + public_ip_address_id          = (known after apply)
          + public_ip_prefix_id           = (known after apply)
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_lb_backend_address_pool.udacity will be created
  + resource "azurerm_lb_backend_address_pool" "udacity" {
      + backend_ip_configurations = (known after apply)
      + id                        = (known after apply)
      + load_balancing_rules      = (known after apply)
      + loadbalancer_id           = (known after apply)
      + name                      = "udacity-backend-pool"
      + outbound_rules            = (known after apply)
      + resource_group_name       = "Azuredevops"
    }

  # azurerm_linux_virtual_machine.udacity[0] will be created
  + resource "azurerm_linux_virtual_machine" "udacity" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "adminuser"
      + allow_extension_operations      = true
      + availability_set_id             = (known after apply)
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "udacity-vm-0"
      + network_interface_ids           = (known after apply)
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "Azuredevops"
      + size                            = "Standard_B2s"
      + source_image_id                 = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
      + tags                            = {
          + "Environment"  = "Production"
          + "Project-name" = "WebServer"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }
    }

  # azurerm_linux_virtual_machine.udacity[1] will be created
  + resource "azurerm_linux_virtual_machine" "udacity" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "adminuser"
      + allow_extension_operations      = true
      + availability_set_id             = (known after apply)
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "udacity-vm-1"
      + network_interface_ids           = (known after apply)
      + platform_fault_domain           = -1
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "Azuredevops"
      + size                            = "Standard_B2s"
      + source_image_id                 = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
      + tags                            = {
          + "Environment"  = "Production"
          + "Project-name" = "WebServer"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = (known after apply)
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }
    }

  # azurerm_network_interface.udacity[0] will be created
  + resource "azurerm_network_interface" "udacity" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-vm-nic-0"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "Azuredevops"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "internal"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_interface.udacity[1] will be created
  + resource "azurerm_network_interface" "udacity" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-vm-nic-1"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "Azuredevops"
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "internal"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_security_group.udacity will be created
  + resource "azurerm_network_security_group" "udacity" {
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "udacity-nsg"
      + resource_group_name = "Azuredevops"
      + security_rule       = [
          + {
              + access                                     = "Allow"
              + description                                = ""
              + destination_address_prefix                 = "10.0.1.0/24"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "allow-internal"
              + priority                                   = 100
              + protocol                                   = "*"
              + source_address_prefix                      = "10.0.1.0/24"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
          + {
              + access                                     = "Deny"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "deny-external"
              + priority                                   = 200
              + protocol                                   = "*"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
    }

  # azurerm_public_ip.udacity will be created
  + resource "azurerm_public_ip" "udacity" {
      + allocation_method       = "Dynamic"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "udacity-pip"
      + resource_group_name     = "Azuredevops"
      + sku                     = "Basic"
    }

  # azurerm_subnet.udacity will be created
  + resource "azurerm_subnet" "udacity" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.0.1.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "udacity-subnet"
      + resource_group_name                            = "Azuredevops"
      + virtual_network_name                           = "udacity-vnet"
    }

  # azurerm_virtual_network.udacity will be created
  + resource "azurerm_virtual_network" "udacity" {
      + address_space         = [
          + "10.0.0.0/16",
        ]
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "eastus"
      + name                  = "udacity-vnet"
      + resource_group_name   = "Azuredevops"
      + subnet                = (known after apply)
      + vm_protection_enabled = false
    }

Plan: 11 to add, 0 to change, 0 to destroy.

Warning: "resource_group_name": [DEPRECATED] This field is no longer used and will be removed in the next major version of the Azure Provider

  on main.tf line 77, in resource "azurerm_lb_backend_address_pool" "udacity":
  77: resource "azurerm_lb_backend_address_pool" "udacity" {



------------------------------------------------------------------------

This plan was saved to: solution.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "solution.plan"

PS C:\Users\terraform\Desktop> Terraform apply "solution.plan"
azurerm_virtual_network.udacity: Creating...
azurerm_availability_set.udacity: Creating...
azurerm_public_ip.udacity: Creating...
azurerm_network_security_group.udacity: Creating...
azurerm_availability_set.udacity: Creation complete after 1s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/availabilitySets/udacity-availability-set]
azurerm_public_ip.udacity: Creation complete after 2s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/publicIPAddresses/udacity-pip]
azurerm_lb.udacity: Creating...
azurerm_network_security_group.udacity: Creation complete after 2s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/networkSecurityGroups/udacity-nsg]
azurerm_lb.udacity: Creation complete after 1s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/loadBalancers/udacity-lb]
azurerm_lb_backend_address_pool.udacity: Creating...
azurerm_virtual_network.udacity: Creation complete after 4s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/virtualNetworks/udacity-vnet]
azurerm_subnet.udacity: Creating...
azurerm_lb_backend_address_pool.udacity: Creation complete after 2s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/loadBalancers/udacity-lb/backendAddressPools/udacity-backend-pool]
azurerm_subnet.udacity: Creation complete after 4s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/virtualNetworks/udacity-vnet/subnets/udacity-subnet]
azurerm_network_interface.udacity[0]: Creating...
azurerm_network_interface.udacity[1]: Creating...
azurerm_network_interface.udacity[1]: Creation complete after 1s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/networkInterfaces/udacity-vm-nic-1]
azurerm_network_interface.udacity[0]: Creation complete after 2s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/networkInterfaces/udacity-vm-nic-0]
azurerm_linux_virtual_machine.udacity[1]: Creating...
azurerm_linux_virtual_machine.udacity[0]: Creating...
azurerm_linux_virtual_machine.udacity[0]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.udacity[1]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.udacity[0]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.udacity[1]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.udacity[1]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.udacity[0]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.udacity[1]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.udacity[0]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.udacity[0]: Creation complete after 46s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/virtualMachines/udacity-vm-0]
azurerm_linux_virtual_machine.udacity[1]: Creation complete after 46s [id=/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/virtualMachines/udacity-vm-1]

Apply complete! Resources: 11 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
PS C:\Users\terraform\Desktop>
```