provider "azuread" {
  tenant_id = "274cc2da-6649-4524-b4fe-1ff1e0ec0f9a"
}

data "azuread_application_template" "example" {
  display_name = "Marketo"
}

resource "azuread_application" "example" {
  display_name = "example"
  template_id  = data.azuread_application_template.example.template_id
}

resource "azuread_service_principal" "example" {
  client_id    = azuread_application.example.client_id
  use_existing = true
}
