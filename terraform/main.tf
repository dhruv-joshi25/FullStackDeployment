module "vpc" {
  source = "./modules/vpc"

  project_name      = var.project_name
  vpc_name          = "${var.project_name}-vpc"
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidr       = "10.0.1.0/24"
  availability_zone = "${var.aws_region}a"
}

module "security_group" {
  source = "./modules/security-group"

  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "ec2" {
  source = "./modules/ec2"

  project_name          = var.project_name
  subnet_id             = module.vpc.subnet_id
  security_group_id     = module.security_group.security_group_id
  instance_profile_name = module.iam.instance_profile
}