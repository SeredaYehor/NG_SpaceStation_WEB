resource "aws_iam_instance_profile" "teamcity_agent_profile" {
  name = "teamcity-agent-profile"
  role = aws_iam_role.teamcity_agent_role.name

  tags = {
     Name          = "teamcity-agent-profile"
     Created_by    = "terraform"
   }

}

resource "aws_iam_role" "teamcity_agent_role" {
  name = "teamcity-agent-role"

  assume_role_policy = <<EOF
  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
  }
  EOF

  tags = {
     Name          = "container-role"
     Created_by    = "terraform"
  }
}
