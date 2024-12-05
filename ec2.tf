resource "aws_instance" "app" {
  ami = ""
  instance_type = var.instance_type
}