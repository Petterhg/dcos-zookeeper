FROM java:openjdk-8-jre

ARG BIN_VERSION=zookeeper-3.4.10

WORKDIR /usr/share/zookeeper

# Install and set everything up
RUN apt-get update && \
    apt-get install -y wget tar netcat
RUN wget -q -N http://apache.mirrors.spacedump.net/zookeeper/stable/$BIN_VERSION.tar.gz && \
    tar --strip-components=1 -C /usr/share/zookeeper -xvf ${BIN_VERSION}.tar.gz && \
    rm $BIN_VERSION.tar.gz && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# default parameters for config file:
ENV tickTime=2000
ENV dataDir=/var/lib/zookeeper/
ENV dataLogDir=/var/log/zookeeper/
ENV initLimit=5
ENV syncLimit=2

# add startup script
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/usr/share/zookeeper/entrypoint.sh"]
