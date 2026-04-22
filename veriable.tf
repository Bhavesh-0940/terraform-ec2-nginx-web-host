variable "intance_type" {
    default = "t3.micro"
    type = string
}
variable "aws_root_storage_size" {
    default = 8
    type = number  
}
variable "ec2_ami_id" {
    default = "ami-0ec10929233384c7f"
    type = string
  
}
variable "intance_key" {
    default = "terra-key-ec2"
    type = string
  
}


