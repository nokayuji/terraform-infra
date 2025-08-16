resource "aws_lb" "lb_web" {
  name               = "dev-alb-web"
  internal           = false
  load_balancer_type = "application"
  subnets            = [var.public_subnet_ids, var.public_subnet_ids_2]
  security_groups    = [aws_security_group.aws_sg_web.id]
}

resource "aws_lb_listener" "lb_lis_web" {
  load_balancer_arn = aws_lb.lb_web.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Invaild Request. Check path or port."
      status_code  = 502
    }
  }
}

resource "aws_lb_target_group" "lb_tg_web" {
  name        = "dev-alb-tg-web"
  target_type = "ip"
  vpc_id      = var.vpc_id
  port        = 80
  protocol    = "HTTP"

  health_check {
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 6
    interval            = 30
  }
}

resource "aws_lb_listener_rule" "lb_lis_rule_web" {
  listener_arn = aws_lb_listener.lb_lis_web.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg_web.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}
