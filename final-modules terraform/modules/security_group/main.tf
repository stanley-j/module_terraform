#Create Security group for VPC
resource "aws_security_group" "my_vpc_sg" {
  name        = var.name
  description = var.description
  vpc_id      = module.my_vpc.id                   # aws_vpc.my_vpc.id

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    from_port   = var.from_port_1
    to_port     = var.to_port_1
    protocol    = var.protocol_1
    cidr_blocks = var.cidr_blocks_1
  }

  egress {
    from_port   = var.from_port_2
    to_port     = var.to_port_2
    protocol    = var.protocol_2
    cidr_blocks = var.cidr_blocks_2
  }
}

#Create a Security group for Database server
resource "aws_security_group" "db_sg" {
  name        = var.name_db
  description = var.description_db
  vpc_id      = module.my_vpc.id
  ingress {
    from_port       = var.from_port_db
    to_port         = var.to_port_db
    protocol        = var.protocol_db
    security_groups = [aws_security_group.my_vpc_sg.id]
  }

  egress {
    from_port   = var.from_port_sg
    to_port     = var.to_port_sg
    protocol    = var.protocol_sg
    cidr_blocks = var.cidr_blocks_sg
  }
}
