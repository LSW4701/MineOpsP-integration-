resource "aws_eip" "openvpn" {
  tags = merge(
    {
      "Name" = "${local.vpc.name}-openvpn"
    },
    local.common_tags,
  )
}

resource "aws_eip_association" "openvpn" {
  instance_id   = aws_instance.openvpn.id
  allocation_id = aws_eip.openvpn.id
}

resource "aws_eip" "jenkins" {
  tags = merge(
    {
      "Name" = "${local.vpc.name}-jenkins"
    },
    local.common_tags,
  )
}

resource "aws_eip_association" "jenkins" {
  instance_id   = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins.id
}

resource "aws_eip" "argo" {
  tags = merge(
    {
      "Name" = "${local.vpc.name}-argo"
    },
    local.common_tags,
  )
}

resource "aws_eip_association" "arg" {
  instance_id   = aws_instance.argo.id
  allocation_id = aws_eip.argo.id
}