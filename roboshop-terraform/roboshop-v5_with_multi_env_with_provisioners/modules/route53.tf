resource "aws_route53_record" "public" {
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "${var.name}-${var.env_name}"
  type    = "A"
  ttl     = 10
  records = [
    each.key == "frontend" ? aws_instance.app[each.key].public_ip : aws_instance.app[each.key].private_ip
  ]
}