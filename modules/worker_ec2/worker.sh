#!/bin/bash
echo "Creating Boundary Directory"
cd /home/ec2-user || echo "No ec2-user directory"

echo "Downloading Boundary worker zip"
wget https://releases.hashicorp.com/boundary-worker/0.11.0+hcp/boundary-worker_0.11.0+hcp_linux_386.zip
unzip boundary-worker*

echo "Run the worker"
chmod +x boundary-worker
cp /run/boundary/worker-config.hcl worker-config.hcl
cat << EOF >> worker-start.sh
#!/bin/bash
IP4=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
sed -ie "s/PUBLIC_IP/\$IP4/" /home/ec2-user/worker-config.hcl
EOF
chmod +x worker-start.sh
chown -R ec2-user:ec2-user /home/ec2-user
echo 'runuser -l ec2-user -c "/home/ec2-user/worker-start.sh 2>&1 | tee /tmp/start-worker.logs &"' | at now +3 minutes
echo 'runuser -l ec2-user -c "/home/ec2-user/boundary-worker server -config=worker-config.hcl 2>&1 | tee /tmp/boundary-worker.logs &"' | at now +5 minutes
