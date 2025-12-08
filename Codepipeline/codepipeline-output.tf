output "codepiepline_role_arn" {
  value = aws_iam_role.iac-codepipeline-role.arn
}

output "codepipeline_policy_arn" {
  value = aws_iam_policy.iac-codepipeline-policy.arn
}
