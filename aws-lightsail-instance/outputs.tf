output "aws_lightsail_instance_public_ip" {
  description = "Public IP address of the Lightsail instance"
  value       = aws_lightsail_instance.antinone.public_ip_address
}

output "aws_lightsail_instance_private_ip" {
  description = "Private IP address of the Lightsail instance"
  value       = aws_lightsail_instance.antinone.private_ip_address
}


output "aws_lightsail_instance_public_key" {
  description = "Public Key of the Lightsail instance"
  value       = aws_lightsail_key_pair.antinone_key.public_key

}