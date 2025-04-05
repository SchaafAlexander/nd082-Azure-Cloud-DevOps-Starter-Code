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
  ~ update in-place
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # azurerm_lb.udacity will be updated in-place
  ~ resource "azurerm_lb" "udacity" {
        id                   = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/loadBalancers/udacity-lb"
        location             = "eastus"
        name                 = "udacity-lb"
        private_ip_addresses = []
        resource_group_name  = "Azuredevops"
        sku                  = "Basic"
        tags                 = {}

      ~ frontend_ip_configuration {
            id                            = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/loadBalancers/udacity-lb/frontendIPConfigurations/udacity-frontend"
            inbound_nat_rules             = []
            load_balancer_rules           = []
            name                          = "udacity-frontend"
            outbound_rules                = []
            private_ip_address_allocation = "Dynamic"
          + private_ip_address_version    = "IPv4"
            public_ip_address_id          = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/publicIPAddresses/udacity-pip"
            zones                         = []
        }
    }

  # azurerm_linux_virtual_machine.udacity[0] will be updated in-place
  ~ resource "azurerm_linux_virtual_machine" "udacity" {
        admin_password                  = (sensitive value)
        admin_username                  = "adminuser"
        allow_extension_operations      = true
        availability_set_id             = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/availabilitySets/UDACITY-AVAILABILITY-SET"
        computer_name                   = "udacity-vm-0"
        disable_password_authentication = false
        encryption_at_host_enabled      = false
        extensions_time_budget          = "PT1H30M"
        id                              = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/virtualMachines/udacity-vm-0"
        location                        = "eastus"
        max_bid_price                   = -1
        name                            = "udacity-vm-0"
      ~ network_interface_ids           = [
          - "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/networkInterfaces/udacity-nic",
        ] -> (known after apply)
        platform_fault_domain           = -1
        priority                        = "Regular"
        private_ip_address              = "10.0.1.4"
        private_ip_addresses            = [
            "10.0.1.4",
        ]
        provision_vm_agent              = true
        public_ip_addresses             = []
        resource_group_name             = "Azuredevops"
        size                            = "Standard_B2s"
        source_image_id                 = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
        tags                            = {
            "Environment"  = "Production"
            "Project-name" = "WebServer"
        }
        virtual_machine_id              = "b313131e-81e9-4f62-99e0-4a27f9326668"

        os_disk {
            caching                   = "ReadWrite"
            disk_size_gb              = 30
            name                      = "udacity-vm-0_disk1_c88788f0e98c4048a07a021772ae1982"
            storage_account_type      = "Standard_LRS"
            write_accelerator_enabled = false
        }
    }

  # azurerm_linux_virtual_machine.udacity[1] will be created
  + resource "azurerm_linux_virtual_machine" "udacity" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "adminuser"
      + allow_extension_operations      = true
      + availability_set_id             = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/availabilitySets/udacity-availability-set"
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

  # azurerm_network_interface.udacity[0] must be replaced
-/+ resource "azurerm_network_interface" "udacity" {
      ~ applied_dns_servers           = [] -> (known after apply)
      ~ dns_servers                   = [] -> (known after apply)
        enable_accelerated_networking = false
        enable_ip_forwarding          = false
      ~ id                            = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/networkInterfaces/udacity-nic" -> (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
        location                      = "eastus"
      ~ mac_address                   = "00-0D-3A-99-B4-60" -> (known after apply)
      ~ name                          = "udacity-nic" -> "udacity-vm-0-nic" # forces replacement
      ~ private_ip_address            = "10.0.1.4" -> (known after apply)
      ~ private_ip_addresses          = [
          - "10.0.1.4",
        ] -> (known after apply)
        resource_group_name           = "Azuredevops"
      - tags                          = {} -> null
      ~ virtual_machine_id            = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/virtualMachines/udacity-vm-0" -> (known after apply)

      ~ ip_configuration {
            name                          = "internal"
          ~ primary                       = true -> (known after apply)
          ~ private_ip_address            = "10.0.1.4" -> (known after apply)
          ~ private_ip_address_allocation = "Dynamic" -> "dynamic"
            private_ip_address_version    = "IPv4"
            subnet_id                     = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/virtualNetworks/udacity-vnet/subnets/udacity-subnet"
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
      + name                          = "udacity-vm-1-nic"
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
          + subnet_id                     = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Network/virtualNetworks/udacity-vnet/subnets/udacity-subnet"
        }
    }
```