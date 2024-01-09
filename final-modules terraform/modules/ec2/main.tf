#Create EC2 instances in public subnets
resource "aws_instance" "Pub2a_ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id                   = module.Public_sub2a.id
  security_groups             = [aws_security_group.my_vpc_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Code finally Worked.EC2 instance launched in us-west-2a!!!</h1>" > var/www/html/index.html
    EOF
}

resource "aws_instance" "Pub2b_ec2" {
  ami                         = var.ami_ec2
  instance_type               = var.instance_type_ec2
  associate_public_ip_address = var.associate_public_ip_address_ec2
  subnet_id                   = module.Public_sub2b.id
  security_groups             = [aws_security_group.my_vpc_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Code finally Worked.EC2 instance launched in us-west-2b!!!</h1>" > var/www/html/index.html
    EOF
}
