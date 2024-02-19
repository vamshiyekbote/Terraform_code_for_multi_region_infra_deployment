# Module to deploy WordPress on EC2 instance

resource "aws_instance" "wordpress_instance" {
  ami           = "ami-12345678"  # Replace with your AMI ID
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  # User data for configuring WordPress during instance creation
  user_data = <<-EOF
              #!/bin/bash
              # Install necessary dependencies
              sudo yum update -y
              sudo yum install -y httpd mysql-server php php-mysql

              # Start and enable services
              sudo service httpd start
              sudo service mysqld start
              sudo chkconfig httpd on
              sudo chkconfig mysqld on

              # Download and configure WordPress
              wget https://wordpress.org/latest.tar.gz
              tar -xzf latest.tar.gz
              sudo cp -r wordpress/* /var/www/html/
              sudo chown -R apache:apache /var/www/html/

              # Configure MySQL for WordPress
              mysql -e "CREATE DATABASE wordpress;"
              mysql -e "CREATE USER 'wp_user'@'localhost' IDENTIFIED BY 'wp_password';"
              mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'localhost';"
              mysql -e "FLUSH PRIVILEGES;"

              # Cleanup
              rm -rf wordpress latest.tar.gz
              EOF
}

output "wordpress_instance_id" {
  value = aws_instance.wordpress_instance.id
}
