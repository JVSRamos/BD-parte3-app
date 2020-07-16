# Banco de Dados, parte3 - Projeto Final da disciplina

Trabalho para a disciplina SCC0240 - Bases de Dados, aonde iremos construir uma base de dados para nosso projeto de economia colaborativa baseada na temática de "mudança de casa".

Para conseguir construir a base de dados com sucesso, siga as seguintes instruções:

1. Instale o Docker na sua máquina [https://docs.docker.com/get-docker/]. Este programa será necessário para rodar os containers que contém a base de dados PostgreSQL e o pgAdmin (interface gráfica para interagir com a base).

2. Rode o comando `docker-compose up -d`. Caso você não tenha as imagens do Postgres e do pgAdmin, essa parte levará um tempo maior pois o Docker irá baixar essas imagens para você.

3. Espere ele dar "ok" para todas as partes que formam a "network". Assim que tudo estiver certo, já pode começar a interagir com o banco!

_OBS: configuramos o Docker para já executar os scripts "schema" e "data-setup" antes de liberar o acesso ao banco, então você já poderá se conectar com um banco populado sem precisar tocar nos arquivos sql ou mexer no psql!_
