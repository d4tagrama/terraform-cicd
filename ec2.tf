resource "aws_instance" "app" {
  ami = var.instance_ami[var.instance_ami_selection]
  instance_type = var.instance_type
}