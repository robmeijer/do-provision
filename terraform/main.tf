# Configure the AWS provider
provider "aws" {
  profile = "terraform"
  region = "${var.region}"
}

data "aws_ami" "php-base" {
  most_recent = true
  owners = ["self"]
  filter {
    name = "tag:Role"
    values = ["php-base"]
  }
}

# Create a web server
resource "aws_instance" "web" {
  tags {
    Name = "web-1"
  }
  ami = "${data.aws_ami.php-base.id}"
  instance_type = "t2.micro"
  key_name = "Office Mac"
}
