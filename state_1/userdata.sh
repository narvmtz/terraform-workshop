#!/bin/bash
sudo -u ec2-user whoami
sudo yum update -y
sudo yum install pip -y
cd /tmp/
wget https://github.com/facevedom/hello-from/archive/refs/tags/v1.0.zip
unzip v1.0.zip
cd hello-from-1.0
pip install -r requeriments.txt
FLASK_APP=/tmp/hello-from-1.0/hello_from.py /usr/local/bin/flask run --host=0.0.0.0
