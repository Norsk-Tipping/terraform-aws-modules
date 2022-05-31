resource "aws_iam_role" "aws-codestar-service-role" {
  name = "test-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "codestar.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "aws-codestar-service-role-attachment" {
  policy_arn = arn:aws:iam::aws:policy/service-role/AWSCodeStarServiceRole
  role       = aws_iam_role.aws-codestar-service-role.name
}
