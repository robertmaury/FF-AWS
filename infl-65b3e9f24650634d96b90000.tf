import {
  to = aws_lambda_function.radio-export-c6a
  id = "radio-export"
}


import {
  to = aws_s3_bucket.rmaury-lambda-datastore-cf9
  id = "rmaury-lambda-datastore"
}


resource "aws_lambda_function" "radio-export-c6a" {
  architectures = ["x86_64"]
  function_name = "radio-export"
  handler       = "lambda_function.lambda_handler"
  role          = "arn:aws:iam::821020995254:role/service-role/radio-scraper-role-s6pbe61t"
  runtime       = "python3.7"
  tags = {
    app = "radio-scraper"
  }
  tracing_config {
    mode = "PassThrough"
  }
  # The following attributes have default values introduced when importing the resource into terraform: [publish timeouts]
  lifecycle {
    ignore_changes = [publish, timeouts]
  }
}


resource "aws_s3_bucket" "rmaury-lambda-datastore-cf9" {
  bucket = "rmaury-lambda-datastore"
  tags = {
    app = "radio-scraper"
  }
}

