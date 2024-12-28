variable "vpc_id" {
  description = "The VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "asiayo_eks_private_subnet_a" {
  description = "Private subnet A for EKS worker nodes"
  type        = string
}

variable "asiayo_eks_private_subnet_b" {
  description = "Private subnet B for EKS worker nodes"
  type        = string
}

variable "asiayo_eks_private_subnet_c" {
  description = "Private subnet C for EKS worker nodes"
  type        = string
}

variable "asiayo_eks_public_subnet_a" {
  description = "Public subnet A for EKS control plane"
  type        = string
}

variable "asiayo_eks_public_subnet_b" {
  description = "Public subnet B for EKS control plane"
  type        = string
}

variable "asiayo_eks_public_subnet_c" {
  description = "Public subnet C for EKS control plane"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.27" # 可根據需求設置默認值
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "Whether the EKS cluster endpoint should be publicly accessible"
  type        = bool
  default     = false
}

variable "cluster_endpoint_private_access" {
  description = "Whether the EKS cluster endpoint should be privately accessible"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDR blocks allowed to access the EKS cluster endpoint publicly"
  type        = list(string)
  default     = ["0.0.0.0/0"] # 設為全網可訪問，根據需求修改
}

variable "enable_irsa" {
  description = "Enable IAM Roles for Service Accounts (IRSA)"
  type        = bool
  default     = true
}

variable "create_cloudwatch_log_group" {
  description = "Whether to create a CloudWatch log group for the EKS cluster"
  type        = bool
  default     = false
}

variable "enable_cluster_creator_admin_permissions" {
  description = "Whether to grant admin permissions to the cluster creator"
  type        = bool
  default     = true
}

variable "eks_managed_node_groups" {
  description = "Configuration for EKS managed node groups"
  type = map(object({
    min_size                   = number
    max_size                   = number
    desired_size               = number
    disk_size                  = number
    use_custom_launch_template = bool
    instance_types             = list(string)
    capacity_type              = string
  }))
}

variable "addons" {
  description = "A map of addons with boolean values to enable or disable them"
  type        = map(bool)
  default = {
    enable_aws_load_balancer_controller = false
  }
}

variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "aws_auth_users" {
  description = "List of AWS IAM users to be added to the aws-auth ConfigMap"
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}

variable "aws_auth_roles" {
  description = "List of AWS IAM roles to be added to the aws-auth ConfigMap"
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
}
