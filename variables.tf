variable "vpc_cidr" {
  type = string
  default = "10.10.0.0/16"
}
variable "prod_subnets" {}
variable "ports_allowed" {}

variable "instance_type" {}