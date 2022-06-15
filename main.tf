provider "aws" {
  region     = "us-east-2"

}

data "aws_key_pair" "example" {
  key_name = "docker"
}

output "fingerprint" {
  value = data.aws_key_pair.example.fingerprint
}

output "name" {
  value = data.aws_key_pair.example.key_name
}

output "id" {
  value = data.aws_key_pair.example.id
}

resource "aws_instance" "linux_server" {
  ami           = "ami-064ff912f78e3e561"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.example.key_name
  tags = {
    Name = "Linux"
  }
}

resource "aws_ebs_volume" "example" {
    availability_zone = "us-east-2a"
    size              = 1
}
