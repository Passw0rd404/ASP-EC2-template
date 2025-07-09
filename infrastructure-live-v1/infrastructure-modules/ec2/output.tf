output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.this.id
}

output "launch_template_latest_version" {
  description = "Latest version of the launch template"
  value       = aws_launch_template.this.latest_version
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.this.public_dns
}

output "web_url" {
  description = "URL to access the web server"
  value       = "http://${aws_instance.this.public_ip}"
}

output "private_key_pem" {
  value     = tls_private_key.this.private_key_pem
  sensitive = true
}
