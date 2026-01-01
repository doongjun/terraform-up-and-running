variable "identifier_prefix" {
  description = "A prefix to use for resource identifiers"
  type        = string
}

variable "db_name" {
  description = "The name to use for the database resources"
  type        = string
}

variable "instance_class" {
  description = "The instance class to use for the database instance"
  type        = string
}
