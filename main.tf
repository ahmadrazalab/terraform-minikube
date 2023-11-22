#########################################################################
# MINICUBE SETUP (uncomment to use this setup instead of k8-cluster)
########################################################################

provider "aws" {
  region = "ap-south-1" # Change this to your desired AWS region
  access_key  = "AAAAAAAAAAAAAAAAAAAAA"
  secret_key  = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
}
resource "aws_instance" "minicube" {
  ami           = "ami-0287a05f0ef0e9d9a" # Replace with your desired AMI ID
  instance_type = "t2.small"   # instance type
  key_name      = "MYAWSKEY"    # key name
  tags = {
    Name = "K8-tf-minicube"
  }
  user_data = file("./user-data-k8-minicube.sh")    # user data file 
  vpc_security_group_ids = ["sg-011712e13a3c1877a"]  # vpc security group id
  subnet_id = "subnet-e7a6ffab"       # subnet id
  
  // Additional block device for 20GB EBS volume
  ebs_block_device {
    device_name = "/dev/sda1"  // Change this to an available device name
    volume_size = 20
    volume_type = "gp2"  // General Purpose SSD (default)
    delete_on_termination = true
  }
}




