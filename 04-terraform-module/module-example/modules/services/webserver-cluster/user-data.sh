#!/bin/bash
cd /home/ec2-user
cat > index.html << EOF
<h1>Hello, World!</h1>
<p>This is a simple web server running on an EC2 instance.</p>
<p>Connected to DB at: ${db_address}:${db_port}</p>
EOF

python3 -m http.server ${server_port} >/dev/null 2>&1 &