variable "alb"{
  type = string
  default = "iac-alb"
  description = "alb name"
}

variable "tg_blue"{
  type = string
  default = "iac-alb-blue-tg"
  description = "tg blue name"
}

variable "tg_green"{
  type = string
  default = "iac-alb-green-tg"
  description = "tg green name"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC created by the vpc module."
}

variable "pb_subnet_a_id" {
  type        = string
  description = "The subnet_a of the VPC created by the vpc module."
}

variable "pb_subnet_c_id" {
  type        = string
  description = "The subnet_c of the VPC created by the vpc module."
}