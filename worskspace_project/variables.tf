variable "ami" {
  default = "ami-08fe36427228eddc4"
}
# variable "instance_type" {
#     default = "t2.micro"
# }
variable "region" {
  default = "ap-south-1"
}
variable "instance_type" {
  type = map(any)
  default = {
    "development"  = "t2.micro"
    "production" = "t2.micro"
  }

}
variable "key_name" {
  type = map(any)
  default = {
    "development"  = "mumbai"
    "production" = "singapore"

  }


}
