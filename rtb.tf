resource "aws_route_table" "vpc" {
  vpc_id = var.vpc_id

  tags = merge(
    { Name = var.route_table_name },
    var.tags
  )
}

resource "aws_route" "route" {
  for_each                  = var.aws_route
  route_table_id            = aws_route_table.vpc.id
  destination_cidr_block    = lookup(each.value, "cidr_block", null)
  gateway_id                = lookup(each.value, "gateway_id", null)
  nat_gateway_id            = lookup(each.value, "nat_gateway_id", null)
  network_interface_id      = lookup(each.value, "network_interface_id", null)
  transit_gateway_id        = lookup(each.value, "transit_gateway_id", null)
  vpc_endpoint_id           = lookup(each.value, "vpc_endpoint_id", null)
  vpc_peering_connection_id = lookup(each.value, "vpc_peering_connection_id", null)
}

resource "aws_route_table_association" "vpc" {
  for_each       = toset(var.subnet_ids)
  subnet_id      = each.value
  route_table_id = aws_route_table.vpc.id
}