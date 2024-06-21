#!/bin/bash

LOG_FILE="/usr/local/logs/install_apache.log"
BACKUP_DIR="/usr/local/backups/apache"

exec > >(tee -a $LOG_FILE) 2>&1

# Atualiza os pacotes
echo "Atualizando os pacotes..."
sudo apt-get update -y

# Instala e configura o Apache2
echo "Instalando e configurando o Apache2..."
sudo apt-get install apache2 -y
cat <<EOT > /etc/apache2/ports.conf
Listen 8081
EOT
cat <<EOT > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:8081>
    DocumentRoot /var/www/html
    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>
EOT
sudo a2enmod rewrite
sudo service apache2 start

# Verifica o status do Apache2
echo "Verificando o status do Apache2..."
if pgrep apache2 >/dev/null; then
    echo "Apache2 instalado e em execução com sucesso!"
else
    echo "Falha ao iniciar o Apache2."
    exit 1
fi

echo "Instalação e configuração do Apache2 concluídas com sucesso!"
