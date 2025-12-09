####################ECS cluster create####################
resource "aws_ecs_cluster" "iac-ecs-cluster" {
    name = var.cluster

    setting {
        name  = "containerInsights"
        value = "enabled"
    }
}

####################ECS cluster service create####################
resource "aws_ecs_service" "iac-cluster-service" {
  name    = "iac-cluster-service"
  cluster = aws_ecs_cluster.iac-ecs-cluster.arn
  desired_count = 1
  launch_type   = "FARGATE"
  task_definition = aws_ecs_task_definition.iac-task.arn
  
  network_configuration {
    security_groups  = [aws_security_group.iac-sg.id]
    subnets          = concat([var.pv_subnet_a], [var.pv_subnet_c])
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.tg_blue_arn
    container_name   = "iac-webgoat-container"
    container_port   = 8080
  }

  deployment_controller {
    type = "CODE_DEPLOY"
  }

  service_connect_configuration {
    enabled = false
  }

  health_check_grace_period_seconds = 180
  lifecycle {
    ignore_changes = [
      task_definition
    ]
  }
}

