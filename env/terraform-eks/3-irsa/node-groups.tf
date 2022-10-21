data "aws_ami" "latest" {
  for_each = toset(["1.20", "1.21"])

  owners      = ["602401143452"]
  most_recent = true

  filter {
    name = "name"
    values = [
      "amazon-eks-node-${each.value}-v*",
    ]
  }
}

module "node_group__app" {
  source  = "tedilabs/container/aws//modules/eks-node-group"
  version = "0.14.0"
  



  cluster_name = module.cluster.name
  name         = "${module.cluster.name}-app-v1.23-node"
  
  desired_size = 2  # autuscale 
  min_size     = 1
  max_size     = 2

  instance_type    = "t3.small"
  instance_ami     = "ami-0073aeb06ceb4b0dc"    # ami 최신 버전 매번 바뀌니 하드코딩 
  instance_ssh_key = "linux_s" # 개인 public ssh 키
  instance_profile = module.cluster.iam_roles["node"].instance_profile_name


  associate_public_ip_address = true
  subnet_ids                  = local.subnet_groups["public"].ids
  security_group_ids = [
    module.cluster.security_group_ids["node"],
    module.security_group__node.id,
  ]

 
  # cni_custom_networking_enabled = true

  node_labels = {
    role = "app"
    team = "apne2-mineops"  # 
  }
  node_taints = []
   
  tags = {  ##
     monitoring = true 
     owner = "lsw2"
     terraform = true
   }

   monitoring_enabled = true  # 모니터링 on 
}



module "eks__user_data" {  # 구글링중...
  source  = "terraform-aws-modules/eks/aws//modules/_user_data"
  version = "18.30.2"

  cluster_name = module.cluster.name
  cluster_service_ipv4_cidr= "172.20.0.0/16"
  user_data_template_path = "files/userdata.sh"



# openvpn_userdata = templatefile("${path.module}/files/userdata.sh", {
#     vpc_cidr  = local.vpc.cidr_block
#     public_ip = aws_eip.openvpn.public_ip
#   })

}


