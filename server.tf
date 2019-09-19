#resource "aws_instance" "server1" {
#  ami               = "${lookup(var.amis, var.region)}"
#  availability_zone = "us-east-1a"
#  instance_type     = "t2.micro"

#subnet_id         = "${aws_subnet.public.id}"
#  security_groups = ["${aws_security_group.web.name}"]
#  key_name        = "burstassessment)"

#  tags {
#    Name = "Server1"
#  }
#}

#resource "aws_instance" "server2" {
#  ami               = "${lookup(var.amis, var.region)}"
#  availability_zone = "us-east-1b"
#  instance_type     = "t2.micro"

#subnet_id         = "${aws_subnet.public.id}"
#  security_groups = ["${aws_security_group.web.name}"]
#  key_name        = "burstassessment)"

#  tags {
#    Name = "Server2"
#  }
#  source_dest_check = false
#  user_data	= "${file("userdata.sh")}"
#  }
#}

/* Web servers */
resource "aws_instance" "server" {
  count           = 2
  ami             = "${lookup(var.amis, var.region)}"
  instance_type   = "t2.micro"
  subnet_id       = "${aws_subnet.public.id}"
  security_groups = ["${aws_security_group.web.id}"]
  key_name        = "burstassessment"

  tags {
    Name = "server"
  }

  source_dest_check = false
  user_data         = "${file("userdata.sh")}"
}
