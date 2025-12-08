
module "codebuild" {
  source = "./CodeBuild"
}

module "ecr" {
  source = "./ECR"
}

module "vpc" {
  source = "./vpc"
}

module "dast-tool" {
  source = "./dast-tool"

  hawk_api_key     = "hawk.vaAWHG3c2zdYtONm25Hf.27xhj5W9ch518coZ1YMr" 
  docker_hub_token = "dckr_pat_Mk9XpmutM9r-TrgVTXggFwSNQt4"

  docker_hub_id    = "alightguy"
}

module "codepipeline" {
  source = "./Codepipeline"

  bucket = module.s3.bucket
}

module "s3" {
  source = "./S3"
}

module "codedeploy" {
  source = "./codedeploy"

  cluster_name = module.ecs.cluster_name
  cluster_service_name = module.ecs.cluster_service_name
  alb_listener_arn = module.alb.alb_listener_arn
  alb_tg_blue             = module.alb.alb_tg_blue
  alb_tg_green            = module.alb.alb_tg_green
}

module "alb" {
  source = "./alb"

  vpc_id = module.vpc.vpc_id
  pb_subnet_a_id = module.vpc.pb_subent_a_id
  pb_subnet_c_id = module.vpc.pb_subnet_c_id
}

module "ecs" {
  source = "./ECS"

  vpc_id = module.vpc.vpc_id
  alb_sg_id = module.alb.alb_sg_id
  ecr_url = module.ecr.ecr_url
  pv_subnet_a = module.vpc.pv_subnet_a
  pv_subnet_c = module.vpc.pv_subnet_c
  tg_blue_arn = module.alb.tg_blue_arn
}

action "aws_codebuild_start_build" "codebuild" {
  config {
    project_name = module.codebuild.codebuild_name
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
