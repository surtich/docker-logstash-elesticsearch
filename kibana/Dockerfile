FROM dockerfile/ubuntu

#Install Kibana
ENV KIBANA_VERSION 4.0.1

RUN \
    curl https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz | tar zxv -C /opt

CMD  ["/opt/kibana-4.0.1-linux-x64/bin/kibana", "-e", "http://elasticsearch:9200"]

EXPOSE 5601