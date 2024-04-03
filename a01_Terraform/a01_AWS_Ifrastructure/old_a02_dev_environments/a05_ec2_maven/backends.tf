terraform {
  backend "s3" {
    bucket = "lea-07192023-terraform-state"
    key    = "dwp/b05_dwp_maven-2/terraform.tfstate"
    region = "us-east-1"
    # encrypt = true
    dynamodb_table = "Lea_Table"
  }
}