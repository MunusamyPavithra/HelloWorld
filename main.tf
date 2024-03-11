provider "azurerm" {
  features = {}
}


resource "azurerm_resource_group" "rg1" {
  name     = "RG-01"
  location = "eastus2"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "your_app_service_plan_name"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  sku {
    tier = "your_sku_tier"   # e.g., "Basic", "Standard", "Premium"
    size = "your_sku_size"   # e.g., "B1", "S1", "P1"
  }
}

# Define Azure App Service
resource "azurerm_app_service" "example_app_service" {
  name                = "your_app_service_name"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  app_service_plan_id = azurerm_app_service_plan.example_app_service_plan.id

  site_config {
    # Configure other settings like app settings, connection strings, etc.
  }

  app_settings = {
    # Define any necessary app settings
    "KEY" = "VALUE"
  }

  connection_string {
    # Define connection strings if needed
    name  = "DatabaseConnectionString"
    type  = "SQLServer"
    value = "your_database_connection_string"
  }
}

