FROM registry.access.redhat.com/ubi9/nodejs-20-minimal:1-47.1716472878

USER root

RUN microdnf update -y && microdnf install -y file openssl wget

RUN groupadd -g 1011 userxyz1 && \
    mkdir -p /opt/cudar &&\
    useradd -u 1009 -r -d /opt/cudar -g userxyz1 userxyz1 && \
    chown -R userxyz1:userxyz1 /opt/cudar

RUN npm install pg

RUN npm list

USER userxyz1

WORKDIR /opt/cudar
