provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"
}

module "security_groups" {
  source     = "./modules/security_groups"
  vpc_id     = module.vpc.vpc_id
}

module "ec2_instance" {
  source            = "./modules/ec2_instance"
  vpc_id            = module.vpc.vpc_id
  security_group_ids = module.security_groups.security_group_ids
}

module "s3_bucket" {
  source = "./modules/s3_bucket"
}

module "rds" {
  source            = "./modules/rds"
  vpc_id            = module.vpc.vpc_id
  security_group_ids = module.security_groups.security_group_ids
}

module "wordpress" {
  source             = "./modules/wordpress"
  ec2_instance_id    = module.ec2_instance.ec2_instance_id
  rds_endpoint       = module.rds.rds_endpoint
  subnet_ids         = module.vpc.subnet_ids
  security_group_ids = module.security_groups.security_group_ids
}

module "alb_or_dns" {
  source        = "./modules/alb_or_dns"
  use_alb       = true  # Set to false if you want to use DNS instead
  security_group_ids = module.security_groups.security_group_ids
  subnet_ids         = module.vpc.subnet_ids
  route53_zone_id    = var.route53_zone_id
}
