# Automação de Configuração com Shell Scripting

Este repositório contém scripts para automatizar a configuração de ambientes de desenvolvimento. Inclui scripts para instalação e configuração de servidores web (Apache/Nginx) em sistemas operacionais baseados em Unix (Ubuntu/Debian).

## Estrutura do Repositório

- `bash/`: Scripts em Bash para sistemas baseados em Unix (Ubuntu/Debian).
  - `install_apache.sh`: Script para instalar e configurar o Apache.
  - `install_nginx.sh`: Script para instalar e configurar o Nginx.


## Uso

### Bash

1. Clone o repositório:
   ```bash
   git clone https://github.com/brunoopetri/web-server-automation-scripts.git
   cd web-server-automation-scripts/bash


Explicação Detalhada

1. Atualização de Pacotes (Bash):

sudo apt update -y: Atualiza a lista de pacotes disponíveis e suas versões para garantir que estamos instalando as versões mais recentes dos pacotes.

2. Instalação do Servidor Web (Bash):

sudo apt install apache2 -y: Instala o Apache.
sudo apt install nginx -y: Instala o Nginx.

3. Habilitação e Início dos Serviços (Bash):

sudo systemctl enable apache2: Habilita o serviço Apache para iniciar automaticamente no boot.
sudo systemctl start apache2: Inicia o serviço Apache.
sudo systemctl enable nginx: Habilita o serviço Nginx.
sudo systemctl start nginx: Inicia o serviço Nginx.

4. Verificação do Status dos Serviços (Bash):

sudo systemctl status apache2: Verifica o status do serviço Apache.
sudo systemctl status nginx: Verifica o status do serviço Nginx.

Esses scripts são básicos e devem ser adaptados conforme necessário para ambientes específicos e requisitos de segurança. Eles fornecem uma base sólida para automatizar a configuração de servidores web, reduzindo o tempo e a probabilidade de erros na configuração manual.