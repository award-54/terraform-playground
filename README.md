# terraform-playground
My effort to keep track of things I've figured out how to do in terraform that might not be obvious/easy to find other examples for - I am not *good* at terraform

# Getting Started

## Prerequisites

Before you can run the Terraform files provided, you need to have done a few things: 

 1. Install the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli) - there are other ways to handle authentication, this is just the easiest for testing at home.
 1. Have an AzureAD tenant, and a user account with permissions to create applications in the tenant.
 1. Install terraform

## Running the project

 1. Run `az login` to sign into your tenant
 1. Run `$env:TF_VAR_tenant_id=<your tenant id>; terraform plan` to view the changes terraform will make to your tenant
 1. Run `terraform apply` to make the changes

## What does it do? 

This project creates a few things in Azure: 

### claims-xray.tf

 1. An application registration called ClaimsXray, with the application identifier and redirect URLs set. 
 1. A service principal set to prefer SAML authentication, and to not require assignment in Azure
 1. A new signing certificate for that service principal (default settings)
 1. A mapping between the service principal and the default claims policy created in saml-common.tf

### saml-common.tf

Poorly named. 

 1. A claims policy that can be leveraged for applications that use either OIDC or SAML for authentication. Creates a custom claim and sets a standard claim value - reusable.



