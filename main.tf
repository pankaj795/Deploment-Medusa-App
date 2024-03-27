provider "aws" {
  region = var.aws_region
}

resource "aws_ecs_cluster" "medusa-cluster" {
  name = "medusa-cluster"
}

resource "aws_ecs_task_definition" "medusa-task" {
  family = "medusa-task"
  container_definitions = jsonencode([
    {
      name      = "medusa-container"
      image     = var.docker_image_repo
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "medusa-service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa-cluster.id
  task_definition = aws_ecs_task_definition.medusa-task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [var.subnet_id]
    security_groups = [var.security_group_id]
  }
}
