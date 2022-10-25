module "security_group__node" {
  source  = "tedilabs/network/aws//modules/security-group"
  version = "0.24.0"

  name        = "${module.cluster.name}-node-user"
  description = "Security group for EKS nodes."
  vpc_id      = local.vpc.id

  ingress_rules = [
    {
      id          = "ssh/cidrs"
      description = "Allow CIDRs to communicate with MySQL Server."
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22

      cidr_blocks = [local.vpc.cidr_block]
    },
    {
      id          = "mine1/cidrs"
      description = "Allow CIDRs to communicate with MySQL Server."
      protocol    = "tcp"
      from_port   = 25565
      to_port     = 25565

      cidr_blocks = [local.vpc.cidr_block]
    },
      {
      id          = "mine2/cidrs"
      description = "Allow CIDRs to communicate with MySQL Server."
      protocol    = "tcp"
      from_port   = 25575
      to_port     = 25575

      cidr_blocks = [local.vpc.cidr_block]
    },
    {
      id          = "mine3/cidrs"
      description = "Allow CIDRs to communicate with MySQL Server."
      protocol    = "tcp"
      from_port   = 4326
      to_port     = 4326

      cidr_blocks = [local.vpc.cidr_block]
    },
    {
      id          = "grafana/cidrs"
      description = "Allow CIDRs to communicate with MySQL Server."
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80

      cidr_blocks = [local.vpc.cidr_block]
    },
     {
      id          = "prometheus/cidrs"
      description = "Allow CIDRs to communicate with MySQL Server."
      protocol    = "tcp"
      from_port   = 9090
      to_port     = 9090

      cidr_blocks = [local.vpc.cidr_block]
    },
        {
      id          = "eksweb/cidrs"
      description = "Allow CIDRs to communicate with MySQL Server."
      protocol    = "tcp"
      from_port   = 9091
      to_port     = 9091

      cidr_blocks = [local.vpc.cidr_block]
    },
    
  ]
  egress_rules = [
    {
      id          = "all/all"
      description = "Allow nodes to communicate to the Internet."
      protocol    = "-1"
      from_port   = 0
      to_port     = 0

      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}
