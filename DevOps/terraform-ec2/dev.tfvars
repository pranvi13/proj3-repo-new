ami_id                  = "ami-0b86aaed8ef90e45f"
instance_type           = "t2.micro"
key_name                = "proj3-key"
subnet_id               = "subnet-0e777117a6b83fc20"
instance_profile_name   = "proj3-role"
security_group_ids      = ["sg-01047e76889d77eac"]
vpc_id = "vpc-0dd608a8eb96b5417"
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
