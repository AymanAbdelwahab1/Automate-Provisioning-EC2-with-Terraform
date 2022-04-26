provider "aws" {
  region = "us-east-1"
}

variable "cidr_blocks" {
  description = "cidr blocks for vpc and subnets"
  type = list(object({
      cidr_block = string
      name = string
  }))
}