# vpc dev 
data "terraform_remote_state" "s3_backend" {
  backend = "s3"
  config = {
    bucket = "lea-07192023-terraform-state"
    key    = "dwp/a02_dwp_vpc_dev/terraform.tfstate"
    region = "us-east-1" # Set the region of your S3 bucket
  }
}