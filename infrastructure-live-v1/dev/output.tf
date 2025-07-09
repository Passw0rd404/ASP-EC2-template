output "launch_template_id" {
  value = module.ec2.launch_template_id
}

output "launch_template_latest_version" {
  value = module.ec2.launch_template_latest_version
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_public_ip" {
  value = module.ec2.instance_public_ip
}

output "instance_public_dns" {
  value = module.ec2.instance_public_dns
}

output "web_url" {
  value = module.ec2.web_url
}

output "private_key_pem" {
  value = module.ec2.private_key_pem
  sensitive = true
}
