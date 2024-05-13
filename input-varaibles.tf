variable "region" {
  description = "region in which my instance will be created"
  type = string 
  default = "us-east-1"
}

variable "instance_type" {
  description = "choose the instance"
  type = string 
  default = "t3.medium"
}

variable "instance_key" {
  description = "choose the instance key"
  type = string 
  default = "gopal"
}