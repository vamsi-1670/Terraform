
provider "aws" {
  access_key = "AKIA35K4OV7XFP24ZRXQ"
  secret_key = "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"
  region = "us-west-2"
}
## Resource to provision public key
resource "aws_key_pair" "deployer-key" {
  key_name   = "deployer-key"
  public_key = "<ssh-key>"
  }
## Resource to provision VPC 
resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "test-vpc"
  }
}
## Resource to provision Subnet
resource "aws_subnet" "main" {
  vpc_id     = "aws_vpc.main.id"
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "test-subnet"
  }
}
## Resource to create Security group with inbound traffic ports 22 & 80.
resource "aws_security_group" "main" {
  name = "test-SG"
  description = "Allow inbound traffic"
  vpc_id = "aws_vpc.main.id"
  ingress {
    description = "SSH_ACESS"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["192.168.0.0/24"]
}
 ingress {
    description = "HTTP_ACCESS"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["192.168.0.0/24"]
}

  tags = {
    Name = "allow_tls"
  }

}
## Resource to provision ec2 instance
resource "aws_instance" "example" {
  ami = "ami-0d1cd67c26f5fca19"
  instance_type = "t2.micro"
  key_name = "aws_key_pair.deployer-key.key_name"
  security_groups = ["aws_security_group.main.id"]
  subnet_id = "aws_subnet.main.id"
  
}
