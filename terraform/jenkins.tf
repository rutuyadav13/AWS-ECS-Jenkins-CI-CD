resource "aws_instance" "jenkins" {
  ami           = "ami-0b6c6ebed2801a5cb"  # Ubuntu 22.04 LTS
  instance_type = "t3.micro"
  key_name      = "jenkins key"         
  subnet_id     = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]
  associate_public_ip_address = true

  user_data = file("${path.module}/../jenkins/user_data.sh")

  tags = {
    Name = "Jenkins-Server"
  }
}
