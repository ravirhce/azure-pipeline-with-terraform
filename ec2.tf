resource "aws_instance" "this" {
  ami = "ami-07caf09b362be10b8"
  instance_type = var.instance_type
  user_data = file("${path.module}/app.sh")
  vpc_security_group_ids = [aws_security_group.webport.id]
  key_name = var.instance_key
  tags = {
    Name = "instance-${random_pet.random.id}"
  }
  lifecycle {
    create_before_destroy = true
  }
}