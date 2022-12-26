resource "aws_lb" "load_balancer" {
  name		        = "public-load-balancer"
  load_balancer_type	= "application"
  security_groups	= [ aws_security_group.load_balancer_sg.id, aws_security_group.teamcity_server_sg.id ]
  subnets	        = [ var.public_sub_id, var.public_private_sub_id ]

  tags = {
     Name          = "public-load-balancer"
     Created_by    = "terraform"
   }
}

resource "aws_lb_target_group" "teamcity_target" {
  name     = "teamcity-target-group"
  port     = 8111
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
     Name          = "teamcity-target-group"
     Created_by    = "terraform"
   }
}

resource "aws_lb_target_group_attachment" "teamcity_target_attachment" {
  target_group_arn = aws_lb_target_group.teamcity_target.arn
  target_id        = aws_instance.teamcity_server_instance.id
  port             = 8111
}

resource "aws_lb_listener" "teamcity_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.teamcity_target.arn
  }

  tags = {
     Name          = "ecs_listener"
     Created_by    = "terraform"
   }
}
