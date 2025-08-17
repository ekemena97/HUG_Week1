terraform {
  cloud {
    organization = "ekems-hug"

    workspaces {
      name = "HUG_Week1"
    }
  }

  required_providers {
    netlify = {
      source  = "netlify/netlify"
      version = "~> 0.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}
