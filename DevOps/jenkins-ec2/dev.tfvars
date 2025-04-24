ami_id                 = "ami-0b86aaed8ef90e45f"
instance_type          = "t2.micro"
security_group_ids     = ["sg-01047e76889d77eac"]
key_name               = "proj3-key"
subnet_id              = "subnet-0e777117a6b83fc20"
instance_profile_name  = "proj3-role"
user_data              = <<-EOF
  #!/bin/bash
  sudo yum update -y

  # Install Java 17 (Amazon Corretto)
  sudo amazon-linux-extras enable corretto17
  sudo yum install -y java-17-amazon-corretto

  # Install Jenkins
  wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  sudo yum install -y jenkins

  # Enable and start Jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
EOF
