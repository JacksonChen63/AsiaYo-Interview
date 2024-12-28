module "eks-auth" {
  source                    = "terraform-aws-modules/eks/aws//modules/aws-auth"
  version                   = "~> 20.0"
  create_aws_auth_configmap = false
  aws_auth_users            = var.aws_auth_users
  aws_auth_roles            = var.aws_auth_roles
}
