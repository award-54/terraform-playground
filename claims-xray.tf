resource "azuread_application" "claimsxray" {
  display_name = "ClaimsXray"
  identifier_uris = ["urn:microsoft:adfs:claimsxray"]
  web {
    redirect_uris = ["https://adfshelp.microsoft.com/ClaimsXray/TokenResponse"]
  }
}

resource "azuread_service_principal" "claimsxray" {
  application_id               = azuread_application.claimsxray.application_id
  
  app_role_assignment_required = false
  preferred_single_sign_on_mode = "saml"

  feature_tags {
    enterprise = true
    gallery = false
    custom_single_sign_on = true
  }
}

resource "azuread_service_principal_token_signing_certificate" "claimsxray" {
  service_principal_id = azuread_service_principal.claimsxray.id
}

resource "azuread_service_principal_claims_mapping_policy_assignment" "claimsxray_app_policy" {
  claims_mapping_policy_id = azuread_claims_mapping_policy.default_claims_policy.id
  service_principal_id     = azuread_service_principal.claimsxray.id
}