provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "my-bucket-tf-0406"
    key    = "terraform.tfstate"
    region = var.region

    dynamodb_table = "my-DB-table-0406"  # Add the DynamoDB table name for state locking.
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "my-DB-table-0406"  # Use the same name for DynamoDB table in backend.
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
