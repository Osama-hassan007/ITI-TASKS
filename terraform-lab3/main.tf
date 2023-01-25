module "vpc" {
  source="./vpc"
  cidr_block_vpc="10.0.0.0/16"
  cidr_block_pubrw="0.0.0.0/0"
  subnet-id-for-nat=module.proxy1.public-subnet
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
  rw-private-id=module.vpc.rout-table-private-id
}
module "subnet-private2" {
  source = "./subnet-private2"
  vpc-id-from-mod=module.vpc.vpc-id
  availability_zone_subnet_private2="us-east-1b"
  cidr_block_subnet_private2="10.0.3.0/24"
  name-subnet_private2="proxy2-private"
  rw-private2-id=module.vpc.rout-table-private-id
}

module "ec2-proxy1" {
  source="./ec2"
  ami-ec2-proxy1="ami-00874d747dde814fa"
  type-ec2-proxy1="t2.micro"
  status-pub-ip="true"
  sec-gr-pub=[module.vpc.sec-gr-pub]
  proxy1-id=module.proxy1.public-subnet
  ec2_key_name="saw-1"
  ec2-1-name="proxy1"
  local-exec-ec2="echo public_ip1  ${self.public_ip} >> ./public_ip.txt"
}

module "ec2-proxy2" {
  source="./ec2"
  ami-ec2-proxy1="ami-00874d747dde814fa"
  type-ec2-proxy1="t2.micro"
  status-pub-ip="true"
  sec-gr-pub=[module.vpc.sec-gr-pub]
  proxy1-id=module.proxy2.public-subnet2
  ec2_key_name="saw-1"
  ec2-1-name="proxy2"
  local-exec-ec2="echo public_ip2  ${self.public_ip} >> ./public_ip.txt"
}

module "ALB" {
  source = "./ALB"
  name-alb-pub="alb-for-pub"
  sec-gr-pub-alp=[module.vpc.sec-gr-pub]
  pub-subnets=[ module.proxy1.public-subnet , module.proxy2.public-subnet2 ]
  tg-name-pub="tg-for-pub"
  vpc_id_for-tg=module.vpc.vpc-id
  proxy1-id=module.ec2-proxy1.proxy1-id
  proxy2-id=module.ec2-proxy2.proxy2-id
  # --------------------------------------------------------
  name-alb-private="alb-for-private"
  sec-gr-private-alp=[module.vpc.sec-gr-pub]
  private-subnets=[module.subnet-private1.private-subnet1 , module.subnet-private2.private-subnet2 ]
  tg-name-private="tg-for-private"
  apache1-id=module.apache1.apache1-id
  apache2-id=module.apache2.apache2-id

}
module "apache1" {
  source = "./ec2-private"
  ami-ec2-private="ami-00874d747dde814fa"
  type-ec2-private="t2.micro"
  key-private = "saw-1"
  subnet-id-for-ec2private=module.subnet-private1.private-subnet1
  sec-gr-private=[module.vpc.sec-gr-pub]
  ec2-private-name="apache1"
  provisioner-reverse-proxy=[
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "echo 'server { \n listen 80 default_server; \n  listen [::]:80 default_server; \n  server_name _; \n  location / { \n  proxy_pass http://${module.ALB.alp-dns-private}; \n  } \n}' > default",
      "sudo mv default /etc/nginx/sites-enabled/default",
      "sudo systemctl stop nginx",
      "sudo systemctl start nginx"
  ]
}
module "apache2" {
  source = "./ec2-private"
  ami-ec2-private="ami-00874d747dde814fa"
  type-ec2-private="t2.micro"
  key-private= "saw-1"
  subnet-id-for-ec2private=module.subnet-private2.private-subnet2
  sec-gr-private=[module.vpc.sec-gr-pub]
  ec2-private-name="apache2"
  provisioner-reverse-proxy=[
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "echo 'server { \n listen 80 default_server; \n  listen [::]:80 default_server; \n  server_name _; \n  location / { \n  proxy_pass http://${module.ALB.alp-dns-private}; \n  } \n}' > default",
      "sudo mv default /etc/nginx/sites-enabled/default",
      "sudo systemctl stop nginx",
      "sudo systemctl start nginx"
  ]
}