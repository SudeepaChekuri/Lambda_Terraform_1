provider "aws" {
  region = var.aws_region
}

#provider "aws" {
 # alias  = "lambda"
  #region = var.aws_region}

resource "aws_iam_role" "lambda_role" {
  name               = var.lambda_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "lambda_s3_bucket" "example_bucket" {
  bucket = "lambda_s3_bucket"
  # Add other configuration options for the bucket, if needed
}


resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "lambda_policy_attachment"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "example_lambda_function" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_role.arn
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  timeout          = var.lambda_timeout
  memory_size      = var.lambda_memory
  #filename         = "example_lambda_function.py"
  #source_code_hash = filebase64sha256("example_lambda_function.py")

  # Use S3 bucket as the deployment package source
  s3_bucket        = lambda_s3_bucket.example_bucket.bucket
  s3_key           = "example_lambda_function.zip"

  environment {
    variables = {
      EXAMPLE_VARIABLE = "example-value"
    }
  }
}
