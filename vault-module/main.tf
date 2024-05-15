provider "vault" {
  # Ensure you configure the provider with appropriate authentication
  # and address pointing to your Vault instance.
}

resource "vault_namespace" "vault-namespace" {
  path = "vault-namespace"
}

resource "vault_mount" "kv" {
  path        = "secret"
  type        = "kv-v2"
  namespace   = vault_namespace.vault-namespace.path
  description = "KV store for development environments"
}

resource "vault_policy" "dev_secrets_policy" {
  name      = "dev-secrets-policy"
  namespace = vault_namespace.example.path

  policy = <<-EOT
  path "secret/data/dev/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
  }

  path "secret/data/aws/dev/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
  }

  path "secret/data/azure/dev/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
  }
  EOT
}

resource "vault_token_auth_backend_role" "dev_role" {
  role_name = "dev_role"
  namespace   = vault_namespace.example.path
  token_policies = [vault_policy.dev_secrets_policy.name]
}

resource "vault_token_auth_backend_role_secret_id" "dev_role_secret" {
  backend   = vault_token_auth_backend_role.dev_role.backend
  role_name = vault_token_auth_backend_role.dev_role.name
  namespace = vault_namespace.example.path
}
