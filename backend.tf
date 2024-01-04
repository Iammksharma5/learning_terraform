terraform {
  backend "s3" {
    region = "ap-south-1"
    bucket = "aajkadin05012024"
    key    = "tf_state_main/terraform.tfstate"
    dynamodb_table = "terraform_state"
  }
}
