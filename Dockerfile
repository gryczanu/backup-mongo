FROM ubuntu:20.04

RUN apt-get update && apt-get install -y wget gnupg
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | \
    tee /etc/apt/sources.list.d/mongodb-org-4.4.list && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -


RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y mysql-client &&\
    apt-get install -y mongodb-database-tools &&\
    apt-get install -y --no-install-recommends wget ca-certificates

RUN apt-get update && \
   apt-get install -y --no-install-recommends wget ca-certificates


RUN set -ex && \
    wget -O azcopy.tar.gz https://aka.ms/downloadazcopy-v10-linux  && \
    tar -xzf azcopy.tar.gz && rm -f azcopy.tar.gz && \
    cp $(find . -name "azcopy*" -type d)/azcopy /usr/sbin/ && \
    rm -rf azcopy* 

RUN mkdir -p /backups
RUN mkdir -p /scripts
WORKDIR /scripts
RUN chmod -R 777 /backups
CMD ["/bin/bash"]
