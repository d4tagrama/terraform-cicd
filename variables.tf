variable "vpc_cidr" {
  type = string
  default = "10.10.0.0/16"
}
variable "prod_subnets" {}
variable "ports_allowed" {}

variable "instance_ami" {
  type = map(string)
}
variable "instance_ami_selection" {
  type = string
  default = "aws-default"
}
variable instance_type {
  default = "t3.micro"
}
