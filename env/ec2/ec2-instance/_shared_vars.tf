variable "backend_s3" {
  default = "lsw-bbk" #"devops-prod-tfbackend-s3"
}

variable "region" {
  default = "ap-northeast-2"
}

variable "vpc_key" {
  default = "apne2/network/vpc/terraform.tfstate"
}

