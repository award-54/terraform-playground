# Configure Terraform
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.33.0"
    }
  }
}

variable "tenant_id" {}

# Configure the Azure Active Directory Provider
provider "azuread" {
  tenant_id = var.tenant_id
}

data "azuread_domains" "domain" {
  only_initial = true
}