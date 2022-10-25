###################################################
# Providers
###################################################

provider "aws" {
  region = "ap-northeast-2"
}

data "aws_eks_cluster_auth" "this" {
  name = module.cluster.name
}


provider "kubernetes" {
  host = module.cluster.endpoint

  cluster_ca_certificate = base64decode(module.cluster.ca_cert)
  token                  = data.aws_eks_cluster_auth.this.token
}

terraform {
   backend "s3" {
    bucket = "lsw-bbk"             #   버켓명 
    key = "apne2/env/terraform-eks/3-irsa/terraform.tfstate"  #  생성되는 폴더/파일명  
    role_arn    = "arn:aws:iam::959714228357:role/terraformAsume"
    region = "ap-northeast-2"
  }
}