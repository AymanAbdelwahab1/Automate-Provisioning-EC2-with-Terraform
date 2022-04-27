resource "aws_key_pair" "ssh-key" {
  key_name = "server-key"
  public_key = "${file(var.public_key_location)}"
}

resource "aws_instance" "myapp-server" {
  ami = data.aws_ami.latest-amazon-linux-image.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids = [aws_default_security_group.default-sg.id]
  availability_zone = var.avail_zone

  associate_public_ip_address = true
  key_name = aws_key_pair.ssh-key.key_name
  
  user_data = file("entry-script.sh")

  tags = {
    Name = "${var.env_prefix}-server"
  }
} 

output "ec2_public_ip" {
  value = aws_instance.myapp-server.public_ip
}

