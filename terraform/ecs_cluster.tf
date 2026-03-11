resource "aws_ecs_cluster" "main_cluster" {
  name = "aws-ecs-jenkins-cluster"
  tags = {
    Name = "aws-ecs-jenkins-cluster"
  }
}