variable "cluster-policy"{
  type = string
  default = "iac-cluster-policy"
  description = "cluster policy name"
}

variable "cluster-role"{
  type = string
  default = "iac-cluster-role"
  description = "cluster role name"
}

variable "cluster"{
  type = string
  default = "iac-ecs-cluster"
  description = "cluster name"
}

variable "cluster-service"{
  type = string
  default = "iac-cluster-service"
  description = "cluster service name"
}

variable "task-execution-role"{
  type = string
  default = "iac-task-execution-role"
  description = "task execution role name"
}

variable "task-role"{
  type = string
  default = "iac-task-role"
  description = "task role name"
}

variable "sg"{
  type = string
  default = "iac-sg"
  description = "cluster service security group name"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC created by the vpc module."
}

variable "alb_sg_id" {
  type        = string
  description = "The ID of the sg created by the alb module."
}

variable "tg_blue_arn" {
  type        = string
  description = "The arn of the target group blue created by the alb module."
}

variable "pv_subnet_a" {
  type        = string
  description = "The arn of the private subnet_a created by the vpc module."
}

variable "pv_subnet_c" {
  type        = string
  description = "The arn of the private subnet_c created by the vpc module."
}

variable "ecr_url" {
  type        = string
  description = "The URL of the ECR repository created by the ecr module."
}

