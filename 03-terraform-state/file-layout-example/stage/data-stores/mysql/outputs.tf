output "address" {
  description = "The address of the MySQL RDS instance"
  value       = aws_db_instance.example.address
}

output "port" {
  description = "The port of the MySQL RDS instance"
  value       = aws_db_instance.example.port
}
