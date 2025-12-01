action "aws_codebuild_start_build" "deploy" {
  config {
    project_name = aws_codebuild_project.iac-webgoat-codebuild.name
    source_version = "main"
    timeout        = 1800

    environment_variables_override {
      name  = "ENVIRONMENT"
      value = "production"
      type  = "PLAINTEXT"
    }

    environment_variables_override {
      name  = "API_KEY"
      value = "/prod/api-key"
      type  = "PARAMETER_STORE"
    }
  }
}
