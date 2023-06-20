module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"
  cluster_name  =  "${var.region}-talon-eks"
  cluster_version = "1.26"
  cluster_endpoint_public_access  = true
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  vpc_id                   = var.vpc_id
  subnet_ids               = var.subnet_ids
  control_plane_subnet_ids = var.subnet_ids
  eks_managed_node_group_defaults = {
    instance_types = ["m5.large"]
  }
  eks_managed_node_groups = {
    default = {
      min_size     = 1
      max_size     = 10
      desired_size = 1 
    }
  }
  tags = {
    Terraform = "true"
    Environment = var.environment
    Region = var.region
    Account = var.account_name
  }
}