terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.52.0"
    }
    # zabbix = {
    #   source  = "claranet/zabbix"
    #   version = "0.2.0"
    # }
  }
}

provider "aws" {
  profile = "gcdev"
  region = "us-east-1"
}

# provider "zabbix" {
#   server_url = "https://zabbix.geocomply.net/api_jsonrpc.php"
#   user       = "Ansible"
#   password   = "ansible"
# }

# module "hre-rabbitmq-cluster" {
#   source = "../../../terraform/rabbitmq"
#   ami = var.ami
#   vpc = var.vpc
#   kms_key_id = var.kms_key_id
#   ssh_key = var.ssh_key
#   env_name = "QAT2-HRE"
#   external_access = var.external_access
#   amount_of_instances = 3
#   tag_rabbit = var.tag_rabbit
#   tag_env = "n/a"
#   tag_layer = var.tag_layer
#   tag_product = var.tag_product
#   old_rabbit_sg_list = var.old_rabbit_sg_list
# }

# resource "zabbix_host" "zabbix_hre_cluster" {
#   count = 3
#   host  = module.hre-rabbitmq-cluster.name[count.index]
#   name  = module.hre-rabbitmq-cluster.name[count.index]
#   interfaces {
#     ip   = module.hre-rabbitmq-cluster.public_ips[count.index]
#     main = true
#   }
#   groups = [
#     "PROD HRE",
#   ]
#   templates = [
#     "Template App SSH Service",
#     "Template OS Linux",
#     "Template OS Linux SWAP",
#     "Template OS Linux Time Offset",
#     "Template OS Linux Timezone",
#     "RabbitMQ node by Zabbix agent PROD HRE 1.5.1",
#   ]
#   depends_on = [module.hre-rabbitmq-cluster]
# }


module "hre-apps" {
  source = "../../../terraform/hre-app"
  env_name = var.env_name
  external_access = var.external_access
  hre_core-ami = var.hre_core-ami
  hre_general_worker-ami = var.hre_general_worker-ami
  hre_special_worker-ami = var.hre_special_worker-ami
  hre_bos-ami = var.hre_bos-ami
  hre_lb-bos-ami = var.hre_lb-bos-ami
  ssh_key = var.ssh_key
  vpc = var.vpc
  app_version = var.app_version
  old_sg_list = var.old_sg_list
  old_lb_sg_list = var.old_lb_sg_list
  old_bo_sg_list = var.old_bo_sg_list
  hre_core_type = "t3.medium"
  hre_general_worker_type = "t3.medium"
  hre_special_worker_type = "c5.xlarge"
  hre_bos_type = "t3.medium"
  hre_lb-bos_type = "t3.small"
  hre_core-amount_of_instances = 1
  hre_general_worker-amount_of_instances = 1
  hre_bos-amount_of_instances = 1
  hre_special_worker-amount_of_instances = 1
  hre_lb-bos-amount_of_instances = 1
  tag_env = "n/a"
  tag_layer = var.tag_layer
  tag_product = var.tag_product
  tag_bo = var.tag_bo
  tag_core = var.tag_core
  tag_lb = var.tag_lb
  tag_worker = var.tag_worker
}

