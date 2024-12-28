module "eks" {
  source                                   = "../../modules/aws/eks-cluster"
  cluster_name                             = var.cluster_name
  cluster_version                          = var.cluster_version
  vpc_id                                   = var.vpc_id
  subnet_ids                               = [var.asiayo_eks_private_subnet_a, var.asiayo_eks_private_subnet_b, var.asiayo_eks_private_subnet_c]
  control_plane_subnet_ids                 = [var.asiayo_eks_public_subnet_a, var.asiayo_eks_public_subnet_b, var.asiayo_eks_public_subnet_c]
  cluster_endpoint_public_access           = var.cluster_endpoint_public_access
  cluster_endpoint_private_access          = var.cluster_endpoint_private_access
  cluster_endpoint_public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
  enable_irsa                              = var.enable_irsa
  create_cloudwatch_log_group              = var.create_cloudwatch_log_group
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions
  eks_managed_node_groups                  = var.eks_managed_node_groups
  cluster_addons = {
    kube-proxy = {
      most_recent = true
    }
    eks-pod-identity-agent = {
      most_recent = true
    }
    vpc-cni = {
      most_recent              = true
      berfore_compute          = true
      service_account_role_arn = module.vpc_cni_irsa.iam_role_arn
    }
    coredns = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent              = true
      service_account_role_arn = module.ebs_csi_irsa.iam_role_arn
    }
  }
}

