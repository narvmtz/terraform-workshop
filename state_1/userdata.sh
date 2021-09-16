#!/bin/bash
sudo -u ec2-user whoami
sudo yum update -y && sudo yum install python3 pip3 -y
cd /tmp/
wget https://github.com/sagudeloo/hello-from/archive/refs/tags/v1.0.zip
unzip v1.0.zip
cd hello-from-1.0
pip3 install -r requirements.txt
FLASK_APP=/tmp/hello-from-1.0/app.py /usr/local/bin/flask run --host=0.0.0.0
