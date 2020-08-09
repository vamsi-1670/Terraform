
provider "aws" {
  access_key = "AKIA35K4OV7XDOVMRK5Q"
  secret_key = "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"
  region = "us-west-2"
}
### Resource to provision public key
#resource "aws_key_pair" "deployer-key" {
# key_name   = "deployer-key"
#  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhSRwfUqIoUqp6F6L8uRSws1cqU1Vpe2L0qZ7IXuGDSFeXiNstL+3ovP3QvDPVMMuEcXu+TJcGebKx6grtabKA93sdiYmQKD8iBZ5Q+5m0IaR45SSoa6jgq09Tust4uZIl5Blx6yQWg8dLSGxjAVqetTN1k2ksG+WJqb0QpqBb4SnQgrgSCEOS0BqNnCnEySawjYrbn4A/7WKJMWRwOUiM3Mmf84mIt85cGR3qdqHT8jGqZRdpjLfCu1qxQmun7yCvIUZZqiajaLxyVHnhtS72xBNZpp7ArFnIn3RdGEWBC1HlMg0P8VBCa7d47RTHJMqkVFqA1EHpDrmlLpljhyUT root@vagrant"
#  }
### Resource to provision VPC 
resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  
  tags = {
    Name = "demo-vpc"
    }
}
### Resource to provision Subnet
#resource "aws_subnet" "main" {
#  vpc_id     = "aws_vpc.main.id"
  #cidr_block = "192.168.0.0/24"
    
#}
### Resource to create Security group with inbound traffic ports 22 & 80.
#resource "aws_security_group" "main" {
#  name = "test-SG"
#  description = "Allow inbound traffic"
#  vpc_id = "aws_vpc.main.id"
#  ingress {
#    description = "SSH_ACESS"
##    from_port = 22
#    to_port = 22
#    protocol = "tcp"
#    cidr_blocks = ["192.168.0.0/24"]
#}
# ingress {
#    description = "HTTP_ACCESS"
#    from_port = 80
#    to_port = 80
#    protocol = "tcp"
#    cidr_blocks = ["192.168.0.0/24"]
#}
#
#}
### Resource to provision ec2 instance
#resource "aws_instance" "main" {
#  ami = "ami-0d1cd67c26f5fca19"
#  instance_type = "t2.micro"
#  key_name = "${aws_key_pair.deployer-key.key_name}"
#  security_groups = ["aws_security_group.main.id"]
# subnet_id = "aws_subnet.main.id"
#  
#}
