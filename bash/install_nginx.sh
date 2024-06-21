#!/bin/bash

LOG_FILE="/usr/local/logs/install_nginx.log"
BACKUP_DIR="/usr/local/backups/nginx"

exec > >(tee -a $LOG_FILE) 2>&1

# Atualiza os pacotes
echo "Atualizando os pacotes..."
sudo apt-get update -y

# Instala e configura o Nginx
echo "Instalando e configurando o Nginx..."
sudo apt-get install nginx -y
cat <<EOT > /etc/nginx/sites-available/default
server {
    listen 8080;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }
}
EOT
sudo ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
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
