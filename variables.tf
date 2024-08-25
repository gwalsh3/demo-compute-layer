variable "tfe_organization" {
  description = "The name of the Terraform Cloud organization."
  type        = string
}

variable "tfe_workspace" {
  default     = "demo-network-layer"
  description = "The name of the workspace for the network layer."
  type        = string
}
