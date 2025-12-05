resource "aws_ecr_repository" "iac-ecr" {
  name = var.ECR_name
  force_delete = true
}
