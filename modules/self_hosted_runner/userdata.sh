#!/bin/bash
set -eux
dnf -y update
dnf install -y git
git version
yum install perl-Digest-SHA -y
yum install libicu -y
sudo -u ec2-user mkdir -p /home/ec2-user/actions-runner
cd /home/ec2-user/actions-runner
curl -o actions-runner-linux-x64-2.328.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.328.0/actions-runner-linux-x64-2.328.0.tar.gz
echo "01066fad3a2893e63e6ca880ae3a1fad5bf9329d60e77ee15f2b97c148c3cd4e  actions-runner-linux-x64-2.328.0.tar.gz" | shasum -a 256 -c
sudo -u ec2-user tar xzf ./actions-runner-linux-x64-2.328.0.tar.gz
echo "Setup complete" >> /var/log/user-data.log