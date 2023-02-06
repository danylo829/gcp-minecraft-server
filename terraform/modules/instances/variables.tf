variable "network_name" {}

variable "instance_address" {}

variable "machine_type" {
  type = string
  default = "e2-micro"
}

variable "instance_name" {
  type = string
  description = "The name of instance"
}

variable "ssh_user" {
  type        = string
  default     = "user"
  description = "Username for ssh key"
}

variable "ssh_pub_key_path" {
  type = string
  default = "~/.ssh/id_rsa.pub"
  description = "Path for public ssh key"
}
