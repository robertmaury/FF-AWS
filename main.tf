import {

  to = aws_lambda_function.radio-scraper-411

  id = "radio-scraper"

}


import {

  to = aws_s3_bucket.rmaury-99x-scrape-cf8

  id = "rmaury-99x-scrape"

}


import {

  to = aws_cloudwatch_log_group.awslambdademo1-573

  id = "/aws/lambda/demo1"

}


import {

  to = aws_dynamodb_table.state-fa5

  id = "state"

}


import {

  to = aws_dynamodb_table._99x-64a

  id = "99x"

}


import {

  to = aws_lambda_layer_version._4-9c7

  id = "arn:aws:lambda:us-east-1:821020995254:layer:scraper_base:4"

}


import {

  to = aws_s3_bucket_object_lock_configuration.rmaury-99x-scrape-a95

  id = "rmaury-99x-scrape"

}


import {

  to = aws_s3_bucket_public_access_block.rmaury-99x-scrape-7ec

  id = "rmaury-99x-scrape"

}


import {

  to = aws_cloudwatch_event_target.owknkyt2p82glsm7qqqf-609

  id = "default/scraper-minute-updater/owknkyt2p82glsm7qqqf"

}


import {

  to = aws_s3_bucket_versioning.rmaury-99x-scrape-4e9

  id = "rmaury-99x-scrape"

}


import {

  to = aws_s3_bucket_server_side_encryption_configuration.rmaury-99x-scrape-65e

  id = "rmaury-99x-scrape"

}


import {

  to = aws_s3_bucket_acl.rmaury-99x-scrape-25a

  id = "rmaury-99x-scrape"

}

# The code was generated for this provider version (it can be changed to your preference). 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_lambda_function" "radio-scraper-411" {
  architectures = ["x86_64"]
  description   = "A simple backend (read/write to DynamoDB) with a RESTful API endpoint using Amazon API Gateway."
  function_name = "radio-scraper"
  handler       = "lambda_function.lambda_handler"
  layers        = ["arn:aws:lambda:us-east-1:821020995254:layer:scraper_base:4"]
  memory_size   = 512
  role          = "arn:aws:iam::821020995254:role/service-role/radio-scraper-role-s6pbe61t"
  runtime       = "python3.11"
  s3_bucket         = "rmaury-lambda-datastore"  # replace with your bucket name
  s3_key            = "radio-scraper.zip"  # replace with your object key

  tags = {
    app                        = "radio-scraper"
    "lambda-console:blueprint" = "microservice-http-endpoint-python"
  }
  timeout = 10
  tracing_config {
    mode = "PassThrough"
  }
  # The following attributes have default values introduced when importing the resource into terraform: [publish timeouts]
  lifecycle {
    ignore_changes = [publish, timeouts]
  }
}

resource "aws_s3_bucket" "rmaury-99x-scrape-cf8" {
  bucket = "rmaury-99x-scrape"
  tags = {
    app = "radio-scraper"
  }
}

resource "aws_cloudwatch_log_group" "awslambdademo1-573" {
  name = "/aws/lambda/demo1"
}

resource "aws_dynamodb_table" "state-fa5" {
  attribute {
    name = "radio"
    type = "S"
  }
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "radio"
  name           = "state"
  stream_enabled = false
  table_class    = "STANDARD"
  tags = {
    app = "radio-scraper"
  }
}

resource "aws_dynamodb_table" "_99x-64a" {
  attribute {
    name = "metadata"
    type = "S"
  }
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "metadata"
  name           = "99x"
  stream_enabled = false
  table_class    = "STANDARD"
  tags = {
    app = "radio-scraper"
  }
}

resource "aws_lambda_layer_version" "_4-9c7" {
  compatible_architectures = ["x86_64"]
  compatible_runtimes      = ["python3.11"]
  layer_name               = "scraper_base"
  source_code_hash         = "sJzkiyrpGL/atPdPCxh4BCP5hVOYIFJfwJmGgoTOzrc="
}

resource "aws_s3_bucket_object_lock_configuration" "rmaury-99x-scrape-a95" {
    bucket              = "rmaury-99x-scrape"
    object_lock_enabled = "Enabled"
}


resource "aws_s3_bucket_public_access_block" "rmaury-99x-scrape-7ec" {
  bucket = "rmaury-99x-scrape"
}

resource "aws_cloudwatch_event_target" "owknkyt2p82glsm7qqqf-609" {
  arn       = "arn:aws:lambda:us-east-1:821020995254:function:radio-scraper"
  rule      = "scraper-minute-updater"
  target_id = "owknkyt2p82glsm7qqqf"
}

resource "aws_s3_bucket_versioning" "rmaury-99x-scrape-4e9" {
  bucket = "rmaury-99x-scrape"
  versioning_configuration {
    mfa_delete = "Disabled"
    status     = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "rmaury-99x-scrape-65e" {
  bucket = "rmaury-99x-scrape"
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = false
  }
}

resource "aws_s3_bucket_acl" "rmaury-99x-scrape-25a" {
  access_control_policy {
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ"
    }
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AllUsers"
      }
      permission = "READ_ACP"
    }
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
      }
      permission = "READ"
    }
    grant {
      grantee {
        type = "Group"
        uri  = "http://acs.amazonaws.com/groups/global/AuthenticatedUsers"
      }
      permission = "READ_ACP"
    }
    grant {
      grantee {
        type = "CanonicalUser"
        id   = "7db6dd8ef499c1b71362e5a8bad83bfd483878ec0f8b965f90686ac84980acdb"
      }
      permission = "FULL_CONTROL"
    }
    owner {
      id = "7db6dd8ef499c1b71362e5a8bad83bfd483878ec0f8b965f90686ac84980acdb"
      display_name      = "daquinox+AWSGeneral"
    }
  }
  bucket = "rmaury-99x-scrape"
}

