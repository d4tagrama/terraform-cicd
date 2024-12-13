resource "aws_vpc" "vpc_app" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "VPC APP1"
  }
}


resource "aws_subnet" "all_subnets" {
  for_each                = { for i, subnet in local.subnets : "${subnet.type}-${i}" => subnet }
  vpc_id                  = aws_vpc.vpc_app.id
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone       = "${local.region}${each.value.availability_zone}"
  cidr_block              = each.value.cidr_block
  tags = {
    "Name" : "${each.key}"
    "subnet" : "${each.value.cidr_block}"
  }
}
resource "aws_security_group" "sg-prod" {

  name        = "allow_prod"
  description = "Allow MGM and web traffic"
  vpc_id      = aws_vpc.vpc_app.id
  dynamic "ingress" {
    for_each = var.ports_allowed
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

resource "aws_internet_gateway" "igw-prod" {
  vpc_id = aws_vpc.vpc_app.id
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.vpc_app.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-prod.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = data.aws_subnet.public.id
  route_table_id = aws_route_table.main.id
}