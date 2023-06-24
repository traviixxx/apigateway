module "hre-core" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17"
  name = "${var.env_name}-Core-${var.app_version}"
  ami = var.hre_core-ami
  instance_type = var.hre_core_type
  instance_count = var.hre_core-amount_of_instances
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
  ], var.old_sg_list)
  tags = {
    Version: var.app_version,
    env: var.tag_env,
    function: var.tag_core,
    layer: var.tag_layer,
    product: var.tag_product,
    wazuh_groups: var.tag_wazuh_groups,
    wazuh_tags: var.tag_wazuh_tags
  }
  volume_tags = {
    env: var.tag_env,
    function: var.tag_core,
    layer: var.tag_layer,
    product: var.tag_product,
    wazuh_groups: var.tag_wazuh_groups,
    wazuh_tags: var.tag_wazuh_tags
  }
}

# resource "aws_eip" "hre-core-eip" {
#   count = length(module.hre-core.id)
#   vpc = true
#   instance = module.hre-core.id[count.index]
# }

