variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "subnet_id" {
  description = "The ID of the subnet where the ECS tasks will be deployed"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for the ECS tasks"
  type        = string
}

variable "docker_image_repo" {
  description = "The URI of the Docker image repository in ECR"
  type        = string
}

