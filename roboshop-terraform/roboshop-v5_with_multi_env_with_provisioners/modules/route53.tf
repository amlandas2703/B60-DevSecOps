resource "aws_route53_record" "public" {
  for_each = aws_instance.main
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "${var.name}-${var.env_name}"
  type    = "A"
  ttl     = 10
  records = ["${local.get_instance_ip}"]
}