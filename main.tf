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
<<<<<<< HEAD
resource "aws_instance" "mum001" {
=======
resource "aws_instance" "mumbai102" {
>>>>>>> e06850e8cebf9b448093710570a60c1ea2d4055f
  ami           = "ami-08fe36427228eddc4"
  instance_type = "t2.micro"
  key_name      = "terkey"
  tags = {
<<<<<<< HEAD
    Name = "todaywebser"
=======
    Name = "webserver_mumbai002"
>>>>>>> e06850e8cebf9b448093710570a60c1ea2d4055f
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
