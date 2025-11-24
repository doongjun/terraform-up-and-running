resource "aws_instance" "example" {
	ami			= "ami-04fcc2023d6e37430"
	instance_type		= "t2.micro"
	vpc_security_group_ids	= [aws_security_group.instance.id]
	
	user_data	= <<-EOF
			  #!/bin/bash
			  cd /home/ec2-user
			  echo "Hello, World!" > index.html
			  python3 -m http.server ${var.server_port} >/dev/null 2>&1 &
			  EOF

	user_data_replace_on_change	= true

	key_name	= "terraform-example-key"
	tags	= {
		Name = "terraform-example"
	}
}

resource "aws_security_group" "instance" {
	name 	= "terraform-example-instance"

	ingress {
		from_port	= var.server_port
		to_port		= var.server_port
		protocol	= "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
	}
}

variable "server_port" {
	description	= "The port the server will use for HTTP requests"
	type		= number
	default		= 8080
}

output "public_ip" {
	value		= aws_instance.example.public_ip
	description	= "The public IP address of the web server"
}
