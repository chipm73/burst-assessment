/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "Burst-IGW"
  }
}

#/* NAT gateway for the public subnet */
#resource "aws_nat_gateway" "default" {
#  //other arguments

#  depends_on = ["aws_internet_gateway.default"]
#}

/* Public subnet */
resource "aws_subnet" "public" {
  count = "${length(var.public-az-subnet-mapping)}"

  cidr_block        = "${lookup(var.public-az-subnet-mapping[count.index], "cidr")}"
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "${lookup(var.public-az-subnet-mapping[count.index], "az")}"

  tags {
    Name = "${lookup(var.public-az-subnet-mapping[count.index], "name")}"
  }

  depends_on = ["aws_internet_gateway.default"]
}

/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name = "Burst-Public-route-table"
  }
}

/* Associate the routing table to public subnet */
resource "aws_route_table_association" "public" {
  count          = "${length(var.public-az-subnet-mapping)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
