#!/bin/bash

echo "====================================="
echo "   RELATORIO DE MONITORAMENTO"
echo "   Servidor: $(hostname)"
echo "   Data: $(date)"
echo "====================================="
echo ""

echo ">> USO DA CPU:"
top -bn1 | grep "Cpu(s)"

echo ""
echo ">> USO DA MEMORIA:"
free -h

echo ""
echo ">> USO DOS DISCOS:"
df -h

echo ""
echo ">> SERVIÇOS CRÍTICOS:"
systemctl is-active httpd --quiet && echo "  Apache: ATIVO" || echo "  Apache: INATIVO"
systemctl is-active sshd --quiet && echo "  SSH:  ATIVO" || echo "  SSH:  INATIVO"

echo "====================================="
