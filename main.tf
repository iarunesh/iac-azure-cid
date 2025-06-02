provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "this" {
  name                = "${var.app_name}-plan"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "this" {
  name                = var.app_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  service_plan_id     = azurerm_service_plan.this.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }
}

resource "azurerm_app_service_source_control" "github_actions" {
  app_id                  = azurerm_linux_web_app.this.id
  repo_url                = var.github_repo_url
  branch                  = var.github_branch
  use_manual_integration  = false
  use_mercurial           = false
  github_action_configuration {
    generate_workflow_file = true
  }
}
