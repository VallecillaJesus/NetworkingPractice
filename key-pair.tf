module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "jesus-keys"
  create_private_key = true
}