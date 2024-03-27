output "ecs_service_name" {
  value = aws_ecs_service.medusa-service.name
}

output "ecs_service_url" {
  value = aws_ecs_service.medusa-service.endpoint
}
