variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "VPC_CIDR" {
  default = "10.0.0.0/16"
}

variable "VPC_TAG" {
  default = "TestVPC"
}

variable "VPC_ID" {}

variable "PUBLIC_SUBNET_CIDR_BLOCKS" {
  type    = "list"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "PUBLIC_SUBNET_TAGS" {
  type    = "list"
  default = ["TestVPC-Public-1A", "TestVPC-Public-1B"]
}

variable "PUBLIC_ROUTE_TABLE_TAG" {
  default = "TestVPC-Public"
}

variable "INTERNET_GATEWAY_TAG" {
  default = "TestVPC-IGW"
}

variable "INTERNET_GATEWAY_ID" {}

variable "AZS" {
  type    = "list"
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "PUBLIC_ROUTE_TABLE_ID" {}

variable "PUBLIC_SUBNET_ID" {
  type = "list"
}

variable "PRIVATE_SUBNET_CIDR_BLOCKS" {
  type    = "list"
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "PRIVATE_SUBNET_TAGS" {
  type    = "list"
  default = ["TestVPc-Private-1A", "TestVPC-Private-1B"]
}

variable "EIP_TAG" {
  default = "TestVPC-EIP"
}

variable "EIP_ID" {}
variable "NAT_PUBLIC_SUBNET_ID" {}

variable "NAT_GATEWAY_TAG" {
  default = "TestVPC-NAT"
}

variable "NAT_GATEWAY_ID" {}

variable "PRIVATE_ROUTE_TABLE_TAG" {
  default = "TestVPC-Private-Route-Table"
}

variable "PRIVATE_SUBNET_ID" {
  type = "list"
}

variable "PRIVATE_ROUTE_TABLE_ID" {}
