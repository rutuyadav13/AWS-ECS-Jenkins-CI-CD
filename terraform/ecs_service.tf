# -----------------------------
# ECS Frontend Service
# -----------------------------
resource "aws_ecs_service" "frontend_service" {
  name            = "frontend-service"
  cluster         = aws_ecs_cluster.main_cluster.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.frontend_task.arn
  desired_count   = 2

  network_configuration {
    subnets = [
      aws_subnet.private_subnet_1.id,
      aws_subnet.private_subnet_2.id
    ]

    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.frontend_tg.arn
    container_name   = "frontend-container"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.frontend_listener]
}

# -----------------------------
# ECS Backend Service
# -----------------------------
resource "aws_ecs_service" "backend_service" {
  name            = "backend-service"
  cluster         = aws_ecs_cluster.main_cluster.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.backend_task.arn
  desired_count   = 1

  network_configuration {
    subnets = [
      aws_subnet.private_subnet_1.id,
      aws_subnet.private_subnet_2.id
    ]

    security_groups  = [aws_security_group.ecs_sg.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.backend_tg.arn
    container_name   = "backend-container"
    container_port   = 80
  }

  depends_on = [aws_lb_listener.backend_listener]
}
