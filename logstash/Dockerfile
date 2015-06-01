FROM java:8-jre

#Install Logstash
RUN \ 
    cd /opt && \
    curl https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz | tar zxv && \
    chown -R root:root /opt/logstash-1.4.2 && \
    /opt/logstash-1.4.2/bin/plugin install contrib && \
    mkdir -p /etc/logstash

RUN \ 
    apt-get update && \
    apt-get install -y golang
    
COPY lc-tlscert.go dat /opt/

RUN \ 
    cd /opt && \
    go build lc-tlscert.go

COPY logstash.conf /etc/logstash/

COPY start.sh /opt/logstash-1.4.2/bin/

CMD /opt/logstash-1.4.2/bin/start.sh

EXPOSE 5000
