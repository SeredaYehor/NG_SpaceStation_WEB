output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "public_access_private_subnet_id" {
  value = aws_subnet.public_access_private_subnet.id
}

output "vpc_id" {
  value = aws_vpc.teamcity_vpc.id
}

output "private_route_table_id" {
  value = aws_route_table.private_rt.id
}
