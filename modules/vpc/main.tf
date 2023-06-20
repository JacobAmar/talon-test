module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  name = "${var.region}-talon"
  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  cidr            = var.cidr
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
  tags = {
    Terraform = "true"
    Environment = var.environment
    Region = var.region
    Account = var.account_name
  }
}



