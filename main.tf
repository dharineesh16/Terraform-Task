provider "aws" {
  region = "ap-south-1" 
  alias  = "ap-south"
}

provider "aws" {
  region = "ap-southeast-1" 
  alias  = "ap-southeast"
}

resource "aws_instance" "south_instance" {
  provider      = aws.ap-south
  ami           = "ami-0a1235697f4afa8a4"
  instance_type = "t2.micro"

  tags = {
    Name = "south-Coast-Instance"
  }
}

resource "aws_instance" "southeast_instance" {
  provider      = aws.ap-southeast
  ami           = "ami-0e7f9c9fced6cfb10"
  instance_type = "t2.micro"

  tags = {
    Name = "southeast-Coast-Instance"
  }
}

output "south_instance_public_ip" {
  value = aws_instance.south_instance.public_ip
}

output "southeast_instance_public_ip" {
  value = aws_instance.southeast_instance.public_ip
}