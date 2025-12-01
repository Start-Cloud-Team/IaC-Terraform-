resource "aws_lb" "iac-alb" {
    name               = "iac-alb"
    load_balancer_type = "application"
    subnets            = [aws_subnet.iac-public-subnet1.id, aws_subnet.iac-public-subnet2.id]
    security_groups = [aws_security_group.iac-alb-sg.id]
}

resource "aws_lb_listener" "iac-alb-listener"{
    load_balancer_arn = aws_lb.iac-alb.arn
    port = 8080
    protocol = "HTTP"

    default_action{
      type = "fixed-response"

      fixed_response{
        content_type = "text/plain"
        message_body = "404: page not found - T101 Study"
        status_code  = 404
      }
    }
}

resource "aws_lb_target_group" "iac-alb-blue-target-group"{
  name = "iac-alb-blue-target-group"
  port = 8080
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.iac-vpc.id

    health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "404"
    interval            = 200
    timeout             = 100
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group" "iac-alb-green-target-group"{
  name = "iac-alb-green-target-group"
  port = 8080
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = aws_vpc.iac-vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "404"
    interval            = 200
    timeout             = 100
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}
