terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.20.1"
    }
  }

}

resource "aws_iam_user" "poc-user" {
  name = "poc-user"


}

resource "aws_iam_policy" "policy" {
  policy = file("pipeline-policy.json")
}

resource "aws_iam_user_policy_attachment" "attached_policy" {
  policy_arn = aws_iam_policy.policy.arn
  user       = aws_iam_user.poc-user.name
}