sudo yum install at -y
sudo systemctl start atd
sudo systemctl enable atd

sudo yum install tc -y

read -r -d '' CRONTAB <<'EOF'
SHELL=/bin/bash
0 * * * * root echo "sh /usr/local/etc/cause-latency.sh > /var/log/aws-monitoring.log 2>&1" | at now + $(( RANDOM \% 10 )) minutes
EOF

sudo touch /etc/cron.d/schedule3
sudo echo "$CRONTAB" > /etc/cron.d/schedule3
sudo chmod 600 /etc/cron.d/schedule3