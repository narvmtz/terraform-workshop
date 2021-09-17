output "ec2_public_ip" {
  value = aws_instance.tf_workshop.*.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.tf_workshop.*.private_ip
}

output "ec2_id" {
  value = aws_instance.tf_workshop.*.id
}
