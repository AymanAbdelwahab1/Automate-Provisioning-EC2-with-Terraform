resource "aws_vpc" "development-vpc"{
    cidr_block = var.cidr_blocks[0].cidr_block
    tags = {
      Name = var.cidr_blocks[0].name
    }
}

