module "hre-bos" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17"
  name = "${var.env_name}-BOS-${var.app_version}"
  ami = var.hre_bos-ami
  instance_type = var.hre_bos_type
  instance_count = var.hre_bos-amount_of_instances
  subnet_ids = data.aws_subnet_ids.hre-subnets.ids
  associate_public_ip_address = true
  key_name = var.ssh_key
  root_block_device = [
    {
      volume_size : 10
    },
  ]
  # vpc_security_group_ids = concat([
  #   module.hre_app-external-sg.security_group_id,
  #   module.hre_app-internal-sg.security_group_id,
  # ], var.old_sg_list)
  vpc_security_group_ids = var.old_bo_sg_list
  tags = {
    Version: var.app_version,
    env: var.tag_env,
    function: var.tag_bo,
    layer: var.tag_layer,
    product: var.tag_product,
    wazuh_groups: var.tag_wazuh_groups,
    wazuh_tags: var.tag_wazuh_tags
  }
  volume_tags = {
    env: var.tag_env,
    function: var.tag_bo,
    layer: var.tag_layer,
    product: var.tag_product,
    wazuh_groups: var.tag_wazuh_groups,
    wazuh_tags: var.tag_wazuh_tags
  }
}

module "hre-lb-bos" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17"
  name = "${var.env_name}-LB-BOS-${var.app_version}"
  ami = var.hre_lb-bos-ami
  instance_type = var.hre_lb-bos_type
  instance_count = var.hre_lb-bos-amount_of_instances
  subnet_ids = data.aws_subnet_ids.hre-subnets.ids
  associate_public_ip_address = true
  key_name = var.ssh_key
  root_block_device = [
    {
      volume_size : 10
    },
  ]
  vpc_security_group_ids = concat([
    module.hre_app-external-sg.security_group_id,
    module.hre_lb-bos-sg.security_group_id,
  ], var.old_lb_sg_list)
  tags = {
    Version: var.app_version,
    env: var.tag_env,
    function: var.tag_lb,
    layer: var.tag_layer,
    product: var.tag_product,
    wazuh_groups: var.tag_wazuh_groups,
    wazuh_tags: var.tag_wazuh_tags
  }
  volume_tags = {
    env: var.tag_env,
    function: var.tag_lb,
    layer: var.tag_layer,
    product: var.tag_product,
    wazuh_groups: var.tag_wazuh_groups,
    wazuh_tags: var.tag_wazuh_tags
  }
}
