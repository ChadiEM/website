FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs default-jre

RUN npm install -g vnu-jar bootlint 
