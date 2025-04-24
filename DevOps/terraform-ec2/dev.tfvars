ami_id                  = "ami-0e449927258d45bc4"
instance_type           = "t2.micro"
key_name                = "newkeypair"
subnet_id               = "subnet-071c11b27aab9c7ef"
instance_profile_name   = "Demo-rule"
security_group_ids      = ["sg-06acda9cc5501a92a"]
vpc_id = "vpc-012046654f5e4ffa6"
enable_termination_protection = true

user_data = <<-EOT
    #!/bin/bash
    set -e
    exec > /var/log/user-data.log 2>&1

    yum update -y
    yum install -y unzip curl

    T_VERSION="1.5.7"
    curl -O https://releases.hashicorp.com/terraform/${T_VERSION}/terraform_${T_VERSION}_linux_amd64.zip
    unzip terraform_${T_VERSION}_linux_amd64.zip
    mv terraform /usr/local/bin/

    terraform -version > /home/ec2-user/terraform_version.txt
    chown ec2-user:ec2-user /home/ec2-user/terraform_version.txt
  EOT


tags = {
  Name        = "terraform-ec2"
  Environment = "dev"
  Role        = "Infrastructure"
}
