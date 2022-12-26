resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  description = "Policy for connecting agent to s3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Effect = "Allow"
            Action = [
                "s3:PutObject",
                "s3:GetObject",
                "s3:RestoreObject",
                "s3:DeleteObject"
            ]
            Resource = "arn:aws:s3:::*/*"
        },
        {
            Effect   = "Allow"
            Action   = "s3:ListBucket"
            Resource = "arn:aws:s3:::*"
        }
    ]
  })

  tags = {
     Name          = "s3_policy"
     Created_by    = "terraform"
  }
}

resource "aws_iam_policy_attachment" "s3_attach" {
  name       = "s3_attachment"
  roles      = [aws_iam_role.teamcity_agent_role.name]
  policy_arn = aws_iam_policy.s3_policy.arn
}
