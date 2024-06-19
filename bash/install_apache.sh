#!/bin/bash

LOG_FILE="/usr/local/logs/install_apache.log"
BACKUP_DIR="/usr/local/backups/apache2"

exec > >(tee -a $LOG_FILE) 2>&1

# Atualiza os pacotes
echo "Atualizando os pacotes..."
sudo apt-get update -y

# Faz o backup da configuração existente do Apache
APACHE_CONF="/etc/apache2/apache2.conf"
mkdir -p $BACKUP_DIR
cp $APACHE_CONF $BACKUP_DIR/apache2.conf.$(date +%F_%T)
echo "Backup da configuração do Apache criado em $BACKUP_DIR"

# Instala o Apache
echo "Instalando o Apache..."
sudo apt-get install apache2 -y

# Inicia o serviço Apache
echo "Iniciando o serviço Apache..."
sudo service apache2 start

# Verifica o status do Apache
echo "Verificando o status do Apache..."
if pgrep apache2 >/dev/null; then
    echo "Apache instalado e em execução com sucesso!"
else
    echo "Falha ao iniciar o Apache."
    exit 1
fi

echo "Instalação e configuração do Apache concluídas com sucesso!"
