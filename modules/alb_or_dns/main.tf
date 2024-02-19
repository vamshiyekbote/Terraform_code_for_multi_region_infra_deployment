variable "use_alb" {
  description = "Set to true to use ALB, false to configure DNS"
  type        = bool
  default     = true
}

resource "aws_lb" "wordpress_alb" {
  count             = var.use_alb ? 1 : 0
  name              = "wordpress-alb"
  internal          = false
  load_balancer_type = "application"
  security_groups   = var.security_group_ids
  subnets           = var.subnet_ids

  enable_deletion_protection = false

  enable_cross_zone_load_balancing = true
  enable_http2                     = true

  tags = {
    Name = "wordpress-alb"
  }

  listener {
    port     = 80
    protocol = "HTTP"

    default_action {
      type             = "fixed-response"
      fixed_response   = {
        content_type = "text/plain"
        message_body = "WordPress Service"
        status_code  = "200"
      }
    }
  }
}

resource "aws_route53_record" "wordpress_dns" {
  count = var.use_alb ? 0 : 1

  zone_id = var.route53_zone_id
  name    = "wordpress.example.com"
  type    = "A"
  ttl     = 300

  records = [aws_instance.wordpress_instance.public_ip]
}

output "alb_dns" {
  value = var.use_alb ? aws_lb.wordpress_alb.dns_name : aws_route53_record.wordpress_dns.name
}
