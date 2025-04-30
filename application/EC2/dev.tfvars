ami_id                  = "ami-0b86aaed8ef90e45f"
instance_type           = "t2.micro"
key_name                = "proj3-key"
subnet_id               = "subnet-0e777117a6b83fc20"
instance_profile_name   = "proj3-role"
security_group_ids      = ["sg-01047e76889d77eac"]
vpc_id = "vpc-0dd608a8eb96b5417"
enable_termination_protection = true

user_data = <<-EOF
  #!/bin/bash
  yum update -y
  yum install -y httpd
  systemctl start httpd
  systemctl enable httpd
  echo "Hello from Terraform and Apache!" > /var/www/html/index.html
  echo "Hello from Terraform!" > /home/ec2-user/hello.txt
EOF


tags = {
  Name        = "simple-ec2"
  Environment = "dev"
  Role        = "Infrastructure"
}
