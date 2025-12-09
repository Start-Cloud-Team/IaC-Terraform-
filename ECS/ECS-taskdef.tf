####################ECS task create####################
resource "aws_ecs_task_definition" "iac-task"{
    family                   = "iac-task"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = aws_iam_role.iac-task-execution-role.arn
    task_role_arn            = aws_iam_role.iac-task-role.arn

    container_definitions = <<TASK_DEFINITION
    [
        {
            "cpu": 0,
            "essential": true,
            "image": "${var.ecr_url}:latest",
            "name": "iac-webgoat-container",
            "portMappings": [
                {
                    "containerPort": 8080,
                    "hostPort": 8080,
                    "protocol": "tcp"
                }
            ],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "/ecs/iac-task",
                    "awslogs-region": "ap-northeast-2",
                    "awslogs-stream-prefix": "ecs"
                }
            }
        }
    ]
TASK_DEFINITION
}

####################ECS log####################
resource "aws_cloudwatch_log_group" "iac_ecs_log_group" {
  name              = "/ecs/iac-task" 
  retention_in_days = 7

}
