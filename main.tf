resource "aws_instance" "example" {
	ami			= "ami-04fcc2023d6e37430"
	instance_type		= "t2.micro"
	vpc_security_group_ids	= [aws_security_group.instance.id]
	
	user_data	= <<-EOF
			  #!/bin/bash
			  cd /home/ec2-user
			  echo "Hello, World!" > index.html
			  python3 -m http.server 8080 >/dev/null 2>&1 &
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
		from_port	= 8080
		to_port		= 8080
		protocol	= "tcp"
		cidr_blocks	= ["0.0.0.0/0"]
	}
}
