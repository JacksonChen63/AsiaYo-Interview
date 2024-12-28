################################################################################
# AWS Application Load Balancer Controller IAM Policy and Roles
################################################################################

module "aws_load_balancer_controller_irsa_role" {
  count                                  = local.aws_addons.enable_aws_load_balancer_controller ? 1 : 0
  source                                 = "../../modules/aws/iam-role-for-service-accounts-eks"
  role_name                              = "${var.cluster_name}-lb-controller"
  attach_load_balancer_controller_policy = true
  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }
}

################################################################################
# AWS VPC CNI IRSA
################################################################################

module "vpc_cni_irsa" {
  source = "../../modules/aws/iam-role-for-service-accounts-eks"

  role_name             = "${var.cluster_name}-vpc-cni-irsa"
  attach_vpc_cni_policy = true
  vpc_cni_enable_ipv4   = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-node"]
    }
  }
}

################################################################################
# AWS EBS CSI IRSA
################################################################################

module "ebs_csi_irsa" {
  source = "../../modules/aws/iam-role-for-service-accounts-eks"

  role_name             = "${var.cluster_name}-ebs-csi-irsa"
  attach_ebs_csi_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:ebs-csi-controller-sa"]
    }
  }
}
