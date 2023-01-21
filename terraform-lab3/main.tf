module "vpc" {
  source="./vpc"
  cidr_block_vpc="10.0.0.0/16"
  cidr_block_pubrw="0.0.0.0/0"
 
}
module "proxy1" {
  source = "./subnet-proxy1"
  vpc-id-from-mod=module.vpc.vpc-id
  availability_zone_proxy1="us-east-1a"
  cidr_block_proxy1="10.0.0.0/24"
  name-proxy1="proxy1-pub"
  rw-id=module.vpc.rout-table-id
}
module "proxy2" {
  source = "./subnet-proxy2"
  vpc-id-from-mod=module.vpc.vpc-id
  availability_zone_proxy2="us-east-1b"
  cidr_block_proxy2="10.0.2.0/24"
  name-proxy2="proxy2-pub"
  rw-id=module.vpc.rout-table-id
}
module "subnet-private1" {
  source="./subnet-private1"
  vpc-id-from-mod=module.vpc.vpc-id
  availability_zone_subnet_private1="us-east-1a"
  cidr_block_subnet_private1="10.0.1.0/24"
  name-subnet_private1="proxy1-private"
}
module "subnet-private2" {
  source = "./subnet-private2"
  vpc-id-from-mod=module.vpc.vpc-id
  availability_zone_subnet_private2="us-east-1b"
  cidr_block_subnet_private2="10.0.3.0/24"
  name-subnet_private2="proxy2-private"
}
