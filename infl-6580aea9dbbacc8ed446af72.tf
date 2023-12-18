import {
  to = aws_lambda_function.radio-export-77b
  id = "radio-export"
}


resource "aws_lambda_function" "radio-export-77b" {
  architectures = ["x86_64"]
  function_name = "radio-export"
  handler       = "lambda_function.lambda_handler"
  role          = "arn:aws:iam::821020995254:role/service-role/radio-scraper-role-s6pbe61t"
  runtime       = "python3.12"
  tracing_config {
    mode = "PassThrough"
  }
  # The following attributes have default values introduced when importing the resource into terraform: [publish timeouts]
  lifecycle {
    ignore_changes = [publish, timeouts]
  }
}

