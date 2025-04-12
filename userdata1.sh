#!/bin/bash

# Update and install Apache
apt update -y
apt install -y apache2

# Enable and start Apache
systemctl enable apache2
systemctl start apache2

# Fetch EC2 metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
AVAILABILITY_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

# Create HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>AWS EC2 Info</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      padding: 50px;
      background-color: #f9f9f9;
    }
    .card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      padding: 40px;
      display: inline-block;
    }
    h2 {
      margin: 20px 0 10px;
    }
    .logo {
      width: 300px;
    }
  </style>
</head>
<body>
  <div class="card">
    <img src="https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png" width="200" alt="AWS Training and Certification">

    <h2>EC2 Instance ID: <span style="color: #333;">$INSTANCE_ID</span></h2>
    <h3>Zone: <span style="color: #333;">$AVAILABILITY_ZONE</span></h3>
  </div>
</body>
</html>
EOF
