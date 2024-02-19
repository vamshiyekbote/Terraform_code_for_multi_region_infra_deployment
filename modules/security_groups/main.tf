resource "aws_security_group" "main" {
  vpc_id = var.vpc_id

  # Define security group rules as needed

  tags = {
    Name = "main-security-group"
  }
}

output "security_group_ids" {
  value = [aws_security_group.main.id]
}
