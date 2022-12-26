resource "aws_instance" "bastion_instance" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  subnet_id              = var.public_sub_id
  key_name               = var.key_name

  tags = {
     Name          = "bastion_instance"
     Created_by    = "terraform"
   }
}

resource "aws_instance" "teamcity_server_instance" {
  ami                    = "ami-0fb653ca2d3203ac1"
  instance_type          = "t2.medium"
  vpc_security_group_ids = [aws_security_group.teamcity_server_sg.id]
  subnet_id              = var.private_sub_id
  key_name               = var.key_name
  iam_instance_profile   = var.agent_profile_name
  user_data	         = "${file("init.sh")}"

  root_block_device {
    volume_size = 20
  }

  tags = {
     Name          = "teamcity_server_instance"
     Created_by    = "terraform"
  }
}

#resource "aws_instance" "production_instance" {
#  ami                    = "ami-0fb653ca2d3203ac1"
#  instance_type          = "t2.medium"
#  vpc_security_group_ids = [aws_security_group.production_sg.id]
#  subnet_id              = var.private_sub_id
#  key_name               = var.key_name
#  user_data              = "${data.template_file.setup_production.rendered}"

#  root_block_device {
#    volume_size = 20
#  }

#  tags = {
#     Name          = "minion_instance"
#     Created_by    = "terraform"
#   }
#}

