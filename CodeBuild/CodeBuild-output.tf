output "codebuild_role_arn" {
  value = aws_iam_role.iac-codebuild-role.arn
}

output "codebuild_policy_arn" {
  value = aws_iam_policy.iac-codebuild-policy.arn
}

output "codebuild_name" {
  value = aws_codebuild_project.iac-codebuild.name
}
