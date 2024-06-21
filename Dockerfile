# Usar a imagem base do Ubuntu
FROM ubuntu:20.04

# Variáveis de ambiente para evitar prompts durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar o sistema e instalar dependências necessárias
RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    nginx \
    apache2 && \
    apt-get clean

# Criar diretórios para scripts e logs
RUN mkdir -p /usr/local/scripts/bash /usr/local/logs /usr/local/backups

# Copiar scripts para o contêiner
COPY bash/install_nginx.sh /usr/local/scripts/bash/install_nginx.sh
COPY bash/install_apache.sh /usr/local/scripts/bash/install_apache.sh

# Dar permissão de execução aos scripts Bash
RUN chmod +x /usr/local/scripts/bash/install_nginx.sh
RUN chmod +x /usr/local/scripts/bash/install_apache.sh

# Expor as portas dos servidores web
EXPOSE 8080 8081

# Definir o diretório de trabalho
WORKDIR /usr/local/scripts

# Comando padrão ao iniciar o contêiner
CMD ["bash", "-c", "/usr/local/scripts/bash/install_nginx.sh && /usr/local/scripts/bash/install_apache.sh && tail -f /dev/null"]
