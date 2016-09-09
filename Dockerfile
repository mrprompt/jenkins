FROM jenkins

MAINTAINER Thiago Paes <mrprompt@gmail.com>

# Rodando os comandos como root
USER root

# substituindo a shell padrao
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# instalando o essencial
RUN apt-get update && apt-get install -y build-essential php5-cli php5-curl php5-json php5-intl php5-xsl nodejs nodejs-legacy npm

# instalando o composer
RUN wget https://getcomposer.org/composer.phar; chmod +x composer.phar; mv composer.phar /usr/bin/composer

# Retornando ao usuario normal do Jenkins
USER jenkins

# Expondo a porta padrao
EXPOSE 8080

# Ponto de entrada é o próprio Jenkins
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
