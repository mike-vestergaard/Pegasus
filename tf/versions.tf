## INIT
### PROVIDER ###
# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "alexander.litholm@yh.nackademin.se"
  tenant_name = "nackademin-litholm"
  tenant_id   = "4dfc515c84d6491c8fc9ad28c400bbad" #detta ska 'nog' hemligt
  password    = "Password123"                      #detta ska 'nog' hemligt
  auth_url    = "https://ops.elastx.cloud:5000/v3"
  region      = "se-sto"
}
# Define required providers
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}
