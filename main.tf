resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
      protocol = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  
}
dynamic "egress" {
for_each = var.outbound_rules
content {
  from_port = egress.value["from_port"]
  to_port = egress.value["to_port"]
  protocol = egress.value["protocol"]
  cidr_blocks = egress.value["cidr_blocks"]
}
}
  tags = merge(
    var.common_tags,
    var.sg_tags,
    {
    Name = locals.resource_name
  }
  )
}