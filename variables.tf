variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "environment" {
  type    = string
  default = "Test"
}

variable "route_table_name" {
  type    = string
  default = "Test Route Table"
}

variable "aws_route" {
  type    = any
  default = {}
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs"
}