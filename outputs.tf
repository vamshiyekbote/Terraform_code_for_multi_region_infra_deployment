output "wordpress_instance_id" {
  value = module.wordpress.wordpress_instance_id
}

output "alb_dns" {
  value = module.alb_or_dns.use_alb ? module.alb_or_dns.wordpress_alb.dns_name : aws_route53_record.wordpress_dns.name
}
