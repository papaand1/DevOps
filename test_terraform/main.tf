provider "aws" {
  region  = "us-east-1"
  profile = "papa"
}

#-----KEY PAIR-----
resource "aws_key_pair" "papa_auth" {
  key_name = "${var.keyname}"
  public_key = "${file(var.keypath)}"
}

#-----EC2-----
resource "aws_instance" "web" {
  ami           = "ami-6871a115"
  instance_type = "t2.micro"

  tags {
    name = "web terraform"
  }

  key_name = "${aws_key_pair.papa_auth.id}"
}
