variable "env_name" {
  default = "QAT2-HRE"
}
variable "vpc" {
  default = "vpc-092767728d08cced7"
}

variable "ami" {
  default = "ami-011ff2027e02f78e8"
}

variable "hre_core-ami" {
  default = "ami-011ff2027e02f78e8"
}

variable "hre_special_worker-ami" {
  default = "ami-011ff2027e02f78e8"
}

variable "hre_general_worker-ami" {
  default = "ami-011ff2027e02f78e8"
}

variable "hre_bos-ami" {
  default = "ami-011ff2027e02f78e8"
}

variable "hre_lb-bos-ami" {
  default = "ami-011ff2027e02f78e8"
}

variable "kms_key_id" {
  default = "arn:aws:kms:us-east-1:873212398515:key/902d6fe4-515d-4892-afed-3e28503eec1e"
}

variable "ssh_key" {
  default = "gcdev"
}

variable "external_access" {
  default = [
    "118.69.35.205/32",
    "27.65.195.158/32",
    "184.69.72.190/32",
    "95.69.249.156/32",
    "128.0.169.65/32",
    "24.234.166.179/32",
    "54.173.212.103/32",
    "52.70.75.245/32",
    "18.162.78.188/32"
  ]
}

variable "app_version" {
  default = "180"
}

variable "old_sg_list" {
  default = [
    "sg-0e4c37a2f57c17939" #QAT-HRE-Default
  ]
}

variable "old_bo_sg_list" {
  default = [
    "sg-06a62f35cda74f2b2", #UAT-US4-APP-HRE-BOS
    "sg-0e4c37a2f57c17939" #QAT-HRE-Default
    #"sg-03084e5b65acfd1b8"  PROD-HRE-LB-HRE-BOS
  ]
}

variable "old_lb_sg_list" {
  default = [
    "sg-0e4c37a2f57c17939" #QAT-HRE-Default
    #"sg-030426b0a53cca6c3" #UAT-US4-LB-HRE-BOS
    #"sg-0e4d32bcfa54c18e4", PROD-HRE-APP-HRE-BOS
    #"sg-03084e5b65acfd1b8"  #PROD-HRE-LB-HRE-BOS
  ]
}

variable "old_rabbit_sg_list" {
  default = [
    # "sg-074f81cb9244c7376"
  ]
}

variable "tag_env" {
  default = "n/a"
}
variable "tag_layer" {
  default = "qat"
}
variable "tag_product" {
  default = "hre"
}
variable "tag_worker" {
  default = "worker-hre"
}
variable "tag_rabbit" {
  default = "queue-hre"
}
variable "tag_core" {
  default = "core-hre"
}
variable "tag_lb" {
  default = "lb-bos"
}
variable "tag_bo" {
  default = "bo-hre"
}