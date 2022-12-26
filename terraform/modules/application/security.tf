resource "aws_security_group" "teamcity_server_sg" {
  name	 = "teamcity-server-security-group"
  vpc_id = var.vpc_id

  ingress {
    from_port	        = 22
    to_port	        = 22
    protocol	        = "tcp"
    security_groups     = [ aws_security_group.bastion_sg.id ]
  }

  ingress {
    from_port           = 8111
    to_port             = 8111
    protocol            = "tcp"
    security_groups     = [ aws_security_group.load_balancer_sg.id ]
  }

  ingress {
    from_port           = 443
    to_port             = 443
    protocol            = "tcp"
    security_groups     = [ aws_security_group.load_balancer_sg.id ]
  }

  egress {
    from_port	        = 0
    to_port	        = 0
    protocol	        = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }

  tags = {
     Name          = "teamcity-server-security-group"
     Created_by    = "terraform"
   }
}

resource "aws_security_group" "load_balancer_sg" {
  name        = "load-balancer-security_group"
  description = "SG for load balancer https target group"
  vpc_id      = var.vpc_id

  ingress {
    from_port          = 443
    to_port            = 443
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  ingress {
    from_port          = 444
    to_port            = 444
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  egress {
    from_port          = 0
    to_port            = 0
    protocol           = "-1"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  tags = {
     Name          = "load_balancer_security_group"
     Created_by    = "terraform"
   }
}

resource "aws_security_group" "bastion_sg" {
  name        = "bastion-security_group"
  description = "SG for bastion host"
  vpc_id      = var.vpc_id

  ingress {
    from_port          = 22
    to_port            = 22
    protocol           = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }

  tags = {
     Name          = "bastion-security-group"
     Created_by    = "terraform"
   }
}

resource "aws_security_group" "production_sg" {
  name        = "production-security-group"
  vpc_id      = var.vpc_id

  ingress {
    from_port           = 22
    to_port             = 22
    protocol            = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  ingress {
    from_port           = 8080
    to_port             = 8080
    protocol            = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  ingress {
    from_port           = 8081
    to_port             = 8081
    protocol            = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  ingress {
    from_port           = 8082
    to_port             = 8082
    protocol            = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  ingress {
    from_port           = 8083
    to_port             = 8083
    protocol            = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  ingress {
    from_port           = 8084
    to_port             = 8084
    protocol            = "tcp"
    cidr_blocks        = ["0.0.0.0/0"]
    ipv6_cidr_blocks   = ["::/0"]
  }

  egress {
    from_port           = 0
    to_port             = 0
    protocol            = "-1"
    cidr_blocks         = ["0.0.0.0/0"]
    ipv6_cidr_blocks    = ["::/0"]
  }

  tags = {
     Name          = "production-security-group"
     Created_by    = "terraform"
   }

}
