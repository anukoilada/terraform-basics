data "aws_ami" "my_ami" {
  most_recent      = true
  name_regex       = "Lab-Ami-With-Ansible-Installed"
  owners           = ["self"] 
}