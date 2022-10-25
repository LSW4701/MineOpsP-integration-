variable "config_file" {
  description = "The path of configuration YAML file."
  type        = string
  default     = "./config.yaml"
}

variable "env" {}
variable "name" {}
variable "owner" {}
variable "region" {}
variable "vpc_tags" {}
variable "tags" {}

variable "vpc_flow_retention_days" {}
variable "vpc_flow_log_format" {
  description = "Private VPC flow log format"
  default     = "$${version} $${account-id} $${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${protocol} $${packets} $${bytes} $${start} $${end} $${action} $${log-status}"
#  default     = "$${version} $${vpc-id} $${subnet-id} $${instance-id} $${interface-id} $${account-id} $${type} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${pkt-srcaddr} $${pkt-dstaddr} $${protocol} $${bytes} $${packets} $${start} $${end} $${action} $${tcp-flags} $${log-status}"
}