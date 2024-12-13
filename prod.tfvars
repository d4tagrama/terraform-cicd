ports_allowed = [22,80,443]
instance_ami = {
  aws-default = "ami-0453ec754f44f9a4a",
  ubuntu-22 = "ami-0e2c8caa4b6378d8c"
}
prod_subnets = {
  public = {
    cidr_block                          = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"]
    availability_zone                   = "a"
    map_public_ip_on_launch             = true
    private_dns_hostname_type_on_launch = true
  },
  private = {
    cidr_block                          = ["10.10.110.0/24", "10.10.120.0/24", "10.10.130.0/24"]
    availability_zone                   = "b"
    map_public_ip_on_launch             = false
    private_dns_hostname_type_on_launch = true
  },
}
instance_type = "t3.micro"
