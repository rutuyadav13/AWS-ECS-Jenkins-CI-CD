resource "aws_db_instance" "rds" {
  identifier         = "ecs-jenkins-rds"
  allocated_storage  = 20
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  name               = "mydb"   # only lowercase letters/numbers
  username           = "admin"
  password           = "StrongPassword123"
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot = true
  multi_az            = true
}
