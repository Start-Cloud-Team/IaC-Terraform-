####################ECR create####################
resource "aws_ecr_repository" "iac-ecr" {
  name = var.ecr_name
  force_delete = true

}
