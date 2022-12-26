variable "vpc_cidr" {
  default = "186.12.0.0/22"
}

variable "public_cidr" {
  default = "186.12.0.0/24"
}

variable "private_cidr" {
  default = "186.12.1.0/24"
}

variable "public_private_cidr" {
  default = "186.12.2.0/24"
}
