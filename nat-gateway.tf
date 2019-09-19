resource "aws_nat_gateway" "nat_gateway" {
  count         = "${((var.multi_az_nat_gateway * var.az_count))}"
  subnet_id     = "${element(aws_subnet.public.*.id, count.index)}"
  allocation_id = "${element(aws_eip.mod_nat.*.id, count.index)}"
  depends_on    = ["aws_internet_gateway.default", "aws_eip.mod_nat", "aws_subnet.public"]

  lifecycle = {
    ignore_changes = ["tags"]
  }
}

output "aws_nat_gateway_count" {
  value = "${length(aws_nat_gateway.nat_gateway.*.id)}"
}

output "aws_nat_gateway_ids" {
  value = ["${aws_nat_gateway.nat_gateway.*.id}"]
}
