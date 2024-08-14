variable "ports" {
  type = list(number)
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}


variable "db_password" {
  description = "RDS root user password"
  type        = string
  sensitive   = true
}
