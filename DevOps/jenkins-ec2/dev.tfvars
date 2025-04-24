ami_id                 = "ami-0b86aaed8ef90e45f"
instance_type          = "t2.micro"
security_group_ids     = ["sg-0caf3d31b295957f0"]
key_name               = "newkeypair"
subnet_id              = "subnet-0727bd3161b5df4d1"
instance_profile_name  = "Demo-rule"
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
