# Primary Task
•	Use Terraform language primarily. You may use additional languages that you are comfortable with for scripts or helpers as needed.
•	Provision all infrastructure and configuration for Vault using the free tier of HashiCorp Cloud Terraform (TFC).
•	Leverage TFC Workspace that are VCS driven.
•	Use the HashiCorp Cloud Platform (HCP) Terraform Provider to create a HashiCorp Cloud Vault Cluster on the Free tier.

Onboarding Module (Required)
•	Create a Terraform module that accomplishes the following:
•	Sets up a namespace,
•	Sets up Static K/V mount,
•	Generates a set of static credentials (username/password) for access to the namespace.
•	The credentials should allow read/write access to secrets at /secret/data/dev, /secret/data/aws/dev, and /secret/data/azure/dev but should not allow access to other areas of the namespace.

•	Call this module in a Terraform project deployed using Terraform Cloud.
