#!/bin/bash

LOG_FILE="/usr/local/logs/test_servers.log"
exec > >(tee -a $LOG_FILE) 2>&1

echo "Testando os servidores..."

# Testa o Nginx
if curl -s --head  --request GET http://localhost:8080 | grep "200 OK" > /dev/null; then 
   echo "Nginx está funcionando corretamente"
else
   echo "Falha no teste do Nginx"
   exit 1
fi

# Testa o Apache2
if curl -s --head  --request GET http://localhost:8081 | grep "200 OK" > /dev/null; then 
   echo "Apache2 está funcionando corretamente"
else
   echo "Falha no teste do Apache2"
   exit 1
fi

echo "Testes concluídos com sucesso!"
