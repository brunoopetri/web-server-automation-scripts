# Automação de Configuração com Shell Scripting

Este repositório contém scripts para automatizar a configuração de ambientes de desenvolvimento. Inclui scripts para instalação e configuração de servidores web (Apache/Nginx) em sistemas operacionais baseados em Unix (Ubuntu/Debian).


## Estrutura do Repositório

Descrição dos Arquivos e Diretórios

1. `Dockerfile`

ㅤArquivo de configuração para a criação da imagem Docker. Este arquivo especifica a instalação das dependências, a cópia dos scripts para dentro do contêiner e define o comando de inicialização padrão.

2. `docker-compose.yml`

ㅤArquivo de configuração do Docker Compose, que define como os serviços devem ser orquestrados.

3. `logs/`

ㅤDiretório onde os logs das instalações e operações dos serviços serão armazenados. Este diretório é montado como um volume no contêiner Docker.

4. `backups/`

ㅤDiretório onde os backups das configurações dos serviços serão armazenados. Este diretório também é montado como um volume no contêiner Docker.

5. `scripts/`

ㅤDiretório que contém os scripts usados para instalar e configurar os serviços web Apache e Nginx.

ㅤㅤ5.1. `scripts/bash/`

ㅤㅤSubdiretório contendo os scripts Bash específicos para a instalação dos serviços.

ㅤ  - `install_apache.sh`: Script para instalar e configurar o Apache.

ㅤ  - `install_nginx.sh`: Script para instalar e configurar o Nginx.


## Instruções de Uso:

### Bash

1. Clone o repositório:

       git clone https://github.com/brunoopetri/web-server-automation-scripts.git
   
       cd web-server-automation-scripts/bash

2. Construa e inicie os serviços com Docker Compose:

       docker-compose up --build -d

3. Verifique se os serviços estão em execução:

       docker ps

4. Acesse os serviços via navegador:

 - Apache: http://localhost
 - Nginx: http://localhost:8080

Seguindo essa estrutura, você deve conseguir gerenciar e visualizar facilmente a configuração e automação dos servidores web Apache e Nginx no ambiente Docker.

Esses scripts são básicos e devem ser adaptados conforme necessário para ambientes específicos e requisitos de segurança. Eles fornecem uma base sólida para automatizar a configuração de servidores web, reduzindo o tempo e a probabilidade de erros na configuração manual.

ㅤㅤ4.1  Verificação dos Serviços Apache e Nginx:

ㅤ    Para garantir que os serviços Apache e Nginx estão em execução dentro do contêiner interativamente:

<img width="1277" alt="Captura de tela 2024-06-19 184113" src="https://github.com/brunoopetri/footy108/assets/98756562/bc944ff0-4f0f-4a40-b011-be14250113df">

### Descrição do install_apache.sh

. Esta linha define o interpretador a ser utilizado para executar o script, neste caso, o Bash.
ㅤ`#!/bin/bash`

. Essas linhas definem variáveis que armazenam o caminho do arquivo de log e do diretório de backup, respectivamente.
ㅤ`LOG_FILE="/usr/local/logs/install_apache.log"`
ㅤ`BACKUP_DIR="/usr/local/backups/apache"`

. Redireciona a saída padrão e a saída de erro para o arquivo de log definido em LOG_FILE, permitindo também que a saída seja exibida no terminal em tempo real.
ㅤ`exec > >(tee -a $LOG_FILE) 2>&1`

Imprime uma mensagem indicando que os pacotes estão sendo atualizados e executa o comando para atualizar a lista de pacotes do sistema.
ㅤ`echo "Atualizando os pacotes..."`
ㅤ`sudo apt-get update -y`

Imprime uma mensagem indicando que o Apache2 está sendo instalado e executa o comando para instalar o servidor Apache2.
ㅤ`echo "Instalando e configurando o Apache2..."`
ㅤ`sudo apt-get install apache2 -y`

Modifica o arquivo de configuração do Apache para que ele escute na porta 8081 em vez da porta padrão (80).
ㅤ`cat <<EOT > /etc/apache2/ports.conf`
ㅤ`Listen 8081`
ㅤ`EOT`

Cria um novo arquivo de configuração de site padrão para o Apache, definindo que o servidor irá responder na porta 8081 e que o diretório raiz dos documentos será /var/www/html.
ㅤ`cat <<EOT > /etc/apache2/sites-available/000-default.conf
ㅤ`<VirtualHost *:8081>
ㅤ    `DocumentRoot /var/www/html`
ㅤ    `<Directory /var/www/html>`
ㅤ        `Options Indexes FollowSymLinks`
ㅤ        `AllowOverride None`
 ㅤ       `Require all granted`
 ㅤ   `</Directory>`
ㅤ`</VirtualHost>`
ㅤ`EOT`

Habilita o módulo rewrite do Apache, que permite a reescrita de URLs
ㅤ`sudo a2enmod rewrite`

Inicia o serviço Apache.
ㅤ`sudo service apache2 start`

Imprime uma mensagem indicando que o status do Apache2 está sendo verificado. Se o processo do Apache2 estiver em execução, imprime uma mensagem de sucesso; caso contrário, imprime uma mensagem de falha e encerra o script com código de erro 1.
ㅤ`echo "Verificando o status do Apache2..."`
ㅤ`if pgrep apache2 >/dev/null; then`
 ㅤ   `echo "Apache2 instalado e em execução com sucesso!"`
ㅤ`else`
ㅤ    `echo "Falha ao iniciar o Apache2."`
ㅤ    `exit 1`
ㅤ`fi`

Imprime uma mensagem final indicando que a instalação e configuração do Apache2 foram concluídas com sucesso.
ㅤ`echo "Instalação e configuração do Apache2 concluídas com sucesso!"`
