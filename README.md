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

 - Apache: http://localhost:8081
 - Nginx: http://localhost:8080

Seguindo essa estrutura, você deve conseguir gerenciar e visualizar facilmente a configuração e automação dos servidores web Apache e Nginx no ambiente Docker.



ㅤㅤ4.1  Para visualizar a saída do `script test_servers.sh` e garantir que os testes automáticos dos servidores Nginx e Apache2 foram executados com sucesso, você pode seguir estas etapas:

ㅤㅤㅤApós iniciar o contêiner, verifique os logs do test_servers, no terminal:

    ㅤㅤㅤdocker exec -it webserver_container cat /usr/local/logs/test_servers.log

ㅤ

ㅤㅤㅤ- Exemplo de visualização logs do test_servers:

ㅤ<img width="1278" alt="test_servers" src="https://github.com/brunoopetri/web-server-automation-scripts/assets/98756562/822381bf-ce2f-43cc-a10c-ce85a61be94e">

ㅤ    Para garantir que os serviços Apache e Nginx estão em execução dentro do contêiner interativamente:

<img width="1279" alt="logs_servers" src="https://github.com/brunoopetri/web-server-automation-scripts/assets/98756562/53e6f0dd-c15d-4683-95b4-c1de030b8f78">
ㅤ

- Apache: http://localhost:8081:

<img width="1280" alt="apache2" src="https://github.com/brunoopetri/web-server-automation-scripts/assets/98756562/d1796c00-069a-428e-b212-97686f5bf655">
ㅤ

- Nginx: http://localhost:8080:
  
<img width="1280" alt="nginx" src="https://github.com/brunoopetri/web-server-automation-scripts/assets/98756562/62083e87-9252-41e1-994f-d46cb1b51bd2">


### Descrição do install_apache.sh

. Vamos analisar cada parte do script:

. #!/bin/bash:
Essa linha define o interpretador de script como o Bash (Bourne Again Shell). Ela deve estar no início de qualquer script Bash.

. LOG_FILE="/usr/local/logs/install_apache.log":
Essa linha define uma variável chamada LOG_FILE com o caminho para o arquivo de log onde as mensagens serão registradas durante a instalação e configuração do Apache2.

. BACKUP_DIR="/usr/local/backups/apache":
Essa linha define outra variável chamada BACKUP_DIR com o caminho para o diretório onde os backups relacionados ao Apache2 serão armazenados.

. exec > >(tee -a $LOG_FILE) 2>&1:
Essa linha redireciona a saída padrão (stdout) e a saída de erro (stderr) para o arquivo de log especificado.
O comando tee -a grava a saída tanto no arquivo quanto na tela.

. Atualização de Pacotes:
O script executa sudo apt-get update -y para atualizar os pacotes do sistema.

. Instalação e Configuração do Apache2:
O Apache2 é instalado com sudo apt-get install apache2 -y.
O arquivo de configuração ports.conf é modificado para ouvir na porta 8081.
O arquivo de configuração 000-default.conf é criado para definir um VirtualHost na porta 8081, apontando para o diretório /var/www/html.
O módulo rewrite é habilitado.
O serviço Apache2 é iniciado.

. Verificação do Status do Apache2:
O script verifica se o processo do Apache2 está em execução usando pgrep.
Se o processo estiver ativo, exibe uma mensagem de sucesso; caso contrário, exibe uma mensagem de falha e sai com código de erro 1.

. Mensagem de Conclusão:
O script exibe uma mensagem indicando que a instalação e configuração do Apache2 foram concluídas com sucesso.
`echo "Instalação e configuração do Apache2 concluídas com sucesso!"`
ㅤ

Esses scripts são básicos e devem ser adaptados conforme necessário para ambientes específicos e requisitos de segurança. Eles fornecem uma base sólida para automatizar a configuração de servidores web, reduzindo o tempo e a probabilidade de erros na configuração manual.
