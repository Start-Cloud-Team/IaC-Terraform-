output "ecr_name" {
  value = aws_ecr_repository.iac-ecr.arn
}

output "ecr_url" {
  value = aws_ecr_repository.iac-ecr.repository_url
}