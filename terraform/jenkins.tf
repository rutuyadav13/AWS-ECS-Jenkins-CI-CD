resource "aws_instance" "jenkins" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "jenkins key"
  vpc_security_group_ids = [aws_security_group.ecs_sg.id]

  # Correct path to user_data.sh
  user_data = file("${path.root}/jenkins/user_data.sh")

  tags = { Name = "Jenkins-Server" }
}
