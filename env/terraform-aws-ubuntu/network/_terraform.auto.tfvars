env    = "prod"
name   = "prod"
owner  = "lsw"
region = "ap-northeast-2"

# private_subnet_tags = { "kubernetes.io/role/internal-elb" : 1 }     # alb 태그부분
# public_subnet_tags  = { "kubernetes.io/role/elb" : 1 }               # alb  태그부분 
vpc_tags            = {}
tags                = {}

vpc_flow_retention_days = 1