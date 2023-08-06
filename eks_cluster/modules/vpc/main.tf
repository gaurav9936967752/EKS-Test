# Define the VPC resource
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "my-vpc"
  }
}

# Define public subnets
resource "aws_subnet" "public" {
  count = length(var.vpc_subnets["public_subnets"])
  cidr_block = var.vpc_subnets["public_subnets"][count.index]
  vpc_id     = aws_vpc.this.id

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Define private subnets
resource "aws_subnet" "private" {
  count = length(var.vpc_subnets["private_subnets"])
  cidr_block = var.vpc_subnets["private_subnets"][count.index]
  vpc_id     = aws_vpc.this.id

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}

# Output the public and private subnet IDs
output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

