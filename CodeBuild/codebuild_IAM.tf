####################CodeBuild IAM####################
resource "aws_iam_policy" "iac-codebuild-policy" {
  name = "${var.codebuild_name}-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "codestar-connections:UseConnection",
          "s3-object-lambda:*",
          "ssm:Describe*",
          "ssm:Get*",
          "ssm:List*",
          "codebuild:StartBuild",
          "ecr:CreateRepository",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:GetLifecyclePolicy",
          "ecr:GetLifecyclePolicyPreview",
          "ecr:ListTagsForResource",
          "ecr:DescribeImageScanFindings",
          "cloudwatch:GenerateQuery",
          "cloudwatch:GenerateQueryResultsSummary",
          "secretsmanager:GetSecretValue",
          "s3:GetBucketAcl",
          "s3:GetBucketLocation",
          "codebuild:BatchGetBuilds",
          "iam:PassRole",
          "ecs:RegisterTaskDefinition",
          "codedeploy:CreateDeployment",
          "codedeploy:GetDeployment",
          "codedeploy:GetDeploymentGroup"
        ],
        Resource = "arn:aws:codebuild:${var.region}:${var.account_id}:project/${var.codebuild_name}"
      },
      {
        Effect = "Allow",
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:ListImages",
          "ecr:DescribeImages",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:${var.region}:${var.account_id}:log-group:/aws/codebuild/iac-codebuild*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::iac-codepipeline-s3-bucket",
          "arn:aws:s3:::iac-codepipeline-s3-bucket/*"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath"
        ]
        Resource = [
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/devops/sonarcloud/token",
          "arn:aws:ssm:${var.region}:${var.account_id}:parameter/devops/snyk/token"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "secretsmanager:GetSecretValue"
        ],
        Resource = "arn:aws:secretsmanager:${var.region}:${var.account_id}:secret:*"
      }
    ]
  })
}

resource "aws_iam_role" "iac-codebuild-role" {
  name = "${var.codebuild_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "codebuild.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "iac-codebuild-attach" {
  role       = aws_iam_role.iac-codebuild-role.name
  policy_arn = aws_iam_policy.iac-codebuild-policy.arn

}
