# IAM Role for Service Accounts in EKS

Releases: v5.39.1
ref: https://github.com/terraform-aws-modules/terraform-aws-iam/tree/v5.39.1

Configuration in this directory creates IAM roles that can be assumed by multiple EKS `ServiceAccount`s for various tasks.

# Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name                                                                     | Version |
| ------------------------------------------------------------------------ | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0  |
| <a name="requirement_aws"></a> [aws](#requirement_aws)                   | >= 4.0  |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 4.0  |

## Modules

| Name                                                                                                                                                                                                                 | Source                                                                   | Version  |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------ | -------- |
| <a name="module_amazon_managed_service_prometheus_irsa_role"></a> [amazon_managed_service_prometheus_irsa_role](#module_amazon_managed_service_prometheus_irsa_role)                                                 | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_appmesh_controller_irsa_role"></a> [appmesh_controller_irsa_role](#module_appmesh_controller_irsa_role)                                                                                              | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_appmesh_envoy_proxy_irsa_role"></a> [appmesh_envoy_proxy_irsa_role](#module_appmesh_envoy_proxy_irsa_role)                                                                                           | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_aws_gateway_controller_irsa_role"></a> [aws_gateway_controller_irsa_role](#module_aws_gateway_controller_irsa_role)                                                                                  | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_cert_manager_irsa_role"></a> [cert_manager_irsa_role](#module_cert_manager_irsa_role)                                                                                                                | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_cloudwatch_observability_irsa_role"></a> [cloudwatch_observability_irsa_role](#module_cloudwatch_observability_irsa_role)                                                                            | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_cluster_autoscaler_irsa_role"></a> [cluster_autoscaler_irsa_role](#module_cluster_autoscaler_irsa_role)                                                                                              | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_disabled"></a> [disabled](#module_disabled)                                                                                                                                                          | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_ebs_csi_irsa_role"></a> [ebs_csi_irsa_role](#module_ebs_csi_irsa_role)                                                                                                                               | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_efs_csi_irsa_role"></a> [efs_csi_irsa_role](#module_efs_csi_irsa_role)                                                                                                                               | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_eks"></a> [eks](#module_eks)                                                                                                                                                                         | terraform-aws-modules/eks/aws                                            | ~> 19.21 |
| <a name="module_external_dns_irsa_role"></a> [external_dns_irsa_role](#module_external_dns_irsa_role)                                                                                                                | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_external_secrets_irsa_role"></a> [external_secrets_irsa_role](#module_external_secrets_irsa_role)                                                                                                    | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_fsx_lustre_csi_irsa_role"></a> [fsx_lustre_csi_irsa_role](#module_fsx_lustre_csi_irsa_role)                                                                                                          | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_iam_eks_role"></a> [iam_eks_role](#module_iam_eks_role)                                                                                                                                              | terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks | n/a      |
| <a name="module_iam_policy"></a> [iam_policy](#module_iam_policy)                                                                                                                                                    | terraform-aws-modules/iam/aws//modules/iam-policy                        | n/a      |
| <a name="module_irsa_role"></a> [irsa_role](#module_irsa_role)                                                                                                                                                       | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_karpenter_controller_irsa_role"></a> [karpenter_controller_irsa_role](#module_karpenter_controller_irsa_role)                                                                                        | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_load_balancer_controller_irsa_role"></a> [load_balancer_controller_irsa_role](#module_load_balancer_controller_irsa_role)                                                                            | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_load_balancer_controller_targetgroup_binding_only_irsa_role"></a> [load_balancer_controller_targetgroup_binding_only_irsa_role](#module_load_balancer_controller_targetgroup_binding_only_irsa_role) | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_mountpoint_s3_csi_irsa_role"></a> [mountpoint_s3_csi_irsa_role](#module_mountpoint_s3_csi_irsa_role)                                                                                                 | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_node_termination_handler_irsa_role"></a> [node_termination_handler_irsa_role](#module_node_termination_handler_irsa_role)                                                                            | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_velero_irsa_role"></a> [velero_irsa_role](#module_velero_irsa_role)                                                                                                                                  | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_vpc"></a> [vpc](#module_vpc)                                                                                                                                                                         | terraform-aws-modules/vpc/aws                                            | ~> 5.0   |
| <a name="module_vpc_cni_ipv4_irsa_role"></a> [vpc_cni_ipv4_irsa_role](#module_vpc_cni_ipv4_irsa_role)                                                                                                                | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |
| <a name="module_vpc_cni_ipv6_irsa_role"></a> [vpc_cni_ipv6_irsa_role](#module_vpc_cni_ipv6_irsa_role)                                                                                                                | ../../modules/iam-role-for-service-accounts-eks                          | n/a      |

## Resources

| Name                                                                                                                                  | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_policy.additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                   | resource    |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

No inputs.

## Outputs

| Name                                                                                      | Description           |
| ----------------------------------------------------------------------------------------- | --------------------- |
| <a name="output_iam_role_arn"></a> [iam_role_arn](#output_iam_role_arn)                   | ARN of IAM role       |
| <a name="output_iam_role_name"></a> [iam_role_name](#output_iam_role_name)                | Name of IAM role      |
| <a name="output_iam_role_path"></a> [iam_role_path](#output_iam_role_path)                | Path of IAM role      |
| <a name="output_iam_role_unique_id"></a> [iam_role_unique_id](#output_iam_role_unique_id) | Unique ID of IAM role |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
