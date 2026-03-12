resource "aws_ecs_task_definition" "frontend_task" {
  family                   = "frontend-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn  # <-- add this

  container_definitions = jsonencode([
    {
      name      = "frontend-container"
      image     = "YOUR_AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/frontend:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_task_definition" "backend_task" {
  family                   = "backend-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn  # <-- add this

  container_definitions = jsonencode([
    {
      name      = "backend-container"
      image     = "YOUR_AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/backend:latest"
      essential = true
      environment = [
        { name = "DB_HOST", value = aws_db_instance.rds.endpoint },
        { name = "DB_USER", value = "admin" },
        { name = "DB_PASS", value = "StrongPassword123" }
      ]
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
    }
  ])
}
