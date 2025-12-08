output "vpc_id" {
  value = aws_vpc.iac-vpc.id
}

output "eip_a_id" {
  value = aws_eip.iac-eip-a.id
}

output "eip_c_id" {
  value = aws_eip.iac-eip-c.id
}

output "pb_subnet_a" {
  value = aws_subnet.iac-public-subnet1.id
}

output "pb_subnet_c" {
  value = aws_subnet.iac-public-subnet2.id
}

output "pv_subnet_a" {
  value = aws_subnet.iac-private-subnet1.id
}

output "pv_subnet_c" {
  value = aws_subnet.iac-private-subnet2.id
}

output "pv_routing_id_a" {
  value = aws_route_table.iac-private1-route-table.id
}

output "pv_routing_id_c" {
  value = aws_route_table.iac-private2-route-table.id
}

output "pb_routing_id" {
  value = aws_route_table.iac-public-route-table.id
}

output "igw_id" {
  value = aws_internet_gateway.iac-igw.id
}

output "nat_id_a" {
  value = aws_nat_gateway.iac_nat_gateway1.id
}

output "nat_id_c" {
  value = aws_nat_gateway.iac_nat_gateway2.id
}

output "pb_subent_a" {
  value = aws_subnet.iac-public-subnet1.arn
}

output "pb_subent_c" {
  value = aws_subnet.iac-public-subnet2.arn
}

output "pb_subent_a_id" {
  value = aws_subnet.iac-public-subnet1.id
}

output "pb_subnet_c_id" {
  value = aws_subnet.iac-public-subnet2.id
}