# Variables for Configuration of the amount of VMs
variable "vm_count" {
  description = "Number of virtual machines to create"
  default     = 2
}

variable "location" {
  description = "Azure Region for all resources"
  default     = "East US"
  type        = string
}