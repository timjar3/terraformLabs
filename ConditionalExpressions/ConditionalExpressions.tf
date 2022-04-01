provider "aws" {
  region     = "us-west-2"
  access_key = "your_access_key"
  secret_key = "your_secret_key"
}
# conditional variable

variable "istest"{}

# if QAenv == true, then creat this resource       QA environment or Dev environment

# ec2-instance for test
resource "aws_instance" "test" {
  ami = "ami-0800fc0fa715fdcfe"
  instance_type = "t2.micro"
  count=var.istest == true ? 1 : 0
  # if the value of variable istest is true, than the count will be set to 1 (here the count 1 can be modified)
  # and one insatce of this resource will be created.
  }

# ec2-instance for prod
# if QAenv == false, then creat this resource        QA environment or Dev environment
resource "aws_instance" "prod" {
    ami = "ami-0800fc0fa715fdcfe"
    instance_type = "t2.large"
    count=var.istest == false ? 1 : 0
    # if the value of variable istest is false, than the count will be set to 1
    # and one instance of this resource Prod will be created.
    }
