import {
  to = aws_s3_bucket.rmaury-lambda-datastore-cf9
  id = "rmaury-lambda-datastore"
}


import {
  to = aws_s3_bucket_acl.rmaury-lambda-datastore-424
  id = "rmaury-lambda-datastore"
}


import {
  to = aws_s3_bucket_public_access_block.rmaury-lambda-datastore-1c9
  id = "rmaury-lambda-datastore"
}


import {
  to = aws_s3_bucket_server_side_encryption_configuration.rmaury-lambda-datastore-91b
  id = "rmaury-lambda-datastore"
}


resource "aws_s3_bucket" "rmaury-lambda-datastore-cf9" {
  bucket = "rmaury-lambda-datastore"
  tags = {
    app = "radio-scraper"
  }
}


resource "aws_s3_bucket_acl" "rmaury-lambda-datastore-424" {
  access_control_policy {
    grant {
      grantee {
        id   = "7db6dd8ef499c1b71362e5a8bad83bfd483878ec0f8b965f90686ac84980acdb"
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }
    owner {
      display_name = "daquinox+AWSGeneral"
      id           = "7db6dd8ef499c1b71362e5a8bad83bfd483878ec0f8b965f90686ac84980acdb"
    }
  }
  bucket = "${aws_s3_bucket.rmaury-lambda-datastore-cf9.id}"
}


resource "aws_s3_bucket_public_access_block" "rmaury-lambda-datastore-1c9" {
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = "${aws_s3_bucket.rmaury-lambda-datastore-cf9.id}"
  ignore_public_acls      = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_server_side_encryption_configuration" "rmaury-lambda-datastore-91b" {
  bucket = "${aws_s3_bucket.rmaury-lambda-datastore-cf9.id}"
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = false
  }
}

