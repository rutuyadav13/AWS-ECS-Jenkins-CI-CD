resource "aws_instance" "jenkins" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "YOUR_KEY_PAIR"
  vpc_security_group_ids = [aws_security_group.ecs_sg.id]

  user_data = file("${path.module}/jenkins/user_data.sh")

  tags = { Name = "Jenkins-Server" }
}
