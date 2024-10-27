provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "acme-ecommerce-rg"
  location = "West Europe"
}
resource "azurerm_app_service_plan" "asp" {
  name                = "acme-ecommerce-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "frontend_api" {
  name                = "acme-frontend-api"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  site_config {
    dotnet_framework_version = "v7.0"
  }
}
resource "azurerm_app_service" "middleware_api" {
  name                = "acme-middleware-api"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  site_config {
    dotnet_framework_version = "v7.0"
  }
}
resource "azurerm_sql_server" "sqlserver" {
  name                         = "acmesqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "your-password-here"
}

resource "azurerm_sql_database" "sqldb" {
  name                = "acme-ecommerce-db"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "Standard"
  requested_service_objective_name = "S1"
}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "acme-sql-private-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.my_subnet.id
  private_service_connection {
    name                           = "acme-sql-priv-connection"
    private_connection_resource_id = azurerm_sql_server.sqlserver.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
resource "azurerm_sql_server" "sqlserver" {
  name                         = "acmesqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "your-password-here"
}

resource "azurerm_sql_database" "sqldb" {
  name                = "acme-ecommerce-db"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "Standard"
  requested_service_objective_name = "S1"
}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "acme-sql-private-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.my_subnet.id
  private_service_connection {
    name                           = "acme-sql-priv-connection"
    private_connection_resource_id = azurerm_sql_server.sqlserver.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
resource "azurerm_sql_server" "sqlserver" {
  name                         = "acmesqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "your-password-here"
}

resource "azurerm_sql_database" "sqldb" {
  name                = "acme-ecommerce-db"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "Standard"
  requested_service_objective_name = "S1"
}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "acme-sql-private-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.my_subnet.id
  private_service_connection {
    name                           = "acme-sql-priv-connection"
    private_connection_resource_id = azurerm_sql_server.sqlserver.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
resource "azurerm_sql_server" "sqlserver" {
  name                         = "acmesqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "your-password-here"
}

resource "azurerm_sql_database" "sqldb" {
  name                = "acme-ecommerce-db"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name
  edition             = "Standard"
  requested_service_objective_name = "S1"
}

resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "acme-sql-private-endpoint"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.my_subnet.id
  private_service_connection {
    name                           = "acme-sql-priv-connection"
    private_connection_resource_id = azurerm_sql_server.sqlserver.id
    is_manual_connection           = false
    subresource_names              = ["sqlServer"]
  }
}
resource "azurerm_app_service_slot" "staging_slot" {
  name                 = "staging"
  app_service_name     = azurerm_app_service.middleware_api.name
  resource_group_name  = azurerm_resource_group.rg.name
}
