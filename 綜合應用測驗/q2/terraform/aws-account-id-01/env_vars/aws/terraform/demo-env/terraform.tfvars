################################################################################
# AWS EKS Cluster
################################################################################
cluster_name                             = "asiayo-demo-eks-cluster"
cluster_version                          = "1.31"
region                                   = "ap-southeast-1"
vpc_id                                   = "vpc-0xxxxxxxxxxxxxxxx"
asiayo_eks_private_subnet_a              = "subnet-0xxxxxxxxxxxxxxxx"
asiayo_eks_private_subnet_b              = "subnet-0xxxxxxxxxxxxxxxx"
asiayo_eks_private_subnet_c              = "subnet-0xxxxxxxxxxxxxxxx"
asiayo_eks_public_subnet_a               = "subnet-0xxxxxxxxxxxxxxxx"
asiayo_eks_public_subnet_b               = "subnet-0xxxxxxxxxxxxxxxx"
asiayo_eks_public_subnet_c               = "subnet-0xxxxxxxxxxxxxxxx"
cluster_endpoint_public_access           = true
cluster_endpoint_private_access          = true
enable_irsa                              = true
create_cloudwatch_log_group              = false
enable_cluster_creator_admin_permissions = true

eks_managed_node_groups = {
  general-1a-node-group = {
    min_size                   = 1
    max_size                   = 5
    desired_size               = 1
    disk_size                  = 100
    use_custom_launch_template = false
    instance_types             = ["c5.xlarge"] #4c/8g
    capacity_type              = "ON_DEMAND"
    labels = {
      dedicated = "api" # 用於 nodeSelector 或 affinity 配置
    }
    taints = [
      {
        key    = "dedicated"
        value  = "api"
        effect = "NoSchedule"
      }
    ]
  }
  general-1b-node-group = {
    min_size                   = 1
    max_size                   = 5
    desired_size               = 1
    disk_size                  = 100
    use_custom_launch_template = false
    instance_types             = ["c5.xlarge"]
    capacity_type              = "ON_DEMAND"
    labels = {
      dedicated = "api" # 用於 nodeSelector 或 affinity 配置
    }
    taints = [
      {
        key    = "dedicated"
        value  = "api"
        effect = "NoSchedule"
      }
    ]
  }
  general-1c-node-group = {
    min_size                   = 1
    max_size                   = 5
    desired_size               = 1
    disk_size                  = 100
    use_custom_launch_template = false
    instance_types             = ["c5.xlarge"]
    capacity_type              = "ON_DEMAND"
    labels = {
      dedicated = "api" # 用於 nodeSelector 或 affinity 配置
    }
    taints = [
      {
        key    = "dedicated"
        value  = "api"
        effect = "NoSchedule"
      }
    ]
  }
  database-1a-node-group = {
    min_size                   = 1
    max_size                   = 5
    desired_size               = 1
    disk_size                  = 100
    use_custom_launch_template = false
    instance_types             = ["r7i.2xlarge"] #8c/64g
    capacity_type              = "ON_DEMAND"
    labels = {
      dedicated = "mysql" # 用於 nodeSelector 或 affinity 配置
    }
    taints = [
      {
        key    = "dedicated"
        value  = "mysql"
        effect = "NoSchedule"
      }
    ]
  }
  database-1b-node-group = {
    min_size                   = 1
    max_size                   = 5
    desired_size               = 1
    disk_size                  = 100
    use_custom_launch_template = false
    instance_types             = ["r7i.2xlarge"]
    capacity_type              = "ON_DEMAND"
    labels = {
      dedicated = "mysql" # 用於 nodeSelector 或 affinity 配置
    }
    taints = [
      {
        key    = "dedicated"
        value  = "mysql"
        effect = "NoSchedule"
      }
    ]
  }
}

cluster_endpoint_public_access_cidrs = [
  "1.2.3.4/32",
  "2.3.4.5/32",
]

################################################################################
# AWS ADDONS
################################################################################
addons = {
  enable_aws_load_balancer_controller = true
}

################################################################################
# Auth
################################################################################
aws_auth_users = [
  {
    userarn  = "arn:aws:iam::xxxxxxxxxxxx:user/asiayo-user1"
    username = "Role-asiayo-DevOps"
    groups   = ["system:masters", "system:bootstrappers", "system:nodes"]
  }
  # 如果需要添加更多用户，按照類似格式添加
  # {
  #   userarn  = "arn:aws:iam::xxxxxxxxxxxx:user/another-user"
  #   username = "Another-Username"
  #   groups   = ["system:masters", "system:bootstrappers", "system:nodes"]
  # }
]
