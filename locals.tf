locals {
  subnets = flatten([
    for subnet_type, subnet_info in var.prod_subnets : [
      for cidr in subnet_info.cidr_block : {
        type                                = subnet_type
        cidr_block                          = cidr
        availability_zone                   = subnet_info.availability_zone
        map_public_ip_on_launch             = subnet_info.map_public_ip_on_launch
        private_dns_hostname_type_on_launch = subnet_info.private_dns_hostname_type_on_launch
      }
    ]
  ])
}
locals {
  region = "us-east-1"
}