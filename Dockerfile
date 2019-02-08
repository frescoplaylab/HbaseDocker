FROM ubuntu:16.04
RUN mkdir /opt/mdp
RUN apt update && apt install curl -y \
    && apt install default-jdk -y \
    && curl -s "https://archive.apache.org/dist/hbase/2.0.0/hbase-2.0.0-bin.tar.gz"   | tar xzvf -  -C /opt/mdp



COPY ./hbase.conf /opt/mdp/hbase-2.0.0/conf/hbase-env.sh
COPY ./hbase-site.xml /opt/mdp/hbase-2.0.0/conf/hbase-site.xml

 
ENV PATH=${PATH}:/opt/mdp/hbase-2.0.0/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/

COPY ./start.sh .
RUN chmod +x ./start.sh
ENTRYPOINT ["/bin/bash" ,"./start.sh" ]