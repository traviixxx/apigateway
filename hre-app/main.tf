data "aws_vpc" "hre-vpc" {
  id = var.vpc
}
data "aws_subnet_ids" "hre-subnets" {
  vpc_id = var.vpc
  filter {
    name = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1f"]
  }
}

module "hre_app-external-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  //  version = "3.1.0"
  name        = "${var.env_name}-EXT-SG"
  description = "${var.env_name} external access"
  vpc_id      = var.vpc
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_with_cidr_blocks = [
    {
      description = "Allow all outgoing"
      from_port   = "0"
      to_port     = "65535"
      protocol    = "-1"
    }
  ]
  ingress_cidr_blocks = var.external_access
  ingress_with_cidr_blocks = [
    {
      description = "SSH Access"
      from_port   = "22"
      protocol    = "tcp"
      to_port     = "22"
    },
    {
      description = "Zabbix Agent"
      from_port   = "10050"
      protocol    = "tcp"
      to_port     = "10050"
      cidr_blocks = "35.243.250.126/32"
    },
  ]
}

module "hre_app-internal-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  //  version = "3.1.0"
  name        = "${var.env_name}-INT-SG"
  description = "${var.env_name} internal access"
  vpc_id      = var.vpc
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_with_cidr_blocks = [
    {
      description = "Allow all outgoing"
      from_port   = "0"
      to_port     = "65535"
      protocol    = "-1"
    }
  ]
  ingress_with_source_security_group_id = [
    {
      description = "HTTP Access"
      from_port   = "80"
      protocol    = "tcp"
      to_port     = "80"
      source_security_group_id = module.hre_lb-bos-sg.security_group_id
    },
  ]
}

module "hre_lb-bos-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  //  version = "3.1.0"
  name        = "${var.env_name}-LB-SG"
  description = "${var.env_name} LB access"
  vpc_id      = var.vpc
  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_with_cidr_blocks = [
    {
      description = "Allow all outgoing"
      from_port   = "0"
      to_port     = "65535"
      protocol    = "-1"
    }
  ]
  ingress_cidr_blocks = var.external_access
  ingress_with_cidr_blocks = [
    {
      description = "SSH Access"
      from_port   = "443"
      protocol    = "tcp"
      to_port     = "443"
    }
  ]
}
