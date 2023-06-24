output "core-public_ips" {
  value = module.hre-core.public_ip
}

output "core-name" {
  value = module.hre-core.tags[*]["Name"]
}

output "worker-special-public_ips" {
  value = module.hre-special-worker.public_ip
}

output "worker-general-public_ips" {
  value = module.hre-general-worker.public_ip
}

output "worker-special-name" {
  value = module.hre-special-worker.tags[*]["Name"]
}

output "worker-general-name" {
  value = module.hre-general-worker.tags[*]["Name"]
}

output "bos-public_ips" {
  value = module.hre-bos.public_ip
}

output "bos-name" {
  value = module.hre-bos.tags[*]["Name"]
}

output "lb-bos-public_ips" {
  value = module.hre-lb-bos.public_ip
}

output "lb-bos-name" {
  value = module.hre-lb-bos.tags[*]["Name"]
}