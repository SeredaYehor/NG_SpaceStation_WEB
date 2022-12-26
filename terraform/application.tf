module "application" {
  source = "./modules/application"

  depends_on = [module.vpc]

  public_sub_id         = module.vpc.public_subnet_id
  private_sub_id        = module.vpc.private_subnet_id
  public_private_sub_id = module.vpc.public_access_private_subnet_id
  agent_profile_name    = module.bucket.instance_profile_name
  agent_public_key      = var.agent_public_key
  vpc_id                = module.vpc.vpc_id
  key_name              = var.key_name
  certificate_arn       = var.certificate_arn
}
