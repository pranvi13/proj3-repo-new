
module "ec2_module" {
  source = "../../modules/ec2/v0"  # Path to your module
  ami_id                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  enable_termination_protection = var.enable_termination_protection
  subnet_id            = var.subnet_id
  instance_profile_name  = var.instance_profile_name
  security_group_ids     = var.security_group_ids

 tags = {
    
    Environment = "dev"
    Role        = "Infrastructure"
  }
}






  
