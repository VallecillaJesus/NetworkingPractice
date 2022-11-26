module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  count   = length(local.vpc.subnets.public) + length(local.vpc.subnets.private)

  depends_on = [
    module.vpc,
    module.key_pair
  ]

  name = "office-${count.index + 1}"

  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  monitoring             = false
  key_name               = "jesus-keys"
  vpc_security_group_ids = tolist([module.web_server_sg.security_group_id])
  subnet_id              = concat(module.vpc.public_subnets, module.vpc.private_subnets)[count.index]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}