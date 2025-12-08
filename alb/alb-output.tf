output "alb_listener_arn"{
    value = aws_lb_listener.iac-alb-listener.arn
}

output "alb_tg_blue"{
    value = var.tg_blue
}

output "tg_blue_arn"{
    value = aws_lb_target_group.iac-alb-blue-tg.arn
}

output "alb_tg_green"{
    value = var.tg_green
}

output "alb_sg_id"{
    value = aws_security_group.iac-alb-sg.id
}

output "alb_dns" {
  value = aws_lb.iac-alb.dns_name
}
