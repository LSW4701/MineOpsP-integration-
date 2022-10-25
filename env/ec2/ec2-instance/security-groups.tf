module "sg__ssh" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "0.24.0"

  name        = "${local.vpc.name}-ssh"
  description = "Security Group for SSH."
  vpc_id      = local.vpc.id

  ingress_rules = [
    {
      id          = "ssh"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow SSH from anywhere."
    },
  ]
  egress_rules = []

  tags = local.common_tags
}


module "sg__openvpn" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "0.24.0"

  name        = "${local.vpc.name}-openvpn"
  description = "Security Group for OpenVPN."
  vpc_id      = local.vpc.id

  ingress_rules = [
    {
      id          = "openvpn/all"
      protocol    = "udp"
      from_port   = 1194
      to_port     = 1194
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow OpenVPN from anywhere."
    },
     {
      id          = "http /all"
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80   # from_port  0 , to_port 80 으로하면 0-80 으로됨 
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
    {
      id          = "https /all"
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443   
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
    {
      id          = "web9091 /all"
      protocol    = "tcp"
      from_port   = 9091
      to_port     = 9091  
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
  ]
  egress_rules = [
    {
      id          = "weball/all"
      description = "Allow to communicate to the Internet."
      protocol    = "-1"
      from_port   = 0
      to_port     = 0

      cidr_blocks = ["0.0.0.0/0"]
    },
    
  ]

  tags = local.common_tags
}


module "sg__jenkins" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "0.24.0"

  name        = "${local.vpc.name}-jenkins"
  description = "Security Group for jenkins."
  vpc_id      = local.vpc.id

  ingress_rules = [
  
     {
      id          = "jen8080 /all"
      protocol    = "tcp"
      from_port   = 8080
      to_port     = 8080   
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
    {
      id          = "jen8081 /all"
      protocol    = "tcp"
      from_port   = 8081
      to_port     = 8081   
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
    {
      id          = "jen50000 /all"
      protocol    = "tcp"
      from_port   = 50000
      to_port     = 50000 
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
     {
      id          = "jen1044 /all"
      protocol    = "tcp"
      from_port   = 1044
      to_port     = 1044 
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
  ]
  egress_rules = [
    {
      id          = "jenall/all"
      description = "Allow to communicate to the Internet."
      protocol    = "-1"
      from_port   = 0
      to_port     = 0

      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  tags = local.common_tags
}

module "sg__argo" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "0.24.0"

  name        = "${local.vpc.name}-argo"
  description = "Security Group for argo."
  vpc_id      = local.vpc.id

  ingress_rules = [
  
     {
      id          = "argo5556 /all"
      protocol    = "tcp"
      from_port   = 5556
      to_port     = 5558   
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
    {
      id          = "argo6379 /all"
      protocol    = "tcp"
      from_port   = 6379
      to_port     = 6379   
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
    {
      id          = "argo8080 /all"
      protocol    = "tcp"
      from_port   = 8080
      to_port     = 8085 
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
     {
      id          = "argo9121 /all"
      protocol    = "tcp"
      from_port   = 9121
      to_port     = 9121 
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
       {
      id          = "argo7000 /all"
      protocol    = "tcp"
      from_port   = 7000
      to_port     = 7000 
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
        {
      id          = "argo9001 /all"
      protocol    = "tcp"
      from_port   = 9001
      to_port     = 9001 
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow wen from anywhere."
    },
  ]
  egress_rules = [
    {
      id          = "argoall/all"
      description = "Allow to communicate to the Internet."
      protocol    = "-1"
      from_port   = 0
      to_port     = 0

      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  tags = local.common_tags
}