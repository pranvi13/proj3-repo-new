ami_id                  = "ami-0e449927258d45bc4"
instance_type           = "t2.micro"
key_name                = "newkeypair"
subnet_id               = "subnet-071c11b27aab9c7ef"
instance_profile_name   = "Demo-rule"
security_group_ids      = ["sg-06acda9cc5501a92a"]
vpc_id = "vpc-012046654f5e4ffa6"
enable_termination_protection = true

user_data = <<-EOF
    #!/bin/bash
    echo "Hello from Terraform!" > /home/ec2-user/hello.txt
EOF

tags = {
  Name        = "simple-ec2"
  Environment = "dev"
  Role        = "Infrastructure"
}
