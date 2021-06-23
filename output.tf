output "VPC_ID" {
  value = "${aws_vpc.myVPC.id}"
}

output "PUBLIC_SUBNET_ID" {
  value = ["${aws_subnet.Public-Subnet.*.id}"]
}

output "PUBLIC_ROUTE_TABLE_ID" {
  value = "${aws_route_table.Public-RT.id}"
}

output "INTERNET_GATEWAY_ID" {
  value = "${aws_internet_gateway.myVPC-GW.id}"
}

output "EIP_ID" {
  value = "${aws_eip.myEIP.id}"
}

output "NAT_PUBLIC_SUBNET_ID" {
  value = "${aws_subnet.Public-Subnet.0.id}"
}

output "NAT_GATEWAY_ID" {
  value = "${aws_nat_gateway.myVPC-NAT.id}"
}

output "PRIVATE_SUBNET_ID" {
  value = ["${aws_subnet.Private-Subnet.*.id}"]
}

output "PRIVATE_ROUTE_TABLE_ID" {
  value = "${aws_route_table.Private-RT.id}"
}
