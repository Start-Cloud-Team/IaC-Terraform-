variable "account_id"{
    type = string
    default = "329984431650"
    description = "AWS Account ID"
}

variable "region"{
    type = string
    default = "ap-northeast-2"
    description = "region"
}

variable "cluster_name"{
    type = string
    description = "ecs cluster name"
}

variable "cluster_service_name"{
    type = string
    description = "ecs cluster service name"
}

variable "alb_listener_arn"{
    type = string
    description = "alb listener arn"
}

variable "alb_tg_blue"{
    type = string
    description = "alb target group blue name"
}

variable "alb_tg_green"{
    type = string
    description = "alb target group green name"
}