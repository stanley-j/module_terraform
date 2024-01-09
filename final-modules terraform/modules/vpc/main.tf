#Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = var.Name
  }
}
#Create Public subnet #1
resource "aws_subnet" "Public_sub2a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_pubsub
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.availability_zone

  tags = {
    Name = var.Name_pubsub
  }
}

#Create Public subnet #2
resource "aws_subnet" "Public_sub2b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_pubsub_2
  map_public_ip_on_launch = var.map_public_ip_on_launch_pubsub_2
  availability_zone       = var.availability_zone_pubsub_2

  tags = {
    Name = var.Name_pubsub_2
  }
}

#Create Private subnet #1
resource "aws_subnet" "db_private_sub2a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.cidr_block_pri_sub_1
  map_public_ip_on_launch = var.map_public_ip_on_launch_pri_sub_1
  availability_zone       = var.availability_zone_pri_sub_1

  tags = {
    Name = var.Name_pri_sub_1
  }
}

#Create Private subnet #2
resource "aws_subnet" "Private_sub2b" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr_block_pri_sub_2
  availability_zone = var.availability_zone_pri_sub_2

  tags = {
    Name = var.Name_pri_sub_2
  }
}

#Create Internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.Name_igw
  }
}

#Create Route Table for Public Subnets
resource "aws_route_table" "my_rt_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.cidr_block_rt
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = var.Name_rt
  }
}

#Associate public subnets with routing table
resource "aws_route_table_association" "Public_sub1_Route_Association" {
  subnet_id      = aws_subnet.Public_sub2a.id
  route_table_id = aws_route_table.my_rt_table.id
}

resource "aws_route_table_association" "Public_sub2_Route_Association" {
  subnet_id      = aws_subnet.Public_sub2b.id
  route_table_id = aws_route_table.my_rt_table.id
}

