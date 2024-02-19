variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "route53_zone_id" {
  description = "Route 53 hosted zone ID for DNS configuration"
  # Add your hosted zone ID here if using DNS
}
