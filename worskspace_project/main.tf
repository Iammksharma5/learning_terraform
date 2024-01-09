
resource "aws_instance" "webserver" {

  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace)
  key_name      = lookup(var.key_name, terraform.workspace)
  # tags = {
  #   Name = "Development"

#   }
 }