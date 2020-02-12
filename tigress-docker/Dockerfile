# syntax=docker/dockerfile:experimental
FROM ubuntu:16.04 as base
RUN apt update && apt install sudo
RUN useradd -u 1000 -m user
RUN gpasswd -a user sudo
RUN echo 'user:user' | chpasswd

FROM base
RUN apt update && apt install gcc unzip libdata-dumper-concise-perl libc6-dev-i386 -y
ADD ./tigress-Linux-x86_64-unstable.zip /opt/
RUN unzip /opt/tigress-Linux-x86_64-unstable.zip -d /opt/
RUN chown -R user:user /opt/tigress-unstable

USER user
ENV TIGRESS_HOME "/opt/tigress-unstable"
ENV PATH $PATH:"/opt/tigress-unstable"
