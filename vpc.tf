# module "vpc" {
#   source     = "github.com/antonioazambuja/terraform-aws-vpc"
#   cidr_block = "10.51.0.0/16"
#   vpc_tags   = {
#     Name = "MainVPC"
#   }
#   public_subnets = [
#     {
#       availability_zone = "us-east-1a"
#       newbits = 8
#     },
#     {
#       availability_zone = "us-east-1b"
#       newbits = 8
#     },
#     {
#       availability_zone = "us-east-1c"
#       newbits = 8
#     },
#     {
#       availability_zone = "us-east-1d"
#       newbits = 8
#     },
#     {
#       availability_zone = "us-east-1e"
#       newbits = 8
#     },
#   ]
#   private_subnets = [
#     {
#       availability_zone = "us-east-1a"
#       newbits = 5
#     },
#     {
#       availability_zone = "us-east-1b"
#       newbits = 5
#     },
#     {
#       availability_zone = "us-east-1c"
#       newbits = 5
#     },
#     {
#       availability_zone = "us-east-1d"
#       newbits = 5
#     },
#     {
#       availability_zone = "us-east-1e"
#       newbits = 5
#     },
#   ]
#   public_subnet_tags = {
#     AccessMode = "PUBLIC"
#   }
#   igw_tags = {
#     Name = "MainIGW"
#   }
#   rt_igw_tags = {
#     Name = "MainIGW"
#   }
#   private_subnet_tags = {
#     AccessMode = "PRIVATE"
#   }
#   eip_nat_tags = {
#     Name = "EIPVpc"
#   }
#   nat_gateway_tags = {
#     Name = "MainNATGateway"
#   }
#   rt_nat_tags = {
#     Name = "MainNATGateway"
#   }
# }