#variable sources {}
variable region {}
variable access_key {}
variable secret_key {}

#create vpc
variable vpc_cidr_block {}
variable instance_tenancy {}
variable vpc_tag_Name {}

#Create Public subnet #1
variable pub_subnet_1a_cidr_block {}
variable pub_subnet_1a_map_public_ip_on_launch {}
variable pub_subnet_1a_availability_zone {}
variable pub_subnet_1a_tag_Name {}

#Create Public subnet #2
variable pub_subnet_2a_cidr_block {}
variable pub_subnet_2a_map_public_ip_on_launch {}
variable pub_subnet_2a_availability_zone {}
variable pub_subnet_2a_tag_Name {}

#Create Private subnet #1
variable pri_subnet_1b_cidr_block {}
variable pri_subnet_1b_map_public_ip_on_launch {}
variable pri_subnet_1b_availability_zone {}
variable pri_subnet_1b_tag_Name {}

#Create Private subnet #2
variable pri_subnet_2b_cidr_block {}
variable pri_subnet_2b_availability_zone {}
variable pri_subnet_2b_tag_Name {}

#Create Internet gateway
variable igw_Name {}

#Create Route Table for Public Subnets
variable pub_rt_cidr_block {}
variable pub_rt_tag_Name {}

#Create Security group for VPC
variable sg_vpc_name {}
variable sg_vpc_description {}

    #ingress
    variable sg_vpc_ingress_1_from_port {}
    variable sg_vpc_ingress_1_to_port {}
    variable sg_vpc_ingress_1_protocol {}
    variable sg_vpc_ingress_1_cidr_blocks {}

    #ingress
    variable sg_vpc_ingress_2_from_port {}
    variable sg_vpc_ingress_2_to_port {}
    variable sg_vpc_ingress_2_protocol {}
    variable sg_vpc_ingress_2_cidr_blocks {}

    #egress
    variable sg_vpc_egress_1_from_port {}
    variable sg_vpc_egress_1_to_port {}
    variable sg_vpc_egress_1_protocol {}
    variable sg_vpc_egress_1_cidr_blocks {}


#Create a Security group for Database server
variable sg_db_name {}
variable sg_db_description {}

    #ingress
    variable sg_db_ingress_1_from_port {}
    variable sg_db_ingress_1_to_port {}
    variable sg_db_ingress_1_protocol {}

    #egress
    variable sg_db_egress_1_from_port {}
    variable sg_db_egress_1_to_port  {}
    variable sg_db_egress_1_protocol {}
    variable sg_db_egress_1_cidr_blocks {}

#Create an ALB target group
variable alb_tg_name {}
variable alb_tg_port {}
variable alb_tg_protocol {}

#Create Load balancer
variable lb_name {}
variable lb_internal {}
variable lb_load_balancer_type {}

# Create Load balancer listner rule
variable lb_lner_port {}
variable lb_lner_protocol {}
variable lb_lner_type {}

#Load balancer-Target group attachment
variable lb_tg_2a_port {}
variable lb_tg_2b_port {}

#Create EC2 instances in 2a public subnets
variable ec2_2a_ami {}
variable ec2_2a_instance_type {}
variable ec2_2a_associate_public_ip_address {}

#Create EC2 instances in 2b public subnets
variable ec2_2b_ami {}
variable ec2_2b_instance_type {}
variable ec2_2b_associate_public_ip_address {}

# Create a Database instance
variable db_instance_allocated_storage {}
variable db_instance_db_name {}
variable db_instance_engine {}
variable db_instance_engine_version {}
variable db_instance_instance_class {}
variable db_instance_username {}
variable db_instance_password {}
variable db_instance_parameter_group_name {}
variable db_instance_db_subnet_group_name {}
variable db_instance_skip_final_snapshot {}

#Create RDS instance subnet group
variable rds_subnet_group_name {}








