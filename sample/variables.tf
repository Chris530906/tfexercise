
variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "ami" {
  type    = string
  default = "ami-0d9858aa3c6322f73"
}

variable "publicip" {
  type    = string
  default = "71.41.16.165"
  validation {
    condition = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",var.publicip))
    error_message = "Invalid IP address provided."
  }
}

variable "vpc_id" {
  type    = string
  default = "vpc-068272a401b74bb84"
}







