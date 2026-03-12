#!/bin/bash

echo "TESTANDO LABORATÓRIO LINUX"
echo "============================="

# Teste 1: Serviços
echo -n "Apache: "
systemctl is-active httpd --quiet && echo "success" || echo "failed"

echo -n "SSH: "
systemctl is-active sshd --quiet && echo "success" || echo "failed"

echo -n "Firewall: "
systemctl is-active firewalld --quiet && echo "success" || echo "failed"

# Teste 2: Firewall
echo -n "Firewall - HTTP: "
sudo firewall-cmd --list-services | grep -q http && echo "success" || echo "failed"

echo -n "Firewall - SSH: "
sudo firewall-cmd --list-services | grep -q ssh && echo "success" || echo "failed"

# Teste 3: Apache
echo -n "Apache - Resposta: "
curl -s -I http://localhost | grep -q "200 OK" && echo "success" || echo "failed"

# Teste 4: Scripts
echo -n "Script monitor.sh: "
[ -f ~/monitor.sh ] && echo "success" || echo "failed"

echo -n "Script backup.sh: "
[ -f ~/backup.sh ] && echo "success" || echo "failed"

# Teste 5: Backup
echo -n "Backup existe: "
[ -d /backup ] && ls /backup/*.tar.gz >/dev/null 2>&1 && echo "success" || echo "failed"

# Teste 6: Usuários
echo -n "Grupo developers: "
getent group developers >/dev/null && echo "success" || echo "failed"

echo -n "Grupo sysadmins: "
getent group sysadmins >/dev/null && echo "success" || echo "failed"

# Teste 7: SELinux
echo -n "SELinux Enforcing: "
[ "$(getenforce)" = "Enforcing" ] && echo "success" || echo "failed"

# Teste 8: SSH Hardening
echo -n "SSH PermitRootLogin no: "
sudo grep "^PermitRootLogin no" /etc/ssh/sshd_config >/dev/null && echo "success" || echo "failed"

# Teste 9: Cron
echo -n "Cron job configurado: "
crontab -l 2>/dev/null | grep -q backup.sh && echo "success" || echo "failed"

echo "============================="
