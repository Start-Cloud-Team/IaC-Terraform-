####################alb create####################
resource "aws_lb" "iac-alb" {
    name                = "${var.alb}"
    load_balancer_type  = "application"
    subnets = concat([var.pb_subnet_a_id], [var.pb_subnet_c_id])
    security_groups     = [aws_security_group.iac-alb-sg.id]
}

####################alb listener create####################
resource "aws_lb_listener" "iac-alb-listener" {
    load_balancer_arn = aws_lb.iac-alb.arn
    port              = 80
    protocol          = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.iac-alb-blue-tg.arn
    }
}

####################target group create####################
resource "aws_lb_target_group" "iac-alb-blue-tg" {
    name        = "iac-alb-blue-tg"
    port        = 8080
    protocol    = "HTTP"
    target_type = "ip"
    vpc_id      = var.vpc_id

    health_check {
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200-404"
        interval            = 60
        timeout             = 20
        healthy_threshold   = 5
        unhealthy_threshold = 2
    }
}

resource "aws_lb_target_group" "iac-alb-green-tg" {
    name        = "iac-alb-green-tg"
    port        = 8080
    protocol    = "HTTP"
    target_type = "ip"
    vpc_id      = var.vpc_id

    health_check {
        path                = "/"
        protocol            = "HTTP"
        matcher             = "200-404"
        interval            = 60
        timeout             = 20
        healthy_threshold   = 5
        unhealthy_threshold = 2
    }
}

####################alb url create####################
resource "aws_ssm_parameter" "dast_target_url" {
  name      = "/hawk/target_url"
  type      = "String"
  value     = "http://${aws_lb.iac-alb.dns_name}"
  overwrite = true

  depends_on = [
    aws_lb.iac-alb
  ]
}

