FROM dockerfile/ubuntu

RUN \ 
    apt-get update && \
    apt-get install -y git golang && \
    mkdir -p /opt/logstash/ssl && \
    cd /opt && \
    git clone git://github.com/elasticsearch/logstash-forwarder.git && \
    cd /opt/logstash-forwarder/ && \
    go build && \
    mkdir -p /etc/logstash/ssl /etc/logstash-forwarder

COPY logstash-forwarder.conf /etc/logstash-forwarder/

CMD /opt/logstash-forwarder/logstash-forwarder -config /etc/logstash-forwarder/logstash-forwarder.conf
