output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}
output "instance_id" {
  value = module.ec2.instance_id
}

output "elastic_ip" {
  value = aws_eip.this.public_ip
}