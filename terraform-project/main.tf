module "vault_setup" {
  source = "../vault-module"   # path to vault-module
}

output "dev_namespace_token" {
  value     = module.vault_setup.token
  sensitive = true
}
