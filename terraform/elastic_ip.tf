resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip"
  }
}

resource "aws_eip_association" "this" {
  instance_id   = module.ec2.instance_id
  allocation_id = aws_eip.this.id
}