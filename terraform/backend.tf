terraform {

  backend "s3" {

    bucket         = "mongodb-ha-tfstate-khizar"

    key            = "mongodb-ha/terraform.tfstate"

    region         = "ap-south-1"

    dynamodb_table = "mongodb-ha-lock-table"

    encrypt = true
  }
}
