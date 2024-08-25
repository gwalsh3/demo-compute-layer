# demo-compute-layer
1. Create a repository in GitHub called `demo-compute-layer`.
2. Initialize the local directory, add the contents, and commit the changes.
   - `git init`
   - `git add .`
   - `git commit -m "Initial commit"`
3. Add the remote repository
   - `git remote add origin <url>`
4. Push the changes to the remote repository
   - `git push origin main`
5. Create a project in your TFC organization called `session-07`.
6. Create a workspace in the project called `demo-compute-layer`.
   - Add the new repository as the VCS driven workflow
7. In your AWS Account, create an IAM Role that uses the `app.terraform.io` IDP:
   - organization: <Your TFC Orgnaization>
   - project: `session-07`
   - workspace: `demo-compute-layer`
   - run_phase: `*`
8. Copy the Role ARN
9. In your TFC workspace, create the following environment variables:
   - AWS_REGION: `us-east-1`
   - TFC_AWS_PROVIDER_AUTH: true
   - TFC_AWS_RUN_ROLE_ARN: <RoleArn>
10. In your TFC workspace, create the following Terraform variables:
   - tfe_organization: <Your TFC Organization>
   - tfe_workspace: `demo-network-layer`
11. In your `demo-network-layer` workspace, share the state with the `demo-compute-layer` workspace
12. Run your workspace
13. Inspect the results
14. When done with the compute workload, create a destroy plan and apply it

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | terraform-aws-modules/ec2-instance/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_availability_zones.ctx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.ctx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_default_tags.ctx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |
| [aws_region.ctx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [tfe_outputs.network](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/outputs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tfe_organization"></a> [tfe\_organization](#input\_tfe\_organization) | The name of the Terraform Cloud organization. | `string` | `"DustinDortch"` | no |
| <a name="input_tfe_workspace"></a> [tfe\_workspace](#input\_tfe\_workspace) | The name of the workspace for the network layer. | `string` | `"demo-network-layer"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->