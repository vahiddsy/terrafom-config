// Provider variables
variable "region" { default = "us-east-1" }
variable "access_key" {}
variable "secret_key" {}

// Resource variables
variable "instance_name" {
  description = "Name of the Lightsail instance"
}
variable "availability_zone" { default = "a" }
variable "os" { default = "ubuntu_20_04" }
variable "instance_type" { default = "nano_3_0" }


variable "domain" { default = "example.com" }

variable "ssh_key_path" {
  type    = string
  default = "~/.ssh/id_rsa"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "user_data_script" {
  default = <<-EOF
            #!/bin/bash
            sudo apt update
            sudo apt -y install jq net-tools
            EOF
}

variable "ssh_user" {
  type    = string
  default = "ubuntu"
}
