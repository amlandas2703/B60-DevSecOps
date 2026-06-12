resource "aws_route53_record" "public" {
  for_each = aws_instance.main
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "${var.name}-${var.env_name}"
  type    = "A"
  ttl     = 10
  records = [
    each.key == "frontend" ? aws_instance.main[each.key].public_ip : aws_instance.main[each.key].private_ip
  ]
}