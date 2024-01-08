# Configure the AWS Provider
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}
resource "aws_s3_bucket" "terra_state" {
  bucket = "aajkadin05012024"
  tags = {
    name = "terraform_statebackup"
    Env  = "dev"
  }
}
## versioning for bucket
resource "aws_s3_bucket_versioning" "ver" {
  bucket = aws_s3_bucket.terra_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
#EC2 region mum
resource "aws_instance" "mum001" {
>>>>>>> f4fc7911c1b47e2589d6dd0cdd6e8527effcd091
  ami           = "ami-08fe36427228eddc4"
  instance_type = "t2.micro"
  key_name      = "terkey"
  tags = {
    Name = "todaywebser"
>>>>>>> f4fc7911c1b47e2589d6dd0cdd6e8527effcd091
    Envo = "Linux"
  }
}
#DYnomo DB
resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform_state"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}
