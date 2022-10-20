variable "config_file" {
  description = "The path of configuration YAML file."
  type        = string
  default     = "./config.yaml"
}

variable "private_subnet_tags" {}
variable "public_subnet_tags" {}