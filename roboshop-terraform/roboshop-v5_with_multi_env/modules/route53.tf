resource "aws_route53_record" "public" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "${var.name}-${var.env_name}"
  type    = "A"
  ttl     = 10
  records = [aws_instance.main.private_ip]
}