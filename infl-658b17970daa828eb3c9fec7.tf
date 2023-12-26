resource "aws_s3_bucket" "rmaury-lambda-datastore-cf9" {
  bucket = "rmaury-lambda-datastore"
  tags = {
    app = "radio-scraper"
  }
}

