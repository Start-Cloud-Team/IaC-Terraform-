variable "hawk_api_key" {
  description = "StackHawk API Key"
  type        = string
  sensitive   = true
}

variable "docker_hub_id" {
  description = "Docker Hub ID"
  type        = string
  default     = "alightguy" # 사용자님 ID 고정
}

variable "docker_hub_token" {
  description = "Docker Hub Access Token"
  type        = string
  sensitive   = true
}

variable "s3_log_bucket_name" {
  description = "S3 Bucket name for DAST logs"
  default     = "webgoat-dast-logs-s3-iac" 
}