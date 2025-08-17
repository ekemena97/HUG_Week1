terraform {
  cloud {
    organization = "my-org" # your HCP Terraform org

    workspaces {
      name = "netlify-site"
    }
  }

  required_providers {
    netlify = {
      source  = "netlify/netlify"
      version = "~> 0.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "netlify" {
  token = var.Terrafrom
}

variable "Terrafrom" {
  type      = string
  sensitive = true
}

# Random suffix for unique site name
resource "random_pet" "suffix" {}

# Deploy static site (assumes ./site folder exists)
resource "netlify_site" "example" {
  name = "my-static-site-${random_pet.suffix.id}"

  deploy {
    dir = "${path.module}/site"
  }
}

output "live_url" {
  value = netlify_site.example.ssl_url
}
