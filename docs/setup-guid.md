# Guia de Configuração Detalhado

## 4. Gestão de Utilizadores

```bash
# Criar grupos
sudo groupadd developers
sudo groupadd sysadmins

# Criar usuários
sudo useradd -m -G developers joao
sudo useradd -m -G developers maria
sudo useradd -m -G sysadmins admin_sys

# Definir senhas
sudo passwd joao
sudo passwd maria
sudo passwd admin_sys

# Configurar sudo para sysadmins
sudo visudo -f /etc/sudoers.d/sysadmins
# Adicionar: %sysadmins ALL=(ALL) ALL
5. Servidor Web Apache
bash
# Instalar Apache
sudo dnf install httpd -y

# Iniciar e habilitar
sudo systemctl start httpd
sudo systemctl enable httpd

# Criar diretório do site
sudo mkdir -p /var/www/company

# Criar página de teste
echo "<h1>Empresa Corp - RHEL 9</h1>
<p>Servidor: $(hostname)</p>
<p>Data: $(date)</p>" | sudo tee /var/www/company/index.html

# Configurar Virtual Host
sudo vi /etc/httpd/conf.d/company.conf
# [conteúdo do company.conf]

# Ajustar SELinux
sudo dnf install -y policycoreutils-python-utils
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/company(/.*)?"
sudo restorecon -Rv /var/www/company

# Recarregar Apache
sudo systemctl reload httpd

# Testar
curl http://localhost
6. Monitoramento
bash
# Criar script de monitoramento
vi ~/monitor.sh
# [conteúdo do monitor.sh]

chmod +x ~/monitor.sh
./monitor.sh

# Opcional: mover para diretório de scripts
mkdir -p ~/linux-sysadmin-lab/scripts/
cp ~/monitor.sh ~/linux-sysadmin-lab/scripts/
7. Backup Automatizado
bash
# Criar diretório de backup
sudo mkdir -p /backup
sudo chown $USER:$USER /backup

# Criar script de backup
vi ~/backup.sh
# [conteúdo do backup.sh]

chmod +x ~/backup.sh
./backup.sh

# Agendar no Cron
crontab -e
# Adicionar: 0 2 * * * /home/admin/backup.sh
8. Segurança SSH
bash
# Backup do arquivo original
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Editar configuração
sudo vi /etc/ssh/sshd_config
# Alterar: PermitRootLogin no

# Reiniciar serviço
sudo systemctl restart sshd
9. Firewall
bash
# Liberar serviços
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# Verificar
sudo firewall-cmd --list-all
Verificação Final
bash
# Executar suite de testes
./tests/test-lab.sh
