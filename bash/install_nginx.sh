#!/bin/bash

LOG_FILE="/usr/local/logs/install_nginx.log"
BACKUP_DIR="/usr/local/backups/nginx"

exec > >(tee -a $LOG_FILE) 2>&1

# Atualiza os pacotes
echo "Atualizando os pacotes..."
sudo apt-get update -y

# Faz o backup da configuração existente do Nginx
NGINX_CONF="/etc/nginx/nginx.conf"
mkdir -p $BACKUP_DIR
cp $NGINX_CONF $BACKUP_DIR/nginx.conf.$(date +%F_%T)
echo "Backup da configuração do Nginx criado em $BACKUP_DIR"

# Instala o Nginx
echo "Instalando o Nginx..."
sudo apt-get install nginx -y

# Instala o Nginx
echo "Instalando o Nginx..."
sudo apt-get install nginx -y

# Inicia o serviço Nginx
echo "Iniciando o serviço Nginx..."
sudo service nginx start

# Verifica o status do Nginx
echo "Verificando o status do Nginx..."
if pgrep nginx >/dev/null; then
    echo "Nginx instalado e em execução com sucesso!"
else
    echo "Falha ao iniciar o Nginx."
    exit 1
fi

echo "Instalação e configuração do Nginx concluídas com sucesso!"
