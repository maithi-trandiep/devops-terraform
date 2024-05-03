provider "aws" {
     region = "eu-north-1"
     access_key = var.AWS_ACCESS_KEY_ID
     secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_key_pair" "name" {
    key_name = "devopspkey"
    public_key = file(var.public_key)
}

resource "aws_instance" "aws_vm" {
    key_name = aws_key_pair.name.key_name
    ami           = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.ssh_access.id]

    tags = {
        Name = "DevOpsMiniProjet-TRAN DIEP REDUREAU"
    }

    depends_on = [ aws_key_pair.name ]
}

resource "aws_security_group" "ssh_access" {
    name = "ssh_access"
    ingress {
        description = "TCP"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 3000
        to_port     = 3000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "null_resource" "connection" {
    connection {
        type = "ssh"
        host = aws_instance.aws_vm.public_ip
        port = 22
        user = var.user
        private_key = file(var.privateKey)
        timeout = "2m"
    }

    provisioner "file" {
      source = "./script.sh"
      destination = "/tmp/script.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update",
            "mv /tmp/script.sh ./script.sh",
            "chmod +x ./script.sh",
            "./script.sh"
        ]
    }

    depends_on = [ aws_instance.aws_vm ]
}

output "public_ip" {
  value = aws_instance.aws_vm.public_ip
}
