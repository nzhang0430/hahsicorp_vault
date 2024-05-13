terraform {
  backend "remote" {
    organization = "<YOUR_TF_CLOUD_ORG>"

    workspaces {
      name = "<YOUR_WORKSPACE_NAME>"
    }
  }
}

provider "vault" {
  address = "<VAULT_ADDRESS>"
  token   = "<YOUR_VAULT_TOKEN>"
}
