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


resource "aws_eip" "mineserver1" {
  tags = merge(
    {
      "Name" = "${local.vpc.name}-mineserver1"
    },
    local.common_tags,
  )
}

resource "aws_eip_association" "mineserver1" {
  instance_id   = aws_instance.mineserver1.id
  allocation_id = aws_eip.mineserver1.id
}

resource "aws_eip" "mineserver2" {
  tags = merge(
    {
      "Name" = "${local.vpc.name}-mineserver2"
    },
    local.common_tags,
  )
}

resource "aws_eip_association" "mineserver2" {
  instance_id   = aws_instance.mineserver2.id
  allocation_id = aws_eip.mineserver2.id
}