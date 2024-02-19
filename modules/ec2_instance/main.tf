resource "aws_instance" "main" {
  ami           = "ami-12345678"  # Replace with your AMI ID
  instance_type = "t2.micro"
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
              #!/bin/bash
              # Install necessary dependencies and configure WordPress
              # (use the script from the WordPress module)
              EOF

  tags = {
    Name = "main-ec2-instance"
  }
}

output "ec2_instance_id" {
  value = aws_instance.main.id
}
