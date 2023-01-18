sudo yum install at -y
sudo systemctl start atd
sudo systemctl enable atd

read -r -d '' CRONTAB <<'EOF'
SHELL=/bin/bash
0 * * * * root echo "sh /usr/local/etc/saturate-disk.sh > /var/log/service.log 2>&1" | at now + $(( RANDOM \% 10 )) minutes
EOF

sudo touch /etc/cron.d/schedule2
sudo echo "$CRONTAB" > /etc/cron.d/schedule2
sudo chmod 600 /etc/cron.d/schedule2