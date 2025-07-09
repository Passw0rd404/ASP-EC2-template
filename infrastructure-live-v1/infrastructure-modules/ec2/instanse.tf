resource "aws_instance" "this" {
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"  # Use latest version of the template
  }

  tags = {
    Name        = "${var.env}-ASP-server-from-template"
    Environment = var.env
    CreatedBy   = "OpenTofu"
  }
  
}
