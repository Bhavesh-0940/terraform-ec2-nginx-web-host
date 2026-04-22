resource aws_key_pair my_key {
    key_name = "${var.intance_key}"
     public_key = file("terra-key-ec2.pub")
}
resource aws_default_vpc default {

}
resource aws_security_group  my_security_group {
    name = "auto-sg"
    description = "Allow SSH and HTTP"
    vpc_id = aws_default_vpc.default.id
     

    ingress {
        from_port = 22
        to_port  = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
     }

    ingress {
       from_port = 80
        to_port  = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
     
      egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    tags = {
        Name = "auto-sg"
    }

}
 
 resource aws_instance my_instance {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = var.intance_type
    ami = var.ec2_ami_id

user_data = file("install_nginx.sh")
    root_block_device {
        volume_size = var.aws_root_storage_size
    }
    tags = {
        Name = "my-instance-22-04"
    }
 }