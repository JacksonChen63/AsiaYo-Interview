################################################################################
# AWS Load Balancer Controller
################################################################################

resource "helm_release" "alb-controller" {
  count           = local.aws_addons.enable_aws_load_balancer_controller ? 1 : 0
  name            = "aws-load-balancer-controller"
  repository      = "https://aws.github.io/eks-charts"
  chart           = "aws-load-balancer-controller"
  namespace       = "kube-system"
  version         = "1.7.1"
  wait            = true
  timeout         = 600
  wait_for_jobs   = true
  atomic          = true
  cleanup_on_fail = true

  set {
    name  = "replicaCount"
    value = 1
  }

  set {
    name  = "region"
    value = var.region
  }

  set {
    name  = "vpcId"
    value = var.vpc_id
  }

  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = module.aws_load_balancer_controller_irsa_role[0].iam_role_arn
  }

  set {
    name  = "clusterName"
    value = var.cluster_name
  }
}
