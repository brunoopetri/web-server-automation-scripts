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