data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["tko-public"]
  }
}

resource "aws_security_group" "websg" {
    vpc_id = "${var.vpc_id}"
    
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"        
        cidr_blocks = ["${var.publicip}/32"]
    }   
    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["${var.publicip}/32"]
    }    

}

resource "aws_instance" "foo" {
    ami           = var.ami
    instance_type = "t2.micro"

    subnet_id = "${data.aws_subnet.subnet.id}"
    vpc_security_group_ids = ["${aws_security_group.websg.id}"]


}