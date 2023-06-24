variable "vpc" {}
variable "hre_core-ami" {}
variable "hre_special_worker-ami" {}
variable "hre_general_worker-ami" {}
variable "hre_bos-ami" {}
variable "hre_lb-bos-ami" {}
variable "env_name" {}
variable "ssh_key" {}
variable "app_version" {}
variable "tag_env" {}
variable "tag_bo" {}
variable "tag_worker" {}
variable "tag_core" {}
variable "tag_lb" {}
variable "tag_product" {}
variable "tag_layer" {}
variable "tag_wazuh_groups" {}
variable "tag_wazuh_tags" {}
variable "external_access" {
  type = list(string)
}

variable "hre_core_type" {
  default = "m5.xlarge"
}

variable "hre_general_worker_type" {
  default = "t3.medium"
}
variable "hre_special_worker_type" {
  default = "c5.xlarge"
}

variable "hre_bos_type" {
  default = "t3.medium"
}

variable "hre_lb-bos_type" {
  default = "t3.small"
}

variable "hre_core-amount_of_instances" {
  type = number
  default = 2
}

variable "hre_general_worker-amount_of_instances" {
  type = number
  default = 2
}
variable "hre_special_worker-amount_of_instances" {
  type = number
  default = 2
}

variable "hre_bos-amount_of_instances" {
  type = number
  default = 2
}
variable "hre_lb-bos-amount_of_instances" {
  type = number
  default = 2
}

variable "kms_key_id" {
  default = ""
}
variable "old_sg_list" {}
variable "old_bo_sg_list" {}
variable "old_lb_sg_list" {}