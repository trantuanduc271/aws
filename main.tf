######################################################
##                Backend & Provider                ##
######################################################
terraform {
  backend "azurerm" {
    resource_group_name  = "resource_group_name"
    storage_account_name = "storage_account_name"
    container_name       = "container_name"
    key                  = "key"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

######################################################
##              Azure App Configuration             ##
######################################################
module "app_configuration" {
  source                                     = "./modules/app_configuration"
  location                                   = var.location
  name                                       = local.app_configuration_name
  resource_group_name                        = module.resource_group.name
  identity_ids                               = module.user_assigned_identity.user_assigned_identity_id
  private_dns_zone_virtual_network_link_name = local.virtual_network_name
  virtual_network_id                         = module.virtual_network.virtual_network_id
  custom_network_interface_name              = local.custom_network_interface_name_app_configuration
  private_dns_zone_group_name                = local.private_link_service_name
  private_endpoint_name                      = local.private_endpoint_name_app_configuration
  private_service_connection_name            = local.private_link_service_name
  subnet_id                                  = module.virtual_network.pep_subnet_id
  public_network_access                      = var.app_configuration_public_network_access
  environment                                = var.environment
  tags                                       = local.tags
}
