FROM ubuntu:bionic

RUN apt-get update \
     && apt-get install --no-install-recommends -y npm default-jre \
     && rm -rf /var/lib/apt/lists/* \
     && npm install -g vnu-jar bootlint stylelint stylelint-config-recommended