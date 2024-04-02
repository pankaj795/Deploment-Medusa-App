variable "aws_region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-1"
}

variable "docker_image_repo" {
  description = "The ECR repository URI for the Docker image."
  default     = "56575889012.dkr.ecr.us-east-1.amazonaws.com/myimage"
}

variable "subnets" {
  description = "A list of subnet IDs to deploy the ECS service into."
  type        = list(string)
  default     = ["subnet-public", "subnet-private"]
}

variable "security_groups" {
  description = "A list of security group IDs to associate with the ECS service task."
  type        = list(string)
  default     = ["sg-0123456789abcdef0"]
}

variable "lb_security_groups" {
  description = "A list of security group IDs to associate with the load balancer."
  type        = list(string)
  default     = ["sg-abcdef01234567890"]
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed."
  default     = "vpc-0123456789abcdef0"
}
