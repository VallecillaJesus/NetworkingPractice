module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.vpc.name
  cidr = local.vpc.cidr

  azs             = local.vpc.azs
  private_subnets = local.vpc.subnets.private
  public_subnets  = local.vpc.subnets.public

  enable_vpn_gateway = false
  enable_nat_gateway = false


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}