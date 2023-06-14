variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "lambda_role_name" {
  description = "Name of the IAM role for the Lambda function"
  type        = string
  default     = "lambda-role"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "example-lambda-function"
}

variable "lambda_handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.8"
}

variable "lambda_timeout" {
  description = "Timeout for the Lambda function (in seconds)"
  type        = number
  default     = 10
}

variable "lambda_memory" {
  description = "Memory size for the Lambda function (in MB)"
  type        = number
  default     = 128
}

variable "lambda_s3_bucket" {
  description = "S3 bucket name for the Lambda function deployment package"
  type        = string
  default     = "lambda_s3_bucket"
}

variable "lambda_s3_key" {
  description = "Object key (file path) for the Lambda function deployment package in the S3 bucket"
  type        = string
  default     = "s3-key"
}
