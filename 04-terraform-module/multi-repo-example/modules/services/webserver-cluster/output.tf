output "alb_dns_name" {
  value       = aws_lb.example.dns_name
  description = "The DNS name of the Application Load Balancer"
}

output "alb_security_group_id" {
  value       = aws_security_group.alb.id
  description = "The security group ID of the Application Load Balancer"
}
