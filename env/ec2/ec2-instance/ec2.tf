data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  openvpn_userdata = templatefile("${path.module}/files/userdata.sh", {
    vpc_cidr  = local.vpc.cidr_block
    public_ip = aws_eip.openvpn.public_ip
  })
  

  jenkins_userdata = templatefile("${path.module}/files/jenkin_userdata.sh", {
    vpc_cidr  = local.vpc.cidr_block
    public_ip = aws_eip.openvpn.public_ip
  })
  
  common_tags = {
    "Project" = "utill"
  }
}

resource "aws_instance" "private" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t3.small" #
  subnet_id     = local.subnet_groups["private"].ids[0]
  key_name      = "linux_s" ##

  vpc_security_group_ids = [
    module.sg__ssh.id,
  ]

  tags = {
    Name = "${local.vpc.name}-private"
  }
}


resource "aws_instance" "openvpn" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t3.small"
  subnet_id     = local.subnet_groups["public"].ids[0]
  key_name      = "linux_s" ##

  user_data = local.openvpn_userdata

  associate_public_ip_address = false
  vpc_security_group_ids = [
    module.sg__ssh.id,
    module.sg__openvpn.id,
  ]

  tags = {
    Name = "${local.vpc.name}-web & openvpn(ubuntu)"
  }
}

resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t3.small"
  subnet_id     = local.subnet_groups["public"].ids[0]
  key_name      = "linux_s" ##

  user_data = local.jenkins_userdata

  associate_public_ip_address = false
  vpc_security_group_ids = [
    module.sg__ssh.id,
    module.sg__jenkins.id,
  ]

  tags = {
    Name = "${local.vpc.name}-jenkins"
  }
}

resource "aws_instance" "argo" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = "t3.small"
  subnet_id     = local.subnet_groups["public"].ids[0]
  key_name      = "linux_s" ##

  user_data = local.jenkins_userdata

  associate_public_ip_address = false
  vpc_security_group_ids = [
    module.sg__ssh.id,
    module.sg__argo.id,
  ]

  tags = {
    Name = "${local.vpc.name}-argo"
  }
}