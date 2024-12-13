data "aws_subnet" "public" {
  depends_on = [aws_subnet.all_subnets]
  filter {
    name   = "tag:subnet"
    values = ["10.10.10.0/24"]
  }
}
