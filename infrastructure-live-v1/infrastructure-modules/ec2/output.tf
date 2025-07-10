output "launch_template_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.this.id
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.this.public_ip
}

output "web_url" {
  description = "URL to access the web server"
  value       = "http://${aws_instance.this.public_ip}:8002/"
}
