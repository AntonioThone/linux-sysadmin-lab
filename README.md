# 🏢 Linux SysAdmin Lab - RHEL 9

![Linux](https://img.shields.io/badge/OS-RHEL_9-red?style=flat-square&logo=red-hat)
![Apache](https://img.shields.io/badge/Web-Apache-green?style=flat-square&logo=apache)
![Bash](https://img.shields.io/badge/Automation-Bash-yellow?style=flat-square&logo=gnu-bash)
![VMware](https://img.shields.io/badge/VMware-Workstation_17-blue?style=flat-square&logo=vmware)

##  Sobre o Projeto

Este projeto simula um **ambiente de infraestrutura corporativa Linux** completo, implementado no **Red Hat Enterprise Linux 9** rodando no **VMware Workstation 17 Pro**. O objetivo é demonstrar habilidades práticas em administração de sistemas Linux, automação, segurança e documentação.

### Competências Demonstradas

| Área | Tecnologias | O que foi implementado |
|------|-------------|------------------------|
| **Administração Linux** | RHEL 9, systemd | Gestão de usuários, grupos, permissões e serviços |
| **Servidor Web** | Apache, Virtual Host | Site corporativo com configuração personalizada |
| **Segurança** | firewalld, SELinux, SSH | Hardening básico e firewall configurado |
| **Automação** | Bash Scripting, Cron | Scripts de backup e monitoramento agendados |
| **Monitoramento** | Bash, systemd | Script para análise de CPU, memória e disco |
| **Virtualização** | VMware Workstation 17 | Máquina virtual configurada do zero |

## Arquitetura do Projeto













### Componentes da Arquitetura:

- **Camada de Virtualização:** VMware Workstation 17 Pro (2 vCPU, 2GB RAM, 20GB disk)
- **Sistema Operacional:** Red Hat Enterprise Linux 9
- **Serviços:** Apache (httpd), SSH, firewalld, crond
- **Armazenamento:** /var/www (website), /backup (backups)
- **Segurança:** SELinux em modo Enforcing, regras de firewall

---

## Funcionalidades Implementadas em Detalhe

### 1. Gestão de Utilizadores e Permissões

Foram criados grupos e usuários para simular um ambiente corporativo com diferentes níveis de acesso:

```bash
# Grupos
developers    # Acesso padrão
sysadmins     # Acesso administrativo (sudo)

# Usuários
joao       # Membro de developers
maria      # Membro de developers
admin_sys  # Membro de sysadmins
Configuração de Sudo:

bash
# Arquivo: /etc/sudoers.d/sysadmins
%sysadmins ALL=(ALL) ALL
 2. Servidor Web Apache
Website Corporativo:

Diretório: /var/www/company

Virtual Host: company.local

Página de teste com informações do servidor

Configuração do Virtual Host:

apache
<VirtualHost *:80>
    ServerName company.local
    DocumentRoot /var/www/company
    ErrorLog /var/log/httpd/company-error.log
    CustomLog /var/log/httpd/company-access.log combined
</VirtualHost>
Ajustes de Segurança:

SELinux context configurado: httpd_sys_content_t

Firewall: porta 80 liberada

3. Sistema de Monitoramento
Script em Bash que gera relatórios completos do sistema:

bash
#!/bin/bash
# monitor.sh - Relatório de recursos do sistema

./monitor.sh
Saída Exemplo:

text
=====================================
   RELATORIO DE MONITORAMENTO
   Servidor: rhel9-lab.local
   Data: Thu Mar 12 10:12:49 WAT 2026
=====================================

>> USO DA CPU:
  CPU Load: 4.3%
  Load average: 0.00, 0.00, 0.00

>> USO DA MEMÓRIA:
Mem: 1.6G total, 878M used, 353M free

>> USO DOS DISCOS:
Filesystem      Size  Used Avail Use%
/dev/mapper/rhel-root  17G  6.9G  9.6G  42%

>> STATUS DOS SERVIÇOS:
   httpd: ativo
   sshd: ativo
   firewalld: ativo
 4. Backup Automatizado
Script de Backup:

Origem: /var/www/

Destino: /backup/

Formato: web_backup_YYYY-MM-DD.tar.gz

Retenção: 7 dias (backups antigos são removidos)

Agendamento (Cron):

cron
0 2 * * * /home/admin/backup.sh   # Executa todos os dias às 02:00
 5. Configurações de Segurança
SSH Hardening:

ssh
# /etc/ssh/sshd_config
PermitRootLogin no           # Desabilita login direto do root
PasswordAuthentication yes   # Mantido para facilitar o lab
Firewall (firewalld):

bash
# Serviços liberados
sudo firewall-cmd --list-all
# services: cockpit dhcpv6-client http ssh
SELinux:

Modo: Enforcing

Contextos ajustados para o diretório do website

 Tecnologias Utilizadas
Categoria	Tecnologias
Sistema Operacional	Red Hat Enterprise Linux 9 (kernel 5.14)
Virtualização	VMware Workstation 17 Pro
Web Server	Apache HTTP Server (httpd) 2.4.62
Scripting	Bash, Shell Script
Agendamento	Cron (crond)
Firewall	firewalld
Segurança	SELinux, OpenSSH
Versionamento	Git, GitHub
Documentação	Markdown
Estrutura do Repositório
text
linux-sysadmin-lab/
│
├── README.md                      # Este arquivo - visão geral do projeto
│
├── docs/                           # Documentação detalhada
│   ├── setup-guide.md             # Passo a passo completo da instalação
│   ├── architecture.md             # Diagramas e explicação da arquitetura
│   ├── troubleshooting.md          # Problemas comuns e soluções
│   └── screenshots/                 # Evidências do projeto funcionando
│       ├── apache-test.png
│       ├── monitoring-script.png
│       └── firewall-status.png
│
├── scripts/                         # Scripts de automação
│   ├── monitor.sh                   # Script de monitoramento
│   ├── backup.sh                    # Script de backup
│   └── README.md                    # Explicação dos scripts
│
├── configs/                          # Arquivos de configuração
│   ├── company.conf                  # Virtual Host do Apache
│   ├── sshd_config                   # SSH hardening (linhas modificadas)
│   └── sudoers-sysadmins             # Configuração do sudo para sysadmins
│
└── tests/                            # Testes de validação
    └── test-lab.sh                   # Script para testar todas as funcionalidades
Guia Rápido de Implementação
Pré-requisitos
VMware Workstation 17 Pro

ISO do RHEL 9 (gratuito no Red Hat Developer)

Mínimo: 20GB de disco, 2GB de RAM para a VM

Passos Resumidos
Configurar VM no VMware (2 vCPU, 2GB RAM, 20GB disk)

Instalar RHEL 9 com usuário admin

Executar configurações básicas:

bash
sudo dnf update -y
Seguir o guia detalhado em docs/setup-guide.md

Testes de Validação
Para verificar se todas as configurações estão funcionando corretamente:

bash
# Clonar o repositório (se ainda não tiver)
git clone https://github.com/seu-usuario/linux-sysadmin-lab.git
cd linux-sysadmin-lab

# Dar permissão de execução aos scripts
chmod +x scripts/*.sh tests/*.sh

# Executar a suite de testes completa
./tests/test-lab.sh
Saída esperada:

text
🔍 TESTANDO LABORATÓRIO LINUX
=============================
Apache: done!
SSH: done!
Firewall: done!
Firewall - HTTP: done!
Firewall - SSH: done!
Apache - Resposta: done!
Script monitor.sh: done!
Script backup.sh: done!
Backup existe: done!
Grupo developers: done!
Grupo sysadmins: done!
SELinux Enforcing: 
SSH PermitRootLogin no: 
Cron job configurado: 
=============================
 TODOS OS TESTES PASSARAM!
 Competências Demonstradas
Este projeto comprova habilidades práticas em:

 Administração de Sistemas Linux
Instalação e configuração do RHEL 9

Gestão de usuários, grupos e permissões

Gerenciamento de serviços com systemd

Configuração de rede e hostname

Serviços de Rede
Implementação de servidor web Apache

Configuração de Virtual Hosts

Troubleshooting de serviços

 Segurança
Hardening de SSH (desabilitação de login root)

Configuração de firewall com firewalld

Gestão de SELinux (contextos, booleans)

Princípio do menor privilégio (sudo)

 Automação
Criação de scripts em Bash

Agendamento de tarefas com Cron

Backup automatizado com retenção

 Monitoramento
Desenvolvimento de script de monitoramento

Análise de recursos (CPU, memória, disco)

Verificação de status de serviços

 Documentação
Documentação profissional no GitHub

Criação de guias e manuais

Evidências com screenshots

 Diferenciais do Projeto
 RHEL 9 - Utiliza a distribuição corporativa padrão do mercado
 SELinux configurado - Muita gente desliga, aqui foi ajustado corretamente
 Documentação profissional - Não é só código, tem explicações e contexto
 Arquitetura bem definida - Mostra visão sistêmica do ambiente
 Testes automatizados - Valida que tudo está funcionando
 Segurança em camadas - Firewall, SELinux, SSH hardening

 Próximos Passos (Melhorias Futuras)
Automatizar toda a configuração com Ansible

Containerizar o Apache com Docker

Adicionar monitoramento profissional com Prometheus + Grafana

Implementar load balancing com HAProxy

Configurar NFS para backup centralizado

Adicionar banco de dados (MySQL/PostgreSQL)

Implementar SSL/TLS com Let's Encrypt

 Autor
António João Thone
Analista de Infraestrutura | Linux SysAdmin

https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white

 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

 Agradecimentos
Comunidade Red Hat

Documentação oficial do RHEL 9

VMware por fornecer ferramentas de virtualização

 Se este projeto foi útil para você, considere dar uma estrela no GitHub! 

Última atualização: Março 2026
