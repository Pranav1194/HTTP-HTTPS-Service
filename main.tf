resource "aws_instance" "http_service" {
  ami           = var.ami_id
  instance_type = var.ec2_instance_type
  key_name      = var.key_pair_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [
    aws_security_group.http_service_sg.id
  ]

  user_data = templatefile("user_data.sh", {
    s3_access_key = var.s3_access_key,
    s3_secret_key = var.s3_secret_key,
    bucket_name   = var.bucket_name
  })

  tags = {
    Name = "HTTP Service"
  }
}

resource "aws_security_group" "http_service_sg" {
  name        = "http_service_sg"
  description = "Allow HTTP traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
