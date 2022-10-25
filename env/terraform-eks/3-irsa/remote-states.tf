locals {
  remote_states = {
    "network" = data.terraform_remote_state.network.outputs
  }
  vpc           = local.remote_states["network"].vpc
  subnet_groups = local.remote_states["network"].subnet_groups
}


###################################################
# Terraform Remote States (External Dependencies)
###################################################

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = var.backend_s3
    key    = var.vpc_key
    region = var.region
  }
}


