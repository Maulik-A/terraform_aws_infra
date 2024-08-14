terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}


# creating ssh-key
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}


# creating ec2 instance VM
resource "aws_instance" "app_server" {
  ami = "${var.image_id}"
  associate_public_ip_address = true
  instance_type = "${var.instance_type}"

  subnet_id              = aws_subnet.public_subnet.id
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "ubuntu-vm"
  }
  
 user_data = file("${path.module}/script.sh")
}

resource "aws_db_subnet_group" "default_subnet" {
  name = "main subnet group"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.public_subnet2.id]

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "rds_instance" {
  db_name = "mydb"
  identifier = "pg"
  allocated_storage = 20
  engine = "postgres"
  engine_version = "16.3"
  instance_class = "db.t3.micro"
  username = "adminuser"
  password = "adminpassword"
  db_subnet_group_name = aws_db_subnet_group.default_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible = true
  skip_final_snapshot = true

  tags = {
    Name = "main-rds-instance"
  }
  
}