#!/bin/bash

SOURCE="/var/www"
DEST="/backup"
DATE=$(date +%Y-%m-%d)
BACKUP_FILE="web_backup_$DATE.tar.gz"

echo "Iniciando backup de $SOURCE..."

# Criar diretório de backup se não existir
sudo mkdir -p $DEST

# Criar backup
sudo tar -czf $DEST/$BACKUP_FILE $SOURCE 2>/dev/null

if [ $? -eq 0 ]; then
    echo " Backup concluído: $DEST/$BACKUP_FILE"
    # Manter apenas backups dos últimos 7 dias
    sudo find $DEST -name "web_backup_*.tar.gz" -mtime +7 -delete
    echo "Backups antigos removidos"
else
    echo "ERRO no backup"
    exit 1
fi

ls -lh $DEST | grep web_backup
