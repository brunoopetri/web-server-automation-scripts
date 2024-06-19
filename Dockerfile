# Usar a imagem base do Ubuntu
FROM ubuntu:20.04

# Variáveis de ambiente para evitar prompts durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar o sistema e instalar dependências necessárias
RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    apache2 \
    nginx \
    zip \
    unzip && \
    apt-get clean

# Criar diretórios para scripts e logs
RUN mkdir -p /usr/local/scripts/bash /usr/local/logs /usr/local/backups

# Copiar scripts para o contêiner
COPY bash/* /usr/local/scripts/bash/

# Dar permissão de execução aos scripts Bash
RUN chmod +x /usr/local/scripts/bash/*.sh

# Expor as portas dos servidores web
EXPOSE 80 443 8080

# Definir o diretório de trabalho
WORKDIR /usr/local/scripts

# Comando padrão ao iniciar o contêiner
CMD ["bash", "-c", "/usr/local/scripts/bash/install_apache.sh && /usr/local/scripts/bash/install_nginx.sh"]
