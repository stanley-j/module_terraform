#create vpc
variable cidr_block {}
variable instance_tenancy {}
variable Name {}

#Create Public subnet #1
variable cidr_block_pubsub {}
variable map_public_ip_on_launch {}
variable availability_zone {}
variable Name_pubsub {}

#Create Public subnet #2
variable cidr_block_pubsub_2 {}
variable map_public_ip_on_launch_pubsub_2 {}
variable availability_zone_pubsub_2 {}
variable Name_pubsub_2 {}

#Create Private subnet #1
variable cidr_block_pri_sub_1 {}
variable map_public_ip_on_launch_pri_sub_1 {}
variable availability_zone_pri_sub_1 {}
variable Name_pri_sub_1 {}

#Create Private subnet #2
variable cidr_block_pri_sub_2 {}
variable availability_zone_pri_sub_2 {}
variable Name_pri_sub_2 {}

#Create Internet gateway
variable Name_igw {}

#Create Route Table for Public Subnets
variable cidr_block_rt {}
variable Name_rt {}




