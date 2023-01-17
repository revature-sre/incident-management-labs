#!/bin/bash
sudo yum install at -y
sudo systemctl start atd
sudo systemctl enable atd

read -r -d '' CRONTAB <<'EOF'
SHELL=/bin/bash
0 * * * * root echo "sh /home/ec2-user/consume-cpu.sh > /var/log/aws-monitoring.log 2>&1" | at now + $(( RANDOM \% 10 )) minutes > /dev/null
EOF

sudo touch /etc/cron.d/schedule1
sudo echo "$CRONTAB" > /etc/cron.d/schedule1
sudo chmod 600 /etc/cron.d/schedule1