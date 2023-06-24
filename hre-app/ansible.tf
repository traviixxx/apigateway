resource "local_file" "ansible_inventory" {
  filename = "./apps-inventory-${var.app_version}.ini"
  content = templatefile("${path.module}/templates/inventory.tpl", {
    cluster_name   = var.env_name
    ssh_key = var.ssh_key

    core-nodes = join("\n", formatlist("%s ansible_host=\"%s\" server_type=\"%s\"", module.hre-core.tags[*]["Name"], module.hre-core.public_ip, "HRE-Core"))
    special-worker-nodes = join("\n", formatlist("%s ansible_host=\"%s\" server_type=\"%s\"", module.hre-special-worker.tags[*]["Name"], module.hre-special-worker.public_ip, "HRE-Special-Worker"))
    general-worker-nodes = join("\n", formatlist("%s ansible_host=\"%s\" server_type=\"%s\"", module.hre-general-worker.tags[*]["Name"], module.hre-general-worker.public_ip, "HRE-General-Worker"))
    bos-nodes = join("\n", formatlist("%s ansible_host=\"%s\" server_type=\"%s\"", module.hre-bos.tags[*]["Name"], module.hre-bos.public_ip, "HRE-BOS"))
    lb-bos-nodes = join("\n", formatlist("%s ansible_host=\"%s\" server_type=\"%s\"", module.hre-lb-bos.tags[*]["Name"], module.hre-lb-bos.public_ip, "HRE-LB-BOS"))
    app-version = var.app_version
  })
}