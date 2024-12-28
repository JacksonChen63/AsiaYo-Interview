terraform {
  backend "s3" {
    bucket  = "asiayo-demo-tfstate"
    key     = "eks-cluster/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

provider "aws" {
  region                  = var.region
  skip_metadata_api_check = true
  default_tags {
    tags = {
      "Managed" = "Terraform"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name, "--region", local.region]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name, "--region", local.region]
    }
  }
}

data "aws_default_tags" "current" {}
data "aws_caller_identity" "current" {}

locals {
  provider = "aws"
  region   = "ap-southeast-1"
  tags = {
    "Managed" = "Terraform"
  }
}
