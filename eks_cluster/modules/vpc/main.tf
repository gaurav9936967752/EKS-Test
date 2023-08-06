resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "private" {
  count = 2
  cidr_block = "10.0.${count.index + 1}.0/24"
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets_ids" {
  value = aws_subnet.private[*].id
}
