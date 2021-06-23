#Create VPC
resource "aws_vpc" "myVPC" {
  cidr_block           = "${var.VPC_CIDR}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    Name = "${var.VPC_TAG}"
  }
}

#Create Public Subnets
resource "aws_subnet" "Public-Subnet" {
  count                   = "${length(var.PUBLIC_SUBNET_CIDR_BLOCKS)}"
  vpc_id                  = "${var.VPC_ID}"
  availability_zone       = "${element(var.AZS, count.index)}"
  map_public_ip_on_launch = "true"
  cidr_block              = "${element(var.PUBLIC_SUBNET_CIDR_BLOCKS, count.index)}"

  tags {
    Name = "${element(var.PUBLIC_SUBNET_TAGS, count.index)}"
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "myVPC-GW" {
  vpc_id = "${var.VPC_ID}"

  tags {
    Name = "${var.INTERNET_GATEWAY_TAG}"
  }
}

#Create Public Route table and Attached Internet gateway
resource "aws_route_table" "Public-RT" {
  vpc_id = "${aws_vpc.myVPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.INTERNET_GATEWAY_ID}"
  }

  tags {
    Name = "${var.PUBLIC_ROUTE_TABLE_TAG}"
  }
}

#Add Public Subnets to Public Route table
resource "aws_route_table_association" "Public-RT-Add" {
  count          = "${length(var.PUBLIC_SUBNET_CIDR_BLOCKS)}"
  subnet_id      = "${element(var.PUBLIC_SUBNET_ID, count.index)}"
  route_table_id = "${var.PUBLIC_ROUTE_TABLE_ID}"
}

#Create Private Subnets
resource "aws_subnet" "Private-Subnet" {
  vpc_id                  = "${var.VPC_ID}"
  count                   = "${length(var.PRIVATE_SUBNET_CIDR_BLOCKS)}"
  cidr_block              = "${element(var.PRIVATE_SUBNET_CIDR_BLOCKS, count.index)}"
  map_public_ip_on_launch = "false"
  availability_zone       = "${element(var.AZS, count.index)}"

  tags {
    Name = "${element(var.PRIVATE_SUBNET_TAGS, count.index)}"
  }
}

#Create EIP
resource "aws_eip" "myEIP" {
  vpc = "true"

  tags {
    Name = "${var.EIP_TAG}"
  }
}

#Create NAT Gate way
resource "aws_nat_gateway" "myVPC-NAT" {
  allocation_id = "${var.EIP_ID}"
  subnet_id     = "${var.NAT_PUBLIC_SUBNET_ID}"
  depends_on    = ["aws_internet_gateway.myVPC-GW"]

  tags {
    Name = "${var.NAT_GATEWAY_TAG}"
  }
}

#Create Private Route table
resource "aws_route_table" "Private-RT" {
  vpc_id = "${var.VPC_ID}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${var.NAT_GATEWAY_ID}"
  }

  tags {
    Name = "${var.PRIVATE_ROUTE_TABLE_TAG}"
  }
}

#Add Private Subnet to Private route table
resource "aws_route_table_association" "Private-RT-Add" {
  count          = "${length(var.PRIVATE_SUBNET_CIDR_BLOCKS)}"
  subnet_id      = "${element(var.PRIVATE_SUBNET_ID, count.index)}"
  route_table_id = "${var.PRIVATE_ROUTE_TABLE_ID}"
}
