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
  type    = "string"
  default = "10.0.1.0/24"
}

variable "PUBLIC_SUBNET_TAGS" {
  type    = "string"
  default = "TestVPC-Public-1A"
}

variable "PUBLIC_ROUTE_TABLE_TAG" {
  default = "TestVPC-Public"
}

variable "INTERNET_GATEWAY_TAG" {
  default = "TestVPC-IGW"
}

variable "INTERNET_GATEWAY_ID" {}

variable "AZS" {
  type    = "string"
  default = "ap-south-1a"
}

variable "PUBLIC_ROUTE_TABLE_ID" {}

variable "PUBLIC_SUBNET_ID" {
  type = "string"
}

variable "PRIVATE_SUBNET_CIDR_BLOCKS" {
  type    = "string"
  default = "10.0.3.0/24"
}

variable "PRIVATE_SUBNET_TAGS" {
  type    = "string"
  default = "TestVPc-Private-1A"
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
  type = "string"
}

variable "PRIVATE_ROUTE_TABLE_ID" {}
