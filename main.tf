terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.27.0"
    }
  }
}

provider "hcp" {
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  organization_id  = var.hcp_organization_id
}

resource "hcp_hvn" "main" {
  hvn_id         = "main-hvn"
  cloud_provider = "aws"
  region         = "us-west-2"
}

resource "hcp_vault_cluster" "vault_free" {
  hvn_id     = hcp_hvn.main.hvn_id
  cluster_id = "vault-free"
  tier       = "development"
}

output "vault_cluster_id" {
  value = hcp_vault_cluster.vault_free.cluster_id
}

output "vault_public_endpoint" {
  value = hcp_vault_cluster.vault_free.public_endpoint_url
}
