output "address" {
  description = "The address of the MySQL RDS instance"
  value       = module.mysql.address
}

output "port" {
  description = "The port of the MySQL RDS instance"
  value       = module.mysql.port
}
