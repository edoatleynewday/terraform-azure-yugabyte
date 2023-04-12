output "ui" {
  sensitive = false
  value     = "http://${azurerm_public_ip.YugaByte_Public_IP[0].ip_address}:7000"
}

output "ssh_user" {
  sensitive = false
  value     = var.ssh_user
}

output "ssh_key" {
  sensitive = false
  value     = var.ssh_private_key
}

output "JDBC" {
  sensitive = false
  value     = "postgresql://yugabyte@${azurerm_public_ip.YugaByte_Public_IP[0].ip_address}:5433"
}

output "YSQL" {
  sensitive = false
  value     = "ysqlsh -U yugabyte -h ${azurerm_public_ip.YugaByte_Public_IP[0].ip_address} -p 5433"
}

output "YCQL" {
  sensitive = false
  value     = "ycqlsh ${azurerm_public_ip.YugaByte_Public_IP[0].ip_address} 9042"
}

output "YEDIS" {
  sensitive = false
  value     = "redis-cli -h ${azurerm_public_ip.YugaByte_Public_IP[0].ip_address} -p 6379"
}

output "nodes" {
  sensitive = false
  description = "Detail the node name and private IP addresses"
  value = { for node in azurerm_virtual_machine.YugaByte-Node : node.name => node.private_ip_address }
}