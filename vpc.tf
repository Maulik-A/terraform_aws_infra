# Setting up vpc, subnet and route table
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  #map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}


resource "aws_subnet" "public_subnet2" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "main_igw"
  }
}

resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.my_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "publicRTassociation" {
  subnet_id  = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "publicRTassociation2" {
  subnet_id  = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.PublicRT.id
}