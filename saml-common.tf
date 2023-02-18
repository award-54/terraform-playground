resource "azuread_claims_mapping_policy" "default_claims_policy" {
  definition = [
    jsonencode(
      {
        ClaimsMappingPolicy = {
          ClaimsSchema = [
            {
              ID            = "userprincipalname"
              JwtClaimType  = "name"
              SamlClaimType = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"
              Source        = "user"
            },
            {
              ID            = "userprincipalname"
              JwtClaimType  = "customClaim"
              SamlClaimType = "customClaim"
              Source        = "user"
            },
          ]
          IncludeBasicClaimSet = "true"
          Version              = 1
        }
      }
    ),
  ]
  display_name = "Default Claims"
}