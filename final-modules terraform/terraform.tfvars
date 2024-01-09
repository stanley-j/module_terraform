#Provider
region = "us-west-2"
access_key = "AKIA3OZ5NADRAO65BZXV"
secret_key = "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"

#Create VPC
vpc_cidr_block = "10.0.0.0/16"
instance_tenancy = "default"
vpc_tag_Name = "my_vpc"

#Create Public subnet #1
pub_subnet_1a_cidr_block = "10.0.1.0/24"
pub_subnet_1a_map_public_ip_on_launch = true
pub_subnet_1a_availability_zone = "us-west-2a"
pub_subnet_1a_tag_Name = "Public_sub2a"

#Create Public subnet #2
pub_subnet_2a_cidr_block = "10.0.2.0/24"
pub_subnet_2a_map_public_ip_on_launch = true
pub_subnet_2a_availability_zone = "us-west-2b"
pub_subnet_2a_tag_Name = "Public_sub2b"

#Create Private subnet #1
pri_subnet_1b_cidr_block = "10.0.3.0/24"
pri_subnet_1b_map_public_ip_on_launch = false
pri_subnet_1b_availability_zone = "us-west-2a"
pri_subnet_1b_tag_Name = "Db_Private_sub2a"

#Create Private subnet #2
pri_subnet_2b_cidr_block = "10.0.4.0/24"
pri_subnet_2b_availability_zone = "us-west-2b"
pri_subnet_2b_tag_Name = "Private_sub2b"

#Create Internet gateway
igw_Name = "main_IGW"

#Create Route Table for Public Subnets
pub_rt_cidr_block = "0.0.0.0/0"
pub_rt_tag_Name = "My_Route_Table"

#Create Security group for VPC
sg_vpc_name = "my_vpc_sg"
sg_vpc_description = "Allow inbound traffic to instance"

    #ingress
    sg_vpc_ingress_1_from_port   = 80
    sg_vpc_ingress_1_to_port     = 80
    sg_vpc_ingress_1_protocol    = "tcp"
    sg_vpc_ingress_1_cidr_blocks = ["0.0.0.0/0"]


    #ingress
    sg_vpc_ingress_2_from_port   = 80
    sg_vpc_ingress_2_to_port     = 80
    sg_vpc_ingress_2_protocol    = "tcp"
    sg_vpc_ingress_2_cidr_blocks = ["0.0.0.0/0"]

    #egress
    sg_vpc_egress_1_from_port   = 0
    sg_vpc_egress_1_to_port     = 0
    sg_vpc_egress_1_protocol    = "-1"
    sg_vpc_egress_1_cidr_blocks = ["0.0.0.0/0"]


#Create a Security group for Database server    
sg_db_name = "db_sg"
sg_db_description = "Allows inbound traffic"

    #ingress
    sg_db_ingress_1_from_port       = 3306
    sg_db_ingress_1_to_port         = 3306
    sg_db_ingress_1_protocol        = "tcp"

    #egress
    sg_db_egress_1_from_port   = 0
    sg_db_egress_1_to_port     = 0
    sg_db_egress_1_protocol    = "-1"
    sg_db_egress_1_cidr_blocks = ["0.0.0.0/0"]


#Create an ALB target group
alb_tg_name     = "alb-TG"
alb_tg_port     = 80
alb_tg_protocol = "HTTP"

#Create Load balancer
lb_name     = "my-aws-alb"
lb_internal = false
lb_load_balancer_type = "application"

# Create Load balancer listner rule
lb_lner_port     = "80"
lb_lner_protocol = "HTTP"
lb_lner_type     = "forward"

#Load balancer-Target group attachment
lb_tg_2a_port = 80
lb_tg_2b_port = 80

#Create EC2 instances in 2a public subnets
ec2_2a_ami           = "ami-08e2d37b6a0129927"
ec2_2a_instance_type = "t2.micro"
ec2_2a_associate_public_ip_address = true

#Create EC2 instances in 2b public subnets
ec2_2b_ami           = "ami-08e2d37b6a0129927"
ec2_2b_instance_type = "t2.micro"
ec2_2b_associate_public_ip_address = true

# Create a Database instance
db_instance_allocated_storage      = 10
db_instance_db_name                = "my_private_db"
db_instance_engine                 = "mysql"
db_instance_engine_version         = "5.7"
db_instance_instance_class         = "db.t2.micro"
db_instance_username               = "projectTerraform"
db_instance_password               = "Terraform1234"
db_instance_parameter_group_name   = "default.mysql5.7"
db_instance_db_subnet_group_name   = "db_sub_grp"
db_instance_skip_final_snapshot    = true

#Create RDS instance subnet group
rds_subnet_group_name = "db_sub_grp"









