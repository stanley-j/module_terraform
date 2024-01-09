
module "vpc" {
    source = "./modules/vpc"

    #create vpc
    cidr_block       = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy
    Name             = var.vpc_tag_Name

    #Create Public subnet #1
    cidr_block_pubsub           = var.pub_subnet_1a_cidr_block
    map_public_ip_on_launch     = var.pub_subnet_1a_map_public_ip_on_launch
    availability_zone           = var.pub_subnet_1a_availability_zone
    Name_pubsub                 = var.pub_subnet_1a_tag_Name

    #Create Public subnet #2
    cidr_block_pubsub_2               = var.pub_subnet_2a_cidr_block
    map_public_ip_on_launch_pubsub_2  = var.pub_subnet_2a_map_public_ip_on_launch
    availability_zone_pubsub_2        = var.pub_subnet_2a_availability_zone
    Name_pubsub_2                     = var.pub_subnet_2a_tag_Name

    #Create Private subnet #1
    cidr_block_pri_sub_1              = var.pri_subnet_1b_cidr_block
    map_public_ip_on_launch_pri_sub_1 = var.pri_subnet_1b_map_public_ip_on_launch
    availability_zone_pri_sub_1       = var.pri_subnet_1b_availability_zone
    Name_pri_sub_1                    = var.pri_subnet_1b_tag_Name

    #Create Private subnet #2
    cidr_block_pri_sub_2        = var.pri_subnet_2b_cidr_block
    availability_zone_pri_sub_2 = var.pri_subnet_2b_availability_zone
    Name_pri_sub_2              = var.pri_subnet_2b_tag_Name

    #Create Internet gateway
    Name_igw = var.igw_Name

    #Create Route Table for Public Subnets
    cidr_block_rt = var.pub_rt_cidr_block
    Name_rt = var.pub_rt_tag_Name
  
}

module "sg" {
    source = "./modules/security_group"

    #Create Security group for VPC
    name        = var.sg_vpc_name
    description = var.sg_vpc_description

        #ingress
        from_port   = var.sg_vpc_ingress_1_from_port
        to_port     = var.sg_vpc_ingress_1_to_port
        protocol    = var.sg_vpc_ingress_1_protocol
        cidr_blocks = var.sg_vpc_ingress_1_cidr_blocks

        #ingress
        from_port_1   = var.sg_vpc_ingress_2_from_port
        to_port_1     = var.sg_vpc_ingress_2_to_port
        protocol_1    = var.sg_vpc_ingress_2_protocol
        cidr_blocks_1 = var.sg_vpc_ingress_2_cidr_blocks
        
        #engress
        from_port_2   = var.sg_vpc_egress_1_from_port
        to_port_2     = var.sg_vpc_egress_1_to_port
        protocol_2    = var.sg_vpc_egress_1_protocol
        cidr_blocks_2 = var.sg_vpc_egress_1_cidr_blocks

    #Create a Security group for Database server
    name_db        = var.sg_db_name
    description_db = var.sg_db_description

        #ingress
        from_port_db       = var.sg_db_ingress_1_from_port
        to_port_db         = var.sg_db_ingress_1_to_port
        protocol_db        = var.sg_db_ingress_1_protocol

        #egress
        from_port_sg   = var.sg_db_egress_1_from_port
        to_port_sg     = var.sg_db_egress_1_to_port
        protocol_sg    = var.sg_db_egress_1_protocol
        cidr_blocks_sg = var.sg_db_egress_1_cidr_blocks


}


module "alb" {
    source = "./modules/alb"

     name     = var.alb_tg_name
     port     = var.alb_tg_port
     protocol = var.alb_tg_protocol

     name_lb            = var.lb_name
     internal           = var.lb_internal
     load_balancer_type = var.lb_load_balancer_type

     port_lb_l       = var.lb_lner_port
     protocol_lb_l   = var.lb_lner_protocol
     type            = var.lb_lner_type

     port_lb      = var.lb_tg_2a_port

     port_lb_attach     = var.lb_tg_2b_port
}    


module "ec2" {
    source = "./modules/ec2"

    ami                         = var.ec2_2a_ami
    instance_type               = var.ec2_2a_instance_type
    associate_public_ip_address = var.ec2_2a_associate_public_ip_address


    ami_ec2                         = var.ec2_2b_ami
    instance_type_ec2               = var.ec2_2b_instance_type
    associate_public_ip_address_ec2 = var.ec2_2b_associate_public_ip_address

}    


module "rds" {
    source = "./modules/rds"

  allocated_storage      = var.db_instance_allocated_storage
  db_name                = var.db_instance_db_name
  engine                 = var.db_instance_engine
  engine_version         = var.db_instance_engine_version
  instance_class         = var.db_instance_instance_class
  username               = var.db_instance_username
  password               = var.db_instance_password
  parameter_group_name   = var.db_instance_parameter_group_name
  db_subnet_group_name   = var.db_instance_db_subnet_group_name
  skip_final_snapshot    = var.db_instance_skip_final_snapshot
  name  = var.rds_subnet_group_name
}    

