terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  cloud {
    organization = "marcalfa1"
    workspaces {
      name = "terra-house-1"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_e30m3_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.e30m3.public_path
  content_version = var.e30m3.content_version
}

resource "terratowns_home" "home" {
  name = "BMW E30 M3"
  description = <<DESCRIPTION
BMW E30 M3 is an iconic high-performance version of the BMW 3 Series, 
produced by BMW's in-house motorsport division, 
BMW M. Manufactured between 1986 and 1991, 
the E30 M3 is celebrated as one of the finest drivers' cars ever made and has a rich motorsport heritage.
DESCRIPTION
  domain_name = module.home_e30m3_hosting.domain_name
  town = "missingo"
  content_version = var.e30m3.content_version
}

module "home_e36m3_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.e36m3.public_path
  content_version = var.e36m3.content_version
}

resource "terratowns_home" "home_e36m3" {
 name = "BMW E36 M3"
  description = <<DESCRIPTION
BMW E30 M3 is an iconic high-performance version of the BMW 3 Series, 
produced by BMW's in-house motorsport division, 
BMW M. Manufactured between 1986 and 1991, 
the E30 M3 is celebrated as one of the finest drivers' cars ever made and has a rich motorsport heritage.
DESCRIPTION
  domain_name = module.home_e36m3_hosting.domain_name
  town = "missingo"
  content_version = var.e36m3.content_version
}